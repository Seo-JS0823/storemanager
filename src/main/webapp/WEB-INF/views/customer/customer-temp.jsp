<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&"/>
  <link rel="stylesheet" href="/css/reset.css">
  <link rel="stylesheet" href="/css/wrap.css">
  <link rel="stylesheet" href="/css/m-header.css">
  <title>거래처관리</title>
  <style>
    @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
    body {
      font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
      background-color: #f8fafc;
      color: #222;
    }
    /* 모달 전체 */
    #modal-container {
      position: fixed; top: 0; right: 0;
      width: 420px; height: 100%;
      background: rgba(255,255,255,0.9);
      backdrop-filter: blur(15px);
      box-shadow: -8px 0 30px rgba(0,0,0,0.15);
      transform: translateX(100%);
      transition: transform 0.35s cubic-bezier(0.4, 0, 0.2, 1);
      z-index: 1000; display: flex; flex-direction: column;
      border-left: 1px solid rgba(0,0,0,0.08);
    }
    #modal-overlay {
      position: fixed; top:0; left:0; width:100%; height:100%;
      background: rgba(17,24,39,0.4);
      display: none; z-index:999; backdrop-filter: blur(4px);
    }
    .modal-header {
      display: flex; align-items: center; justify-content: space-between;
      padding: 18px 22px; background: linear-gradient(135deg,#3b82f6,#2563eb);
      color:#fff; font-weight:600; font-size:18px;
      box-shadow:0 1px 8px rgba(0,0,0,0.1);
    }
    .modal-header .close-btn { cursor:pointer; font-size:22px; opacity:.85; transition:.3s; }
    .modal-header .close-btn:hover { transform: rotate(90deg) scale(1.2); opacity:1; }
    .modal-middle {
      flex:1; overflow-y:auto; padding:24px;
      display:flex; flex-direction:column; gap:16px;
    }
    .modal-middle p { font-weight:600; margin-bottom:6px; color:#374151; font-size:14px; }
    .modal-middle input {
      border:1px solid #e5e7eb; border-radius:10px; padding:10px 12px;
      font-size:14px; background-color:#f9fafb; transition: all 0.25s ease;
    }
    .modal-middle input:focus {
      border-color:#3b82f6; background-color:#fff;
      box-shadow:0 0 0 3px rgba(59,130,246,0.2); outline:none;
    }
    .modal-middle button {
      margin-top:6px; align-self:flex-start;
      background:#f3f4f6; color:#333; border:none;
      border-radius:8px; padding:6px 12px; font-size:13px; cursor:pointer;
      transition: background 0.25s ease;
    }
    .modal-middle button:hover { background:#e5e7eb; }
    .modal-bottom {
      padding:16px 22px; background:rgba(250,250,250,0.8);
      border-top:1px solid #e5e7eb;
      display:flex; justify-content:flex-end; gap:10px;
    }
    .modal-bottom button {
      padding:10px 18px; border:none; border-radius:8px;
      cursor:pointer; font-weight:600; font-size:14px; transition:.3s;
    }
    .modal-bottom .cancel { background-color:#e5e7eb; color:#374151; }
    .modal-bottom .cancel:hover { background-color:#d1d5db; }
    .modal-bottom .save {
      background: linear-gradient(135deg,#3b82f6,#2563eb);
      color:#fff; box-shadow:0 3px 10px rgba(59,130,246,0.25);
    }
    .modal-bottom .save:hover {
      background: linear-gradient(135deg,#2563eb,#1d4ed8);
      box-shadow:0 5px 12px rgba(37,99,235,0.35);
    }
    
    /* 주소 모달창 CSS */
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
<!-- 주소 모달창 -->
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
<!-- ===== 모달 ===== -->
<div id="modal-overlay"></div>
<div id="modal-container">
  <div class="modal-header">
    <div>거래처 상세보기</div>
    <span class="close-btn" id="modal-close">&times;</span>
  </div>
  <div class="modal-middle">
    <div><p>거래처 코드</p><input type="text" id="giCode" readonly></div>
    <div><p>거래처 명</p><input type="text" id="giName" readonly></div>
    <div><p>이메일</p><input type="text" id="giEmail" readonly></div>
    <div><p>전화번호</p><input type="text" id="giTel" readonly></div>
    <div><p>주소</p><input type="text" id="giAddr" readonly><button type="button" onclick="Postcode()">검색</button></div>
    <div><p>등록일</p><input type="text" id="giRegDate" readonly></div>
  </div>
  <div class="modal-bottom">
    <button class="cancel" id="modal-cancel">닫기</button>
    <button class="save" id="modal-save">수정하기</button>
  </div>
</div>

<!-- ===== 메인 영역 ===== -->
<div class="wrap">
  <%@ include file="../layout/left-menu.jsp"%>
  <div class="right-wrap">
    <%@ include file="../layout/header.jsp"%>

    <div class="m-box">
      <div class="m-header">
        <span class="material-symbols-outlined">apps</span>
        <span>거래처관리</span>
      </div>
      <div></div>
      <div>
        <div>
          <div class="m-state red"></div><span>거래중지</span>
        </div>
        <!-- ✅ id 중복 제거 -->
        <div class="green" id="btn-create">거래처등록</div>
      </div>
    <!-- ===== 검색 ===== -->
    <div class="m-search">
      <div class="m-search-line">
        <div class="m-search-date">
          <input type="date" name="startdate">
          <p>&nbsp;~&nbsp;</p>
          <input type="date" name="enddate">
        </div>
        <div class="m-search-option">
        </div>
        <div class="m-search-text">
          <input type="text" name="search" placeholder="검색어를 입력하세요."><div>검색</div>
        </div>
      </div>
    </div>

    <!-- ===== 테이블 ===== -->
    <div class="m-search-sort">
      <div>거래처 코드</div>
      <div>거래처명</div>
      <div>이메일</div>
      <div>전화번호</div>
      <div>주소</div>
      <div>등록일</div>
    </div>

    <div class="m-items">
      <c:forEach var="c" items="${customerList}">
        <div>
          <div><c:out value="${c.gcm_Code}"/></div>
          <div><c:out value="${c.gcm_Name}"/></div>
          <div><c:out value="${c.gcm_Email}"/></div>
          <div><c:out value="${c.gcm_Tel}"/></div>
          <div><c:out value="${c.gcm_Addr}"/></div>
          <div><c:out value="${c.gcm_Regdate}"/></div>
          <div></div>
          <div class="btns-box">
            <div class="items-btn red" onclick="softDelete(${c.gcm_Idx})"></div>
          </div>
        </div>
      </c:forEach>
    </div>
    </div>

  </div>
</div>

<!-- ===== JS ===== -->
<script src="/js/render.js"></script>
<script src="/js/member.js"></script>
<script src="/js/paging.js"></script>
<script>
// === 모달 제어 ===
const modal = document.getElementById('modal-container');
const overlay = document.getElementById('modal-overlay');
const closeBtn = document.getElementById('modal-close');
const cancelBtn = document.getElementById('modal-cancel');
const saveBtn = document.getElementById('modal-save');

function openModal(){ modal.style.transform='translateX(0%)'; overlay.style.display='block'; }
function closeModal(){ modal.style.transform='translateX(100%)'; overlay.style.display='none'; }

closeBtn.addEventListener('click', closeModal);
cancelBtn.addEventListener('click', closeModal);
overlay.addEventListener('click', closeModal);

// === 거래처등록 버튼 ===
document.getElementById('btn-create').addEventListener('click', ()=>{
  setCreateMode();
  openModal();
});

function setCreateMode(){
  modal.querySelector('.modal-header div').textContent='거래처 등록';
  saveBtn.textContent='저장';
  saveBtn.onclick=handleCreateSave;
  ['giCode','giName','giEmail','giTel','giAddr','giRegDate'].forEach(id=>{
    const el=document.getElementById(id);
    if(!el)return;
    el.readOnly=false;
    el.value='';
  });
}

// === 등록 저장 ===
async function handleCreateSave(){
  const payload={
    gcm_Code:giCode.value.trim(),
    gcm_Name:giName.value.trim(),
    gcm_Email:giEmail.value.trim(),
    gcm_Tel:giTel.value.trim(),
    gcm_Addr:giAddr.value.trim()
  };
  try{
    const res=await fetch('/api/customer',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(payload)});
    if(!res.ok) throw new Error('등록 실패');
    alert('등록 완료');
    closeModal();
    location.reload();
  }catch(e){alert('등록 중 오류');console.error(e);}
}

// === 검색 & 날짜 ===
const searchInput=document.querySelector('.m-search-text input[name="search"]');
const searchBtn=document.querySelector('.m-search-text div');
const startEl=document.querySelector('input[name="startdate"]');
const endEl=document.querySelector('input[name="enddate"]');
const listWrap=document.querySelector('.m-items');

searchBtn.addEventListener('click',doSearch);
searchInput.addEventListener('keydown',(e)=>{if(e.key==='Enter')doSearch();});
startEl.addEventListener('change',doSearch);
endEl.addEventListener('change',doSearch);

async function doSearch(){
  const keyword=searchInput.value.trim();
  const start=startEl.value.trim();
  const end=endEl.value.trim();

  const params=new URLSearchParams();
  if(keyword)params.append('keyword',keyword);
  if(start)params.append('startdate',start);
  if(end)params.append('enddate',end);

  try{
    const res=await fetch('/api/customer/search?'+params.toString());
    if(!res.ok)throw new Error('검색 실패');
    const list=await res.json();
    if(!Array.isArray(list)||list.length===0){
      listWrap.innerHTML='<div style="padding:20px;text-align:center;color:#999;">검색 결과가 없습니다.</div>';
      return;
    }
    listWrap.innerHTML=list.map(c=>`
      <div>
        <div>\${escapeHtml(c.gcm_Code||'')}</div>
        <div>\${escapeHtml(c.gcm_Name||'')}</div>
        <div>\${escapeHtml(c.gcm_Email||'')}</div>
        <div>\${escapeHtml(c.gcm_Tel||'')}</div>
        <div>\${escapeHtml(c.gcm_Addr||'')}</div>
        <div>\${c.gcm_Regdate?c.gcm_Regdate.replace('T',' '):''}</div>
        <div></div>
        <div class="btns-box">
          <div class="items-btn red" onclick="softDelete(\${c.gcm_Idx})"></div>
        </div>
      </div>`).join('');
  }catch(e){console.error(e);alert('검색 오류');}
}

function escapeHtml(s){
  return String(s).replace(/[&<>"'`=\/]/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;','/':'&#x2F;','`':'&#x60;','=':'&#x3D;'}[c]));
}

function softDelete(idx) {
	if(confirm('해당 거래처를 삭제하시겠습니까?')) {
		fetch('/api/customer/' + idx, {
			method: 'delete'
		})
		.catch(error => console.log(error))
		.then(response => response.text())
		.then(text => {
			alert(text);
			doSearch();
		})
	} else {
		return;
	}
}
</script>

<script>
const AddressPagingManager = new PagingManager(); 

const ADDR_API_URL = 'https://business.juso.go.kr/addrlink/addrLinkApi.do';
const CONF_KEY = 'devU01TX0FVVEgyMDI1MTAxMTE4MTk0MjExNjMxNDI=';
const COUNT_PER_PAGE = 8;
const PAGING_BLOCK_SIZE = 5;

function Postcode() {
	document.getElementById('addr-search').value = '';
	document.getElementById('addr-list-box').innerHTML = '';
	document.getElementById('addr-paging').innerHTML = '';
	
	let modal = document.getElementById('address-modal');
	modal.style.display = 'flex';
	modal.style.zIndex = '1000';
}

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
  div.textContent = `\${data.currentPage}`;

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
  <div class="addr-road">\${data.roadAddrPart1} \${data.bdNm}</div>
  <div class="addr-jibun">\${data.jibunAddr}</div>
  `;

  tag.addEventListener('click', () => {
    const input = document.getElementById('giAddr');
    input.value = `\${data.roadAddrPart1} \${data.bdNm}`;

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
</script>
</body>
</html>