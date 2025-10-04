<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>API JUSO</title>
<style>
  * {
    box-sizing: border-box;
  }
  html {
    font-size: 10px;
    font-weight: 500;
    font-family: sans-serif;
  }
  body {
    padding: 0;
    margin: 0;
    width: 100vw;
    height: 100vh;
  }
  #address-modal {
    position: fixed;
    display: none;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    background-color: rgba(33, 33, 33, 0.5);
  }
  #address-modal > div:nth-of-type(1) {
    position: absolute;
    width: 50rem;
    height: 70rem;
    background-color: #FFFAFA;
    box-shadow: 0 0 3px #FFF;
    border-radius: 1rem;
    display: flex;
    flex-direction: column;
  }
  #address-modal > div:nth-of-type(1) > div:nth-of-type(1),
  #address-modal > div:nth-of-type(1) > div:nth-of-type(2) {
    width: 100%;
    height: auto;
    display: flex;
    align-items: center;
    padding-left: 1rem;
    padding-right: 1rem;
    margin-top: 1rem;
    margin-bottom: 1rem;
  }
  #addr-search {
    width: calc(100% - 15rem);
    height: 4rem;
    outline: none;
    border: none;
    padding-left: 0.5rem;
    font-size: 1.5rem;
    border-top-left-radius: 0.5rem;
    border-bottom-left-radius: 0.5rem;
    border: 1px solid rgba(33, 33, 33, 0.2);
  }
  #addr-search-label {
    display: inline-block;
    text-align: center;
    width: 15rem;
    height: 4rem;
    line-height: 4rem;
    font-size: 1.7rem;
    background-color: #00AA00;
    color: white;
    border-top-right-radius: 0.5rem;
    border-bottom-right-radius: 0.5rem;
    cursor: pointer;
  }
  #address-modal > div:nth-of-type(1) > div:nth-of-type(2) {
    flex-direction: column;
    height: calc(100% - 18rem);
    gap: 0.5rem;
  }
  #addr-list {
    width: 100%;
    height: 6rem;
    border: 1px solid rgba(33, 33, 33, 0.2);
    border-radius: 1rem;
    display: flex;
    flex-direction: column;
    padding: 0.5rem;
    padding-left: 1rem;
    cursor: pointer;
    gap: 0.5rem;
  }
  #addr-list:hover {
    border: 1px solid rgba(0, 170, 0, 0.3);
    box-shadow:
      0 0 3px rgba(33, 33, 33, 0.2),
      0 0 6px rgba(0, 170, 0, 0.5);
  }
  #addr-list .addr-road {
    font-size: 1.5rem;
  }
  #addr-list .addr-jibun::before {
    content: '지번';
    color: #00AA00;
    display: inline-block;
    width: 3.5rem;
    height: 1.7rem;
    line-height: 1.7rem;
    text-align: center;
    padding: 0.1rem 0.5rem;
    border: 1px solid rgba(33, 33, 33, 0.2);
    border-radius: 0.5rem;
    margin-right: 0.5rem;
    justify-content: center;
  }
  #addr-list .addr-jibun {
    font-size: 1.2rem;
    line-height: 1.7rem;
  }
  #addr-paging {
    width: 100%;
    height: 4rem;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 1rem;
    margin-bottom: 1rem;
  }
  #addr-paging > div:not(#paging-addr-btn) {
    width: 3rem;
    text-align: center;
    font-size: 1.3rem;
    cursor: pointer;
    user-select: none;
  }
  #addr-paging > div:not(#paging-addr-btn):hover {
    transform: scale(1.1);
  }
  #addr-paging > div:not(#paging-addr-btn):active {
    transform: scale(1);
  }
  #address-modal > div:nth-of-type(1) > div:nth-of-type(4) {
    display: flex;
    justify-content: end;
    padding-left: 1rem;
    padding-right: 1rem;
  }
  #address-close-btn {
    width: 10rem;
    height: 3rem;
    background-color: #DC3545;
    color: white;
    font-size: 1.2rem;
    border: none;
    border-radius: 0.5rem;
    text-transform: uppercase;
    letter-spacing: 1px;
    cursor: pointer;
  }
  #address-close-btn:hover {
    transform: scale(1.1);
  }
  #address-close-btn:active {
    transform: scale(1);
  }
  #paging-addr-btn {
    display: flex;
    align-items: center;
    gap:2rem;
    font-size: 1.5rem;
    cursor: pointer;
    user-select: none;
  }
</style>
</head>
<body>
  <div id="address-modal">
    <div>
      <!-- 검색창 -->
      <div>
        <input id="addr-search" type="text" plcaeholder="도로명 주소를 검색하세요.">
        <label id="addr-search-label" for="addr-search">주소 검색</label>
      </div>

      <!-- 주소가 나오는 리스트 부분 -->
      <div id="addr-list-box"></div>
      <!-- 페이징 하는 부분 -->
      <div id="addr-paging">
        <div id="beforeAddr">◀</div>
        <div>1</div>
        <div>2</div>
        <div>3</div>
        <div>4</div>
        <div>5</div>
        <div id="afterAddr">▶</div>
      </div>
      
      <!-- 닫기버튼 부분 -->
      <div>
        <button id="address-close-btn">Close</button>
      </div>
    </div>
  </div>
  <input id="address" type="text" style="width: 50rem; height: 3rem; line-height: 3rem;" name="gcm_addr">
