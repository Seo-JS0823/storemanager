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
	<title>미니입출고관리</title>
<style>
	#modal-container{ 
		position : fixed;
		width : 50rem;
		height : 100%;
		top : 0;
		right : 0;
		/*왼쪽에서 나타남 left : 0;*/ 
		/*background-color : #666666;*/
		background-color : white;
		box-shadow : 0 0 10px rgba(33,33,33,0.2);
		transform : translateX(100%);
		transition : transform 0.5s ease-in-out;
		z-index : 1000;
	}
	#modal-container > div:nth-child(1) {
        height: 8.75rem;
        width: 90%;
        margin: 0 auto;
        padding-left: 2rem;
        padding-bottom: 1rem;
        display: flex;
        align-items: center;
        border-bottom: 0.2rem solid #666;
        margin-bottom: 1rem;
    }
    #modal-container #state,
    #modal-container #state-text {
        font-size: 2rem;
        height: 3rem;
        margin-top: auto;
        font-weight: 600;
    }
    #state {
        margin-top: auto;
        margin-right: 1rem;
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        background-color: orange;
    }
    .modal-header {
        width: 90%;
        height: auto;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
	}
	.modal-middle{
		width: 90%;
        height: 18rem;
        margin: 0 auto;
        display: grid;
        grid-template-rows: repeat(3, 1fr);
        grid-template-columns: repeat(2, 1fr);
        grid-gap: 1px;
	}
	.modal-middle div {
        display: flex;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    .modal-middle div p {
        margin: 0;
        width: 50%;
        font-size: 1.7rem;
        font-weight: 600;
        text-align: center;
    }
    .modal-middle input {
    	width: 45%;
        height: 45%;
        margin: 0 auto;
        background-color: white;
        border: 1px solid rgba(33, 33, 33, 0.3);
        border-radius: 0.5rem;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 1.2rem;
        outline: none;
        padding-left: 0.5rem;
    }
    .modal-bottom {
    	width: 90%;
        height: 13rem;
        margin: 0 auto;
        display: flex;
        /*flex-direction: column;*/
        padding-left: 2.5rem;
        font-size: 3.0rem;
        font-weight: 600;
        margin-top : 20px;
        justify-content:flex-end;
    }
    /*========================================*/
    #modal-container-1{ 
		position : fixed;
		width : 80rem;
		height : 100%;
		top : 0;
		right : 0;
		/*왼쪽에서 나타남 left : 0;*/ 
		/*background-color : #666666;*/
		background-color : white;
		box-shadow : 0 0 10px rgba(33,33,33,0.2);
		transform : translateX(100%);
		transition : transform 0.5s ease-in-out;
		z-index : 1000;
	}
	#modal-container-1 > div:nth-child(1) {
        height: 8.75rem;
        width: 90%;
        margin: 0 auto;
        padding-left: 2rem;
        padding-bottom: 1rem;
        display: flex;
        align-items: center;
        border-bottom: 0.2rem solid #666;
        margin-bottom: 1rem;
    }
    #modal-container-1 #state,
    #modal-container-1 #state-text {
        font-size: 2rem;
        height: 3rem;
        margin-top: auto;
        font-weight: 600;
    }
    #state-1 {
        margin-top: auto;
        margin-right: 1rem;
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        background-color: orange;
    }
    .modal-header-1 {
        width: 90%;
        height: auto;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
	}
	.modal-middle-1 {
		width: 90%;
        height: 28rem;
        margin: 0 auto;
        display: grid;
        grid-template-rows: repeat(5, 1fr);
        grid-template-columns: repeat(1, 1fr);
        grid-gap: 1px;
	}
	.modal-middle-1 div {
        display: flex;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    .modal-middle-1 > div:nth-child(1) {
        /*display: flex;*/
        align-items: center;
        width: 100%;
        height: 100%;
        border-bottom: 0.1rem solid #666;
    }
    .modal-middle-1 div p {
        margin: 0;
        width: 50%;
        font-size: 1.7rem;
        font-weight: 600;
        text-align: center;
    }
    .modal-middle-1 input {
    	width: 45%;
        height: 45%;
        margin: 0 auto;
        background-color: white;
        border: 1px solid rgba(33, 33, 33, 0.3);
        border-radius: 0.5rem;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 1.2rem;
        outline: none;
        padding-left: 0.5rem;
    }
    .modal-bottom-1 {
    	width: 90%;
        height: 13rem;
        margin: 0 auto;
        display: flex;
        /*flex-direction: column;*/
        padding-left: 2.5rem;
        font-size: 3.0rem;
        font-weight: 600;
        margin-top : 20px;
        justify-content:flex-end;
    }
</style>
</head>
<body>
	<!-- 모달창 영역 -->
	<div id="modal-container">
		<div>
            <div id="state"></div><div id="state-text">상세보기</div>
        </div>
		<div class="modal-header"></div><!-- header -->
		<div class="modal-middle"><!-- middle -->
			<div><p>품목코드</p>    <input type="text" id="giCode" style="border:none" readonly></input></div>
			<div><p>품목명</p>      <input type="text" id="giName" readonly></input></div>
			<div><p>거래처코드</p>  <input type="text" id="gcmCode" readonly></input></div>
			<div><p>거래처명</p>    <input type="text" id="gcmName" readonly></input></div>

			<div><p>거래단가</p>    <input type="text" id="gihPrice" name="gihPrice" readonly></div>
			<div><p>수량</p>        <input type="text" id="gihQty" name="gihQty" readonly></div>
		</div>
		<div class="modal-bottom"><!-- bottom -->
			거래금액 :&nbsp;&nbsp;
			<div id="aMount"></div>
		</div>
	</div>
	
	<div id="modal-container-1">
		<div>
            <div id="state-1"></div><div id="state-text">상세보기</div>
        </div>
		<div class="modal-header-1"></div><!-- header -->
		<!-- middle -->
		<div class="modal-middle-1" id="modal-middle-1">
			
		</div>
		<div class="modal-bottom-1"><!-- bottom -->
			총 거래금액 :&nbsp;&nbsp;
			<div id="aMount-1"></div>
		</div>
	</div>
	<!-- 모달창 영역 -->
<div class="wrap">
	<%@ include file="../layout/left-menu.jsp"%>
	<div class="right-wrap">
		<%@ include file="../layout/header.jsp"%>
		<!-- 개인 작업 영역 -->
		<div>
			<!-- 상단 텍스트, 상태 동그라미, 입고생성버튼 -->
			<div class="m-box">
				<div class="m-header">
					<span class="material-symbols-outlined">receipt_long</span>
					<span>확인서/명세서 관리</span>
				</div>
				<div></div>
				<div>
					<div>
						<div class="m-state orange"></div><span>상세보기</span>
						<!-- <div class="m-state green"></div><span>입고수정</span> -->
						<!-- <div class="m-state red"></div><span>출고생성</span> -->
					</div>
					<div class="green" id="billCreate">명세서생성</div>
				</div>
			</div>
			<!-- 검색 라인 -->
			<div class="m-search">
				<div>
					<div class="m-search-line">
						<div class="m-search-date"> <!-- 날짜 구간 -->
							<input type="date" id="startdate" value="2025-01-01">
							<p>&nbsp;&nbsp;~&nbsp;&nbsp;</p>
							<input type="date" id="enddate" value="2025-01-01">
						</div>
						<div class="m-search-option">
							<!-- <div><input type="radio" id="searchEvent3" name="searchoption"><p>전체</p></div> -->
							<div><input type="radio" id="searchEvent1" name="searchoption" checked><label for="searchEvent1"><p>상품명</p></label></div>
							<div><input type="radio" id="searchEvent2" name="searchoption"><label for="searchEvent2"><p>거래처명</p></label></div>
						</div>
						<div class="m-search-text"> <!-- TEXT 검색 구간 -->
							<input type="text" id="search" name="search" placeholder="검색어를 입력하세요."><div id="searchBtn">검색</div>
						</div>
					</div>
				</div>
			</div>
			<div class="m-search-option" style="font-size: 1.5rem;font-weight:bold">
				<div><input type="radio" id="searchInBill" name="searchBill" value="in" checked><label for="searchInBill"><p>입고확인서</p></label></div>
				<div><input type="radio" id="searchOutBill" name="searchBill" value="out"><label for="searchOutBill"><p>출고확인서</p></label></div>
				<div><input type="radio" id="searchAllBill" name="searchBill" value="all"><label for="searchAllBill"><p>명세서</p></label></div>
			</div>
			<!-- 정렬 구간 -->
			<div class="m-search-sort" id="m-search-sort">
                <div></div>
                <div>상품명</div>
                <div>거래처명</div>
                <div>거래단가</div>
                <div>수량</div>
                <div>거래금액</div>
                <div>거래일자</div>
                <div></div>
            </div>
			<div class="m-items" id="m-items">
			<c:forEach var="billList" items="${billList}">
				<div>
					<input type="hidden" id="gih_inout" name="gih_inout" value="${ billList.gih_inout }" />
	               	<div id="gih_idx"><input type="checkbox" id="chkBillId" name="chkBillId" value="${ billList.gih_idx }" />&nbsp;&nbsp;${ billList.num }</div>
	               	<div id="gi_name" data-name="gi_name" value="${ billList.gi_name }">${ billList.gi_name }</div>
	               	<div id="gcm_name" data-name="gcm_name" value="${ billList.gcm_name }">${ billList.gcm_name }</div>
	             	<div id="gih_price">${ billList.gih_price }</div>
	            	<div id="gih_qty">${ billList.gih_qty } EA</div>
	           	    <div id="all_amount">총 ${ billList.amount } 원</div>
	           	    <div id="gih_regdate">${ billList.gih_regdate }</div>
	           	    <div class="btns-box"> <!-- Ball -->
	           	        <div class="items-btn orange" id="itemsDetail" name="itemsDetail" value="${ billList.gih_idx }"></div>
	           	        <!-- <div class="items-btn green"></div> -->
	           	        <!-- <div class="items-btn red"></div> -->
	           	    </div>
	          	</div>
			</c:forEach>
			</div>
			<div class="paging" id="pagingArea">
			    <div>◀◀</div>
			    <div>◀</div>
			    <div>1</div>
			    <div>2</div>
			    <div>3</div>
			    <div>4</div>
			    <div>5</div>
			    <div>▶</div>
			    <div>▶▶</div>
			</div>
		</div>
		
		<!-- 아이템 리스트 뿌려주기 -->
	</div>
</div>
<!-- <script src="js/modal.js"></script> -->
<script src="/js/render.js"></script>
<script src="/js/member.js"></script>
<script src="/js/paging.js"></script>
<script src="/js/render.js"></script>
<script>
	// 검색바 달력 현재 날짜-7 ~ 현재날짜
	let dateStart = document.getElementById("startdate");
	let dateEnd = document.getElementById("enddate");
	
	let now = new Date();
	let toyear = now.getFullYear();
	let tomonth = ('0' + (now.getMonth() + 1)).slice(-2);
	let today = ('0' + now.getDate()).slice(-2);
	
	let beforenow = new Date(now.setDate(now.getDate() - 7));
	let beforeyear = beforenow.getFullYear();
	let beforemonth = ('0' + (beforenow.getMonth() + 1)).slice(-2);
	let beforeday = ('0' + beforenow.getDate()).slice(-2);

	let endDateValue = toyear + '-' + tomonth  + '-' + today;
	let startDateValue = beforeyear + '-' + beforemonth  + '-' + beforeday;
	
	dateStart.value = startDateValue;
	dateEnd.value = endDateValue;
	// 검색바 달력 현재 날짜-7 ~ 현재날짜 끝.
	// ============================================
	// 필요 엘레멘트 가져 오기
	//let searchOptionEl = document.getElementsByName('searchoption');		// 상품별 , 업체별 라디오버튼
	let searchBillEl = document.getElementsByName('searchBill');			// 검색 버튼
	let searchInBillEl = document.getElementById('searchInBill');			// 입고 확인서 라디오버튼
	let searchOutBillEl = document.getElementById('searchOutBill');			// 출고 확인서 라디오버튼
	let searchAllBillEl = document.getElementById('searchAllBill');			// 명세서 라디오버튼
	
	let gih_inoutEl = document.getElementById('gih_inout');					// InOut hidden 값
	let gih_idxEl = document.getElementById('gih_idx');						// GE_ITEMS_HIST IDX
	let gi_nameEl = document.getElementById('gi_name');						// 상품명
	let gcm_nameEl = document.getElementById('gcm_name');					// 거래처명
	let gih_priceEl = document.getElementById('gih_price');					// 거래 단가
	let gih_qtyEl = document.getElementById('gih_qty');						// 거래 수량
	let all_amountEl = document.getElementById('all_amount');				// 총 금액
	let gih_regdateEl = document.getElementById('gih_regdate');				// GE_ITEMS_HIST 등록일자
	
	let giCodeEl = document.getElementById('giCode');
	let giNameEl = document.getElementById('giName');
	let gcmCodeEl = document.getElementById('gcmCode');
	let gcmNameEl = document.getElementById('gcmName');
	let gihPriceEl = document.getElementById('gihPrice');
	let gihQtyEl = document.getElementById('gihQty');
	let aMountEl = document.getElementById('aMount');
	
	let startDateEl = document.getElementById('startdate');					// 검색 시작일
	let endDateEl = document.getElementById('enddate');						// 검색 종료일
	
	let radiosEl = document.getElementsByName('searchoption');				// 상품별 , 업체별 라디오버튼
	let searchStrEl = document.getElementById('search');					// 검색어
	
	let billCreateEl = document.getElementById('billCreate');				// 명세서 생성 버튼
	
	// 필요 엘레멘트 가져 오기 끝.
	// ============================================
	// 검색 버튼 클릭 이벤트
	let searchBtnEl = document.getElementById('searchBtn');
	searchBtnEl.addEventListener('click',(e) => {
		const dateStart = new Date(startDateEl.value);
		const dateEnd = new Date(endDateEl.value);
		
		if(dateEnd < dateStart){
			alert('검색 일자가 잘못 되었습니다.');
			return false;
		}
//		searchBtnClick();
		if(searchBillEl[0].checked == true){
			//alert('1');
			searchInBill();
		}else if(searchBillEl[1].checked == true){
			//alert('2');
			searchOutBill();
		}else if(searchBillEl[2].checked == true){
			//alert('3');
			searchAllBill();
		}
		
	});
	
	// 검색 버튼 function
	function searchBtnClick(){
		
	}
	
	// 입고 확인서 라디오 버튼 클릭 시
	function searchInBill(){
		ipgoRender(1);
	}
	
	// 출고 확인서 라디오 버튼 클릭 시
	function searchOutBill(){
		chulgoRender(1);
	}
	
	//명세서 라디오 버튼 리스트
	function searchAllBill(){
		myeongseRender(1);
	}
	// 검색 버튼 클릭 이벤트 끝.
	// ============================================
	// bill/bill 에서 접속 -> 기본 모달창 생성	
	let itemsDetailEl = document.querySelectorAll('[id=itemsDetail]');
	for(let i = 0; i< itemsDetailEl.length; i++){
		itemsDetailEl[i].addEventListener('click',(e) => {
			//alert(i);
			e.stopPropagation();
			let modalContainerEl = document.getElementById('modal-container');
			modalContainerEl.style.transform='translateX(0%)';
			
			let itemsIdx = itemsDetailEl[i].getAttribute('value');

			fetch('/bill/onebill/'+itemsIdx)
			.then( response => response.json() )
			.then( data     => {
				//console.log(data)
				data.forEach(item => {
					giCodeEl.value = item.gi_code;
					giNameEl.value = item.gi_name;
					gcmCodeEl.value = item.gcm_code;
					gcmNameEl.value = item.gcm_name;
					gihPriceEl.value = item.gih_price;
					gihQty.value = item.gih_qty;
					aMountEl.textContent = item.amount;
					
				})
			})
			.then(error => console.log(error) )
		})
	}
	// 모달창 생성 끝.	
	// ============================================
	// 모달창 닫기
	let wrapEl = document.querySelector('.right-wrap');
	wrapEl.addEventListener('click',(e)=>{
		let modalContainerEl = document.getElementById('modal-container');
		let modalContainer1El = document.getElementById('modal-container-1');
		modalContainerEl.style.transform='translateX(100%)';
		modalContainer1El.style.transform='translateX(100%)';
	});
	// 모달창 생성 및 닫기 끝.
	// ============================================
	// 출고확인서 라디오 버튼 이벤트 리스너
	//let searchOutBillEl = document.getElementById('searchOutBill');
	searchOutBillEl.addEventListener('click',(e)=>{
		searchOutBill();
	});
	// 출고확인서 라디오 버튼 이벤트 리스너 끝.
	// ============================================
	// 입고확인서 라디오 버튼 이벤트 리스너
	searchInBillEl.addEventListener('click',(e)=>{
		searchInBill();
	});
	// 입고확인서 라디오 버튼 이벤트 리스너 끝.
	// ============================================
	// 명세서 라디오 버튼 이벤트 리스너
	searchAllBillEl.addEventListener('click',(e)=>{
		searchAllBill();
	});
	// 명세서 라디오 버튼 이벤트 리스너 끝.
	// ============================================
	
	// ----- 페이징 -----
	/*
	let searchInBillEl = document.getElementById('searchInBill');			// 입고 확인서 라디오버튼
	let searchOutBillEl = document.getElementById('searchOutBill');			// 출고 확인서 라디오버튼
	let searchAllBillEl = document.getElementById('searchAllBill');			// 명세서 라디오버튼
	*/
	
	const paging = new PagingManager();
	
	// 초기 입고명세서 렌더링 - 주성
	ipgoRender(1);
	
	function ipgoRender(page) {
		let ipgoURL = '/bill/billin/';
		paging.nowPage = page;
		
		billCreateEl.style.display = 'flex';
		
		if(searchStrEl.value != ''){
			//searchStr = searchStrEl.value;
			ipgoURL += startDateEl.value+'/'+endDateEl.value+'/'+radiosEl[0].checked+'/'+radiosEl[1].checked+'/'+searchStrEl.value;
		} else {
			ipgoURL += startDateEl.value+'/'+endDateEl.value+'/'+radiosEl[0].checked+'/'+radiosEl[1].checked+'/null';
		}
		
		const m_search_sortEl = document.getElementById('m-search-sort');
		m_search_sortEl.innerHTML = `
		<div></div>
		<div>상품명</div>
        <div>거래처명</div>
        <div>거래단가</div>
        <div>수량</div>
        <div>거래금액</div>
        <div>거래일자</div>
        <div></div>
		`;
		
		Render.callJSON(
		ipgoURL + `/\${paging.nowPage}`,
		{},
		'm-items',
		(json) => {
			let m_itemsEl = document.getElementById("m-items");
			m_itemsEl.innerHTML='';
			
			json.list.forEach(item => {
				const list = document.createElement('div');
				list.innerHTML = `
				<input type="hidden" id="gih_inout" name="gih_inout" value=\${item.gih_inout} />
				<div id="gih_idx"><input type="checkbox" id="chkBillId" name="chkBillId" value='\${item.gih_idx}' >&nbsp;&nbsp;\${item.num}</div>
				<div id="gi_name" data-name="gi_name" value="\${item.gi_name}">\${item.gi_name}</div>
				<div id="gcm_name" data-name="gcm_name" value="\${ item.gcm_name }">\${ item.gcm_name }</div>
				<div id="gih_price">\${ item.gih_price }</div>
				<div id="gih_qty">\${ item.gih_qty } EA</div>
				<div id="all_amount">총 \${ item.amount } 원</div>
				<div id="gih_regdate">\${ item.gih_regdate }</div>
				`;
				
				const itemsDetailsDiv = document.createElement('div');
				itemsDetailsDiv.className = 'items-btn orange';
				itemsDetailsDiv.id = 'itemsDetail';
				itemsDetailsDiv.name = 'itemsDetail';
				itemsDetailsDiv.setAttribute('value', `\${item.gih_idx}`);
				
				itemsDetailsDiv.addEventListener('click', (e) => {
					e.stopPropagation();
					let modalContainerEl = document.getElementById('modal-container');
					//modalContainerEl.style.width='50rem';
					modalContainerEl.style.transform='translateX(0%)';

					giCodeEl.value = `\${item.gi_code}`;
					giNameEl.value = `\${item.gi_name}`;
					gcmCodeEl.value = `\${item.gcm_code}`;
					gcmNameEl.value = `\${item.gcm_name}`;
					gihPriceEl.value = `\${item.gih_price}`;
					gihQtyEl.value = `\${item.gih_qty}`;
					aMountEl.textContent = `\${item.amount}`;
				})
				const btnsBox = document.createElement('div');
				btnsBox.className = 'btns-box';
				
				btnsBox.appendChild(itemsDetailsDiv);
				
				list.appendChild(btnsBox);
				m_itemsEl.appendChild(list);
				
           	    // 페이징 렌더링
           	    const totalPage = json.pg.totalPage;
          	    paging.renderer({
          	    	start  : 'bill-ipgo-start',
          	    	middle : 'bill-ipgo-middle',
          	    	end    : 'bill-ipgo-end'
          	    },
          	    'pagingArea',
          	    totalPage,
          	    5);
           	    
			})
		},
		);
		
	}
	function chulgoRender(page) {
		let chulgoURL = '/bill/billout/';
		paging.nowPage = page;
		
		if(searchStrEl.value != ''){
			//searchStr = searchStrEl.value;
			chulgoURL += startDateEl.value+'/'+endDateEl.value+'/'+radiosEl[0].checked+'/'+radiosEl[1].checked+'/'+searchStrEl.value;
		}else{
			chulgoURL += startDateEl.value+'/'+endDateEl.value+'/'+radiosEl[0].checked+'/'+radiosEl[1].checked+'/null';
		}
		
		const m_search_sortEl = document.getElementById("m-search-sort");
		m_search_sortEl.innerHTML = `
			<div></div>
            <div>상품명</div>
            <div>거래처명</div>
            <div>거래단가</div>
            <div>수량</div>
            <div>거래금액</div>
            <div>거래일자</div>
            <div></div>
		`;
		
		Render.callJSON(
		chulgoURL + `/\${paging.nowPage}`,
		{},
		'm-items',
		(json) => {
			let m_itemsEl = document.getElementById("m-items");
			m_itemsEl.innerHTML='';
			json.list.forEach(item => {
				const list = document.createElement("div");
				list.innerHTML =  `
					<input type="hidden" id="gih_inout" name="gih_inout" value=\${item.gih_inout} />
					<div id="gih_idx"><input type="checkbox" id="chkBillId" name="chkBillId" value="\${item.gih_idx}" >&nbsp;&nbsp;\${item.num}</div>
					<div id="gi_name" data-name="gi_name" value="\${item.gi_name}">\${item.gi_name}</div>
					<div id="gcm_name" data-name="gcm_name" value="\${ item.gcm_name }">\${ item.gcm_name }</div>
					<div id="gih_price">\${ item.gih_price }</div>
					<div id="gih_qty">\${ item.gih_qty } EA</div>
					<div id="all_amount">총 \${ item.amount } 원</div>
					<div id="gih_regdate">\${ item.gih_regdate }</div>
				`;
					
				const itemsDetailsDiv = document.createElement('div');
				itemsDetailsDiv.className = 'items-btn orange';
				itemsDetailsDiv.id = 'itemsDetail';
				itemsDetailsDiv.name = 'itemsDetail';
				itemsDetailsDiv.setAttribute('value', `\${item.gih_idx}`);
					
				itemsDetailsDiv.addEventListener('click', (e) => {
					e.stopPropagation();
					let modalContainerEl = document.getElementById('modal-container');
					//modalContainerEl.style.width='50rem';
					modalContainerEl.style.transform='translateX(0%)';

					giCodeEl.value = `\${item.gi_code}`;
					giNameEl.value = `\${item.gi_name}`;
					gcmCodeEl.value = `\${item.gcm_code}`;
					gcmNameEl.value = `\${item.gcm_name}`;
					gihPriceEl.value = `\${item.gih_price}`;
					gihQtyEl.value = `\${item.gih_qty}`;
					aMountEl.textContent = `\${item.amount}`;
				})
				const btnsBox = document.createElement('div');
				btnsBox.className = 'btns-box';
				
				btnsBox.appendChild(itemsDetailsDiv);
				
				list.appendChild(btnsBox);
           	    m_itemsEl.appendChild(list);
           	    
           	    const totalPage = json.pg.totalPage;
           	    paging.renderer({
           	    	start  : 'bill-chul-start',
           	    	middle : 'bill-chul-middle',
           	    	end    : 'bill-chul-end'
           	    },
           	    'pagingArea',
           	    totalPage,
           	    5)
			});
		}
		);
	}
	function myeongseRender(page) {
		let url = '/bill/billall/'
		paging.nowPage = page;
		
		if(searchStrEl.value != ''){
			//searchStr = searchStrEl.value;
			url += startDateEl.value+'/'+endDateEl.value+'/'+radiosEl[0].checked+'/'+radiosEl[1].checked+'/'+searchStrEl.value;
		} else {
			url += startDateEl.value+'/'+endDateEl.value+'/'+radiosEl[0].checked+'/'+radiosEl[1].checked+'/null';
		}
		
		const m_search_sortEl = document.getElementById("m-search-sort");
		m_search_sortEl.innerHTML = `
			<div></div>
            <div>명세서번호</div>
            <div>상품명</div>
            <div>거래처명</div>
            <div>명세종류</div>
            <div></div>
            <div>생성일자</div>
            <div></div>
		`;
		
		Render.callJSON(
		url + `/\${paging.nowPage}`,
		{},
		'm-items',
		(json) => {
			let m_itemsEl = document.getElementById("m-items");
			m_itemsEl.innerHTML='';
			
			json.list.forEach(item => {
				const list = document.createElement("div");
				list.innerHTML =  `
					<div id="gih_idx">\${item.num}</div>
					<div id="gih_price">\${ item.gbc_number }</div>
					<div id="gi_name" data-name="gi_name" value="\${item.gcm_gi_name}">\${item.gbc_gi_name}</div>
					<div id="gcm_name" data-name="gcm_name" value="\${ item.gbc_gcm_name }">\${ item.gbc_gcm_name }</div>
					<div id="gih_qty">\${ item.gbc_inout }</div>
					<div id="all_amount"></div>
					<div id="gih_regdate">\${ item.gbc_regdate }</div>
				`;
					
				const itemsDetailsDiv = document.createElement('div');
				itemsDetailsDiv.className = 'items-btn orange';
				itemsDetailsDiv.id = 'itemsDetail';
				itemsDetailsDiv.name = 'itemsDetail';
				itemsDetailsDiv.setAttribute('value', `\${item.gbc_gis_list}`);
					
				itemsDetailsDiv.addEventListener('click', (e) => {
					e.stopPropagation();
					//alert(e.target.attributes.value.value)
					let aMountEl = document.getElementById('aMount-1');
					let modalContainerEl = document.getElementById('modal-container-1');
					modalContainerEl.style.transform='translateX(0%)';
					
					let modalMiddleEl = document.getElementById('modal-middle-1');
					modalMiddleEl.innerHTML=`<div><p>명세서번호</p><p>거래처명</p><p>상품명<p>단가</p><p>수량</p><p>거래금액</p></div>`;
					
					
					let gbcGisList = e.target.attributes.value.value;
					let result = '';
					
					if(gbcGisList.indexOf(',') != -1){
						fetch('/bill/gcmchk/'+gbcGisList)
						.then( response => response.json() )
						//.then( response => response.text() )
						.then( data1     => {
							console.log(data1)
							data1.forEach(item1 => {
								result = `<div><p>\${item1.gbc_number}</p><p>\${item1.gbc_gcm_name}</p>`;
							})
							
						})
						.then(error => console.log(error) )
						
						let ParsegbcGisList = gbcGisList.split(',');

						fetch('/bill/gcmchk1/'+ParsegbcGisList[0])
						.then( response => response.json() )
						//.then( response => response.text() )
						.then( data2     => {
							//console.log(data2)
							data2.forEach(item2 => {
								modalMiddleEl.innerHTML += result+`<p>\${item2.gi_name}</p><p>\${item2.gih_qty}</p><p>\${item2.gih_price}</p><p>\${item2.amount}</p></div>`;
							})
							
						})
						.then(error => console.log(error) )
						
						for(let i=1; i<ParsegbcGisList.length; i++){
 							fetch('/bill/gcmchk1/'+ParsegbcGisList[i])
							.then( response => response.json() )
							//.then( response => response.text() )
							.then( data3     => {
								console.log(data3)
								data3.forEach(item3 => {
									modalMiddleEl.innerHTML += `
										<div><p></p><p></p><p>\${item3.gi_name}</p><p>\${item3.gih_qty}</p>
										<p>\${item3.gih_price}</p><p>\${item3.amount}</p></div>
									`;
								})
							})
							.then(error => console.log(error) )
						}
						
						fetch('/bill/gcmchk2/'+gbcGisList)
						.then( response => response.json() )
						//.then( response => response.text() )
						.then( data3     => {
							console.log(data3)
							data3.forEach(item3 => {
								aMountEl.textContent = `\${item3.amount}`;
							})
							
						})
						.then(error => console.log(error) )
					}else{
						
						fetch('/bill/gcmchk/'+gbcGisList)
						.then( response => response.json() )
						//.then( response => response.text() )
						.then( data1     => {
							console.log(data1)
							data1.forEach(item1 => {
								result =`<div><p>\${item1.gbc_number}</p><p>\${item1.gbc_gcm_name}</p>`;
							})
							
							fetch('/bill/gcmchk1/'+gbcGisList)
							.then( response => response.json() )
							//.then( response => response.text() )
							.then( data2     => {
								console.log(data2)
								data2.forEach(item2 => {
									modalMiddleEl.innerHTML += result+`<p>\${item2.gi_name}</p><p>\${item2.gih_qty}</p><p>\${item2.gih_price}</p><p>\${item2.amount}</p></div>`;
									aMountEl.textContent = `\${item2.amount}`;
								})
								
							})
						})
						.then(error => console.log(error) )
					}
				})
				const btnsBox = document.createElement('div');
				btnsBox.className = 'btns-box';
				
				btnsBox.appendChild(itemsDetailsDiv);
				
				list.appendChild(btnsBox);
           	    m_itemsEl.appendChild(list);
           	    
           	 	const totalPage = json.pg.totalPage;
        	    paging.renderer({
        	    	start  : 'bill-bill-start',
        	    	middle : 'bill-bill-middle',
        	    	end    : 'bill-bill-end'
        	    },
        	    'pagingArea',
        	    totalPage,
        	    5)
			});
		}
		);
	}
	
	// 입고 페이징 렌더링 컴포넌트들
	paging.setComponent('bill-ipgo-start', (data) => {
		const div = document.createElement('div');
		div.textContent = '◀';
		
		const backPage = data.start - data.pageSize;
		
		if (data.start <= 1) {
			div.style.opacity = '0.3';
			div.style.cursor = 'default';
			return div;
		}
		
		div.addEventListener('click', () => {
			ipgoRender(backPage);
		});
	});
	paging.setComponent('bill-ipgo-middle', (data) => {
		const div = document.createElement('div');
		div.textContent = `\${data.currentPage}`;
		
		if (data.currentPage === data.activePage) {
			div.style.fontWeight = 'bold';
			div.style.color = '#00AA00';
			div.style.fontSize = '1.5rem';
	    }

	    div.addEventListener('click', () => {
	    	ipgoRender(data.currentPage);
	    });
		return div;
	});
	paging.setComponent('bill-ipgo-end', (data) => {
		const div = document.createElement('div');
		div.textContent = '▶';
		
		const nextPage = data.end + 1;
		
		if(nextPage > data.totalPage) {
			div.style.opacity = '0.3';
			div.style.cursor = 'default';
			return div;
		}
		
		div.addEventListener('click', () => {
			ipgoRender(nextPage);
		});
		
		return div;
	});
	
	// 출고 페이징 렌더링 컴포넌트들
	paging.setComponent('bill-chul-start', (data) => {
		const div = document.createElement('div');
		div.textContent = '◀';
		
		const backPage = data.start - data.pageSize;
		
		if (data.start <= 1) {
			div.style.opacity = '0.3';
			div.style.cursor = 'default';
			return div;
		}
		
		div.addEventListener('click', () => {
			chulgoRender(backPage);
		});
	});
	paging.setComponent('bill-chul-middle', (data) => {
		const div = document.createElement('div');
		div.textContent = `\${data.currentPage}`;
		
		if (data.currentPage === data.activePage) {
			div.style.fontWeight = 'bold';
			div.style.color = '#00AA00';
			div.style.fontSize = '1.5rem';
	    }

	    div.addEventListener('click', () => {
	    	chulgoRender(data.currentPage);
	    });
		return div;
	});
	paging.setComponent('bill-chul-end', (data) => {
		const div = document.createElement('div');
		div.textContent = '▶';
		
		const nextPage = data.end + 1;
		
		if(nextPage > data.totalPage) {
			div.style.opacity = '0.3';
			div.style.cursor = 'default';
			return div;
		}
		
		div.addEventListener('click', () => {
			chulgoRender(nextPage);
		});
		
		return div;
	});
	
	// 명세서 페이징 렌더링 컴포넌트들
	paging.setComponent('bill-bill-start', (data) => {
		const div = document.createElement('div');
		div.textContent = '◀';
		
		const backPage = data.start - data.pageSize;
		
		if (data.start <= 1) {
			div.style.opacity = '0.3';
			div.style.cursor = 'default';
			return div;
		}
		
		div.addEventListener('click', () => {
			myeongseRender(backPage);
		});
	});
	paging.setComponent('bill-bill-middle', (data) => {
		const div = document.createElement('div');
		div.textContent = `\${data.currentPage}`;
		
		if (data.currentPage === data.activePage) {
			div.style.fontWeight = 'bold';
			div.style.color = '#00AA00';
			div.style.fontSize = '1.5rem';
	    }

	    div.addEventListener('click', () => {
	    	myeongseRender(data.currentPage);
	    });
		return div;
	});
	paging.setComponent('bill-bill-end', (data) => {
		const div = document.createElement('div');
		div.textContent = '▶';
		
		const nextPage = data.end + 1;
		
		if(nextPage > data.totalPage) {
			div.style.opacity = '0.3';
			div.style.cursor = 'default';
			return div;
		}
		
		div.addEventListener('click', () => {
			myeongseRender(nextPage);
		});
		
		return div;
	});
</script>
<script>

	// 명세서 생성 버튼 이벤트 리스너
	billCreateEl.addEventListener('click',(e)=>{
		if(searchBillEl[2].checked == true){
			alert('명세서 리스트에서는 사용 불가 합니다.');
			return false;
		}
		
		let chkCheckBox = document.querySelectorAll('input[name="chkBillId"]:checked').length;
		if(chkCheckBox == 0){
			alert('체크박스를 1개 이상 선택해 주세요');
			return false;
		}
		
		let chkIdx = document.getElementsByName('chkBillId');
		let chkGcmNameEl = document.querySelectorAll('[data-name=gcm_name]');
		let chkGiName = document.querySelectorAll('[data-name=gi_name]');
		
		let chkIdxResult = '';
		let chkGcmNameResult = '';
		let chkGiNameResult = '';
		let chkInOut = '';
		
		for (let i=0 ; i<chkIdx.length; i++ ){
			if(chkIdx[i].checked == true){
				if (chkGcmNameResult == ''){
					chkGcmNameResult = chkGcmNameEl[i].getAttribute('value');
				}else if(chkGcmNameResult != ''){
					if(chkGcmNameResult != chkGcmNameEl[i].getAttribute('value')){
						alert('다름 이름의 거래처를 선택 하셨습니다.')
						return false;
					}
				}
				
				chkIdxResult += chkIdx[i].value+',';
				chkGiNameResult += chkGiName[i].getAttribute('value')+',';
			}
		}
		if(searchBillEl[0].checked == true){
			chkInOut = 'IN';
		}else if(searchBillEl[1].checked == true){
			chkInOut = 'OUT';
		}
		chkIdxResult = chkIdxResult.slice(0,-1);
		chkGiNameResult = chkGiNameResult.slice(0,-1);

		fetch('/bill/createbill/'+chkIdxResult+'/'+chkGcmNameResult+'/'+chkGiNameResult+'/'+chkInOut)
		//.then( response => response.json() )
		.then( response => response.text() )
		.then( data     => {
			//console.log(data)
			
			if (data == 'OK'){
				alert('명세서가 성공적으로 생성 되었습니다.');
			}
		})
		.then(error => console.log(error) )
	});
</script>
</body>
</html>