<script src="js/render.js"></script>
<script src="js/modal.js"></script>
<script src="js/paging.js"></script>
<script>
  /*
  function jusoCall(nowPage, keyword) {
    const url = `https://business.juso.go.kr/addrlink/addrLinkApi.do?confmKey=${JUSO_KEY}&resultType=json&currentPage=${nowPage}&countPerPage=8&keyword=${keyword}`;
    console.log(url);
    return url;
  }
  
  const JUSO = {
    call(nowPage, keyword, callback) {
      fetch(jusoCall(nowPage, keyword))
      .then(response => response.json())
      .then(data => {
        let juso = data.results;
        callback(juso);
      })
    }
  }

  const currentPage = {
    _pageNum:1,
    get Page() {
      return this._pageNum;
    },
    set Page(currentPage) {
      this._pageNum = currentPage;
    }
  }

  const arrowPage = {
    _pageNum:1,
    get Page() {
      return this._pageNum;
    },
    set Page(arrowPage) {
      this._pageNum = arrowPage;
    }
  }

  const addrSearchBtn = document.getElementById('addr-search-label');
  addrSearchBtn.addEventListener('click', () => {
    const keyword = document.getElementById('addr-search').value;
    arrowPage.Page = 1;

    JUSO.call(1, keyword, (address) => {
      renderer(address);
      pagingRenderer(address, keyword);
    })

  })

  function renderer(address) {
    const addrEl = document.getElementById('addr-list-box');
    addrEl.innerHTML = '';
    address.juso.forEach(addr => {
      const list = document.createElement('div')
      list.innerHTML = `
      <div class="addr-road">${addr.roadAddrPart1} ${addr.bdNm}</div>
      <div class="addr-jibun">${addr.jibunAddr}</div>
      `;
      
      list.addEventListener('click', () => {
        alert('날 선택했따!');
      });
      
      list.id = 'addr-list';
      addrEl.appendChild(list);
    });
  }

  function pagingRenderer(address, keyword) {
    let totalCount = address.common.totalCount;
    let countPerPage = address.common.countPerPage;
    let totalPage = Math.ceil(totalCount / countPerPage);

    const pagingTag = document.getElementById('addr-paging');
    pagingTag.innerHTML = '';

    // <<
    const startTag = document.createElement('div');
    startTag.textContent = '◀◀';
    startTag.addEventListener('click', () => {
      arrowPage.Page = 1;
      JUSO.call(arrowPage.Page, keyword, (address) => {
        renderer(address);
        pagingRenderer(address, keyword);
      })
    })
    pagingTag.appendChild(startTag);

    // <
    const beforeTag = document.createElement('div');
    beforeTag.textContent = '◀';
    beforeTag.addEventListener('click', () => {
      if(arrowPage.Page === 1) return;

      arrowPage.Page = arrowPage.Page - 5;
      if(arrowPage.Page < 1) arrowPage.Page = 1;
      JUSO.call(arrowPage.Page, keyword, (address) => {
        renderer(address);
        pagingRenderer(address, keyword);
      })
    });
    pagingTag.appendChild(beforeTag);

    // 1 to 5
    pagingNumberRenderer(address, keyword);

    // >
    const afterTag = document.createElement('div');
    afterTag.textContent = '▶';
    afterTag.addEventListener('click', () => {
      if(totalPage < 5) return;

      arrowPage.Page = arrowPage.Page + 5;
      if(arrowPage.Page > totalPage) arrowPage.Page = totalPage;
      JUSO.call(arrowPage.Page, keyword, (address) => {
        renderer(address);
        pagingRenderer(address, keyword);
      });
    });
    pagingTag.appendChild(afterTag);

    // >>
    const endTag = document.createElement('div');
    endTag.textContent = '▶▶';
    endTag.addEventListener('click', () => {
      if(totalPage < 5) {
        JUSO.call(totalPage, keyword, (address) => {
          renderer(address);
        });
        return;
      }
      arrowPage.Page = totalPage;
      JUSO.call(totalPage, keyword, (address) => {
        renderer(address);
        pagingRenderer(address, keyword);
      });
    });
    pagingTag.appendChild(endTag);
  }

  function pagingNumberRenderer(address, keyword) {
    const pagingTag = document.getElementById('addr-paging');
    const totalPage = Math.ceil(address.common.totalCount / 8);
    let startNum = arrowPage.Page;
    for(let i = startNum; i <= startNum + 4; i++) {
      if(i > totalPage) break;
      const numberTag = document.createElement('div');
      numberTag.textContent = i;
      numberTag.addEventListener('click', () => {
        JUSO.call(i, keyword, (address) => {
          renderer(address);
        })
      });
      pagingTag.appendChild(numberTag);
    }
  }
  */

  const AddressPagingManager = new PagingManager(); 

  const ADDR_API_URL = 'https://business.juso.go.kr/addrlink/addrLinkApi.do';
  const CONF_KEY = 'devU01TX0FVVEgyMDI1MTAwMTExMDUxNzExNjI5Njg=';
  const COUNT_PER_PAGE = 8;
  const PAGING_BLOCK_SIZE = 5;

  const addrs = document.getElementById('address');
  addrs.addEventListener('click', () => {
    document.getElementById('addr-search').value = '';
    document.getElementById('addr-list-box').innerHTML = '';
    document.getElementById('addr-paging').innerHTML = '';
    
    displayOpen('address-modal', 'flex');
  });

  document.getElementById('address-close-btn').addEventListener('click', () => {
    document.getElementById('address-modal').style.display = 'none';
  });

  function searchAddress(page, keyword) {
    if (keyword === '') {
      alert('주소를 입력하세요.');
      return;
    }

    AddressPagingManager.nowPage = page;
    
    Render.callJSON(
      ADDR_API_URL,
      {
        confmKey: CONF_KEY,
        resultType: 'json',
        currentPage: AddressPagingManager.nowPage,
        countPerPage: COUNT_PER_PAGE,
        keyword: keyword
      },
      'addr-list-box',
      
      (json) => {
        const addrListBox = document.getElementById('addr-list-box');
        addrListBox.innerHTML = '';

        const jusoList = json.results.juso;
        if (jusoList) {
          jusoList.forEach(data => {
            addrListBox.appendChild(Render.getComponent('SJS-address-list', data));
          });
        }
        
        const common = json.results.common;
        const totalCount = parseInt(common.totalCount, 10);
        const totalPage = Math.ceil(totalCount / COUNT_PER_PAGE);
        
        AddressPagingManager.renderer({
          start: 'SJS-address-start',
          middle: 'SJS-address-middle',
          end: 'SJS-address-end'
        },
        'addr-paging',
        totalPage,
        PAGING_BLOCK_SIZE);
      }
    );
  }

  // 숫자 페이징 버튼
  AddressPagingManager.setComponent('SJS-address-middle', (data) => {
    const div = document.createElement('div');
    div.textContent = `${data.currentPage}`;

    if (data.currentPage === data.activePage) {
        div.style.fontWeight = 'bold';
        div.style.color = '#00AA00';
        div.style.fontSize = '1.5rem';
    }

    div.addEventListener('click', () => {
      const address = document.getElementById('addr-search').value;
      searchAddress(data.currentPage, address);
    });
    return div;
  });

  // ◀ 버튼
  AddressPagingManager.setComponent('SJS-address-start', (data) => {
    const div = document.createElement('div');
    div.textContent = '◀';

    const backPage = data.start - data.pageSize;

    if (data.start <= 1) {
      div.style.opacity = '0.3';
      div.style.cursor = 'default';
      return div;
    }
    
    div.addEventListener('click', () => {
      const address = document.getElementById('addr-search').value;
      searchAddress(backPage, address);
    });
    return div;
  });

  // ▶ 버튼
  AddressPagingManager.setComponent('SJS-address-end', (data) => {
    const div = document.createElement('div');
    div.textContent = '▶';

    const nextPage = data.end + 1;
    
    if (nextPage > data.totalPage) {
        div.style.opacity = '0.3';
        div.style.cursor = 'default';
        return div;
    }

    div.addEventListener('click', () => {
      const address = document.getElementById('addr-search').value;
      searchAddress(nextPage, address);
    });
    return div;
  });

  // 주소 리스트 렌더링 부분임당
  Render.setComponent('SJS-address-list', (data) => {
    const tag = document.createElement('div');
    tag.id = 'addr-list';
    tag.innerHTML = `
    <div class="addr-road">${data.roadAddrPart1} ${data.bdNm}</div>
    <div class="addr-jibun">${data.jibunAddr}</div>
    `;

    tag.addEventListener('click', () => {
      const input = document.getElementById('address');
      input.value = `${data.roadAddrPart1} ${data.bdNm}`;

      document.getElementById('address-modal').style.display = 'none';
    });

    return tag;
  });

  const addrSearchInput = document.getElementById('addr-search');
  const addrSearchBtn = document.getElementById('addr-search-label');

  addrSearchBtn.addEventListener('click', () => {
    const address = addrSearchInput.value;
    
    searchAddress(1, address);
  });
  
  addrSearchInput.addEventListener('keypress', (e) => {
      if (e.key === 'Enter') {
          const address = addrSearchInput.value;
          searchAddress(1, address);
      }
  });

  const modal = document.getElementById('address-modal');
  modal.style.display = 'flex';

</script>
</body>
</html>