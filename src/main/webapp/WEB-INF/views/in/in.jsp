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
<title></title>
	
<style>
	.overlay {
		position : fixed;
		top : 0;
		left : 0;
		width : 100%;
		height : 100%;
		background-color : rgba(0, 0, 0, 0.5);
		display : flex;
		justify-content: center;
	}
	
	.select-modal {
	  background: #fff;
	  width: 30%;
	  height : 40%; 
	  margin : 17rem auto;
	  padding: 24px 28px;
	  border-radius: 12px;
	  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
	  display: flex;
	  flex-direction: column;
	  flex-wrap : wrap;
	  gap: 14px;
	  text-align: left;
	  animation: fadeIn 0.25s ease-in-out;
	}
	
	.select-modal h2 {
	  font-size: 20px;
	  font-weight: 600;
	  margin-bottom: 4px;
	}

	.select-modal input {
	  width: 25%;
	  padding: 6px 8px;
	  border: 1px solid #ccc;
	  border-radius: 6px;
	  font-size: 18px;
	  font-weight : 500;
	}
	
	.select-modal button {
	  margin-top: 50px;
	  width : 90px;
	  padding: 8px 16px;
	  background: #0078ff;
	  color: white;
	  font-size : 20px;
	  font-weight: 600;
	  border: none;
	  border-radius: 6px;
	  cursor: pointer;
	  transition: background 0.2s;
	}
	
	.select-modal button:nth-of-type(1) {
		margin-left : 35rem;
	}
	
	.select-modal button:nth-of-type(2) {
		margin-top : 276px;
	}
	
	.select-modal button:hover {
	  background: #005fcc;
	}
	
	@keyframes fadeIn {
  from { opacity: 0; transform: scale(0.9); }
  to { opacity: 1; transform: scale(1); }
}
	
	#modal-container {
		position : fixed;
		width : 50rem;
		height : 100%;
		top: 0;
		right : 0;
		background-color : #999;
		transform : translateX(100%);
		transition : transform 0.5s ease-in-out;
		z-index : 1000;
	}
	
	.in-modal {
  padding: 20px;
}

	.in-modal-header {
	  display: flex;
	  align-items: center;
	  gap: 10px;
	  font-size: 1.4rem;
	  margin-bottom: 10px;
	}
	
	.circle {
	  width: 20px;
	  height: 20px;
	  border-radius: 50%;
	}

	.img-box {
	  margin: 10px 0;
	}
	
	.img {
		width : 180px;
		height : 180px;
	}
	
	.input-group .row {
	  display: flex;
	  align-items: center;
	  gap: 10px;
	  margin: 50px 0;
	}
	
	.input-group label {
	  width: 120px;
	  text-align: center;
	  font-size : 20px;
	  font-weight : 700;
	}
	
	.input-group input {
	  width: 120px;
	  height : 40px;
	  font-size : 20px;
	  font-weight : 500;
	  padding-left : 8px;
	  border-radius : 5px;
	  border : 1px solid black;
	}
	
	.remark-box {
	  margin-top: 10px;
	  display: flex;
	  flex-direction: column;
	}
	
	.remark-box label	 {
		font-size : 20px;
		font-weight : 700;
	}
	
	.remark-box textarea {
	  width: 100%;
	  resize: none;
	  padding: 5px;
	  font-size: 0.9rem;
	}
	
	.btn-box {
	  margin-top: 15px;
	  display: flex;
	  justify-content: center;
	  gap: 10px;
	}
	
	.btn {
	  border: none;
	  padding: 8px 16px;
	  margin-right : 10px;	
	  border-radius: 5px;
	  color: white;
	  font-size : 20px; 
	  font-weight: bold;
	  cursor: pointer;
	}
	
	.green { background-color: green; }
	.red { background-color: red; }
	
</style>

</head>
<body>

<script src="/js/render.js"></script>

<!-- 태그 보관소 -->
<template id="items-select"> <!-- template : 순전 태크 보관용(화면에 안뿌려짐) -->
	<div>
	<label for="items"></label>
		<input id="item-name" list="items-list"  name="gi_name"/>
		<datalist id="items-list">
		
		</datalist>
	</div>
</template>

 <template id="companys-select" > <!-- template : 순전 태크 보관용(화면에 안뿌려짐) -->
	<div>
	<label for="companys"></label>
		<input id="company-name" list="companys-list"/>
		<datalist id="companys-list">
		
		</datalist>
	</div>
</template> 

<!-- <form id="form"> -->

<!-- 오른쪽 모달 창 -->
<div id="modal-container">
  <div class="in-modal">
    <div class="in-modal-header">
      <div class="circle green"></div>
      <h1 id="right-title">입고생성</h1>
    </div>

    <hr>

    <div class="in-modal-body">
      <div class="img-box">
        <img class="img" src="/img/night.jpg">
      </div>

      <div class="input-group">
        <div class="row">
          <label>품목코드</label><input id="right-gi_code" type="text">
          <label>품목명</label><input id="right-item-name" type="text">
        </div>
        <div class="row">
          <label>거래처코드</label><input id="right-gcm_code"  type="text">
          <label>거래처명</label><input id="right-company-name" type="text">
        </div>
        <div class="row">
          <label>매입단가</label><input id="right-price" type="text">
          <label>수량</label><input id="right-qty" type="number">
        </div>
      </div>

      <!-- 메모 -->
      <div class="remark-box">
        <label>REMARK</label>
        <textarea id="right-remark" rows="5" placeholder="Memo" style="font-size:15px;"></textarea>
      </div>
    </div>

    <!-- 버튼 영역 -->
    <div class="btn-box">
      <button id="right-save" class="btn green" type="button">저장</button>
      <button id="right-cancel" class="btn red" onclick="molse()">취소</button>
    </div>
  </div>	
</div>
<!-- 오른쪽 모달 창 End-->

<div class="wrap">
    
	<%@ include file="../layout/left-menu.jsp"%>
	<div class="right-wrap">
		<%@ include file="../layout/header.jsp"%>
		
		<!-- 개인 작업 영역 -->
			<div>
				<!-- 상단 텍스트, 상태 동그라미, 입고생성버튼 -->
				<div class="m-box">
					<div class="m-header">
						<span class="material-symbols-outlined">apps</span> <span>입고관리</span>
					</div>
					<div></div>
					<div>
						<div>
							<div class="m-state orange"></div>
							<span class="item-detail">상세보기</span>
					<!-- 		<div class="m-state red"></div>
							<span>출고생성</span> -->
						</div>
						<div class="green" id="in-create">입고</div>
					</div>
				</div>
				<!-- 검색 라인 -->
				<div class="m-search">
					<div>
						<div class="m-search-line">
							<div class="m-search-date">
								<!-- 날짜 구간 -->
								<input type="date" id="startdate">
								<p>&nbsp;&nbsp;~&nbsp;&nbsp;</p>
								<input type="date" id="enddate">
							</div>
							<div class="m-search-option">
								<div>
									<input type="radio" id="searchEvent1" name="searchoption">
									<p>상품명</p>
								</div>
								<div>
									<input type="radio" id="searchEvent2" name="searchoption">
									<p>거래처명</p>
								</div>
								<div>
									<input type="radio" id="searchEvent3" name="searchoption">
									<p>거래단가</p>
								</div>
							</div>
							<div class="m-search-text">
								<!-- TEXT 검색 구간 -->
								<input id="search-text" type="text" name="search" placeholder="검색어를 입력하세요.">
								<div id="search-btn">검색</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 정렬 구간 -->
				<div class="m-search-sort">
					<div></div>
					<div>상품명</div>
					<div>거래처명</div>
					<div>매입단가</div>
					<div>수량</div>
					<div>총합</div>
					<div>입고일</div>
					<div></div>
				</div>
				
				<div class="m-items" id="item-history-list"> <!-- 입고 리스트 -->
				<!-- 
				<c:forEach var="list" items="${list}" varStatus="status">
					<div>
						<div>${status.index + 1}</div>
						<div class="list-item_name">${list.gi_name}</div>
						<div class="list-company_name">${list.gcm_name}</div>
						<div class="list-price">${list.gih_price}원</div>
						<div>${list.gih_qty} EA</div> 
						<div>총 ${list.tot_price}원</div>
						<div class="list-regdate">${list.gih_regdate}</div>
						<div class="btns-box">
							
							<div class="items-btn orange"></div>
							<div class="items-btn green"></div>
							
						</div>
				  </div>
				</c:forEach>
				-->
				</div>
				<div class="paging" id="paging">
	                <div>◀◀</div>
	                <div>◀</div>
	                <!-- c:forEach start -->
	                <div>1</div>
	                <div>2</div>
	                <div>3</div>
	                <div>4</div>
	                <div>5</div>
	                <!-- c:forEach End -->
	                <div>▶</div>
	                <div>▶▶</div>
	            </div>
			</div> <!-- 개인 작업 영역 끝 -->
			
			<!-- 아이템 리스트 뿌려주기 -->
	</div>
</div>
<!-- </form> -->
<script src="/js/render.js"></script>
<script src="/js/member.js"></script>
<script src="/js/paging.js"></script>
<script>
const inCreateEl = document.querySelector('#in-create');  // 입고 버튼
const modalContainerEl = document.querySelector('#modal-container'); // 오른쪽 모달창
inCreateEl.addEventListener('click', (e) => { // 메인 화면 입고 버튼 클릭 이벤트
	
	const overlay         = document.createElement('div');  // 클릭할때 나온는 회색배경
	const SelectModalEl   = document.createElement('div');  // 입고생성 처음 뜨는 모달창
	
	const itemsMessage    = document.createElement('h2');   // 입고할 물품 선택 :
	const itemsSelect 	  = document.querySelector('#items-select').content.cloneNode(true); // 위에 template 갖고올때 쓰는문법
	
	const companysMessage = document.createElement('h2');   // 거래처 선택 :
	const companysSelect  = document.querySelector('#companys-select').content.cloneNode(true);
	
	const selectBtn       = document.createElement('button'); // 물품,거래처 확인 버튼
	const cancelBtn       = document.createElement('button'); // 물품,거래처 확인 버튼
	
	overlay.className = "overlay"; 
	SelectModalEl.className = "select-modal";
	
	itemsMessage.className = "items-message";
	itemsMessage.innerHTML = "입고할 물품 선택 : ";
	
	companysMessage.className = "companys-message";
	companysMessage.innerHTML = "거래처 선택 : ";
	
	selectBtn.innerHTML = '확인';
	cancelBtn.innerHTML = '취소';
	
	document.body.appendChild(overlay);
	overlay.appendChild(SelectModalEl);
	SelectModalEl.appendChild(itemsMessage);
	SelectModalEl.appendChild(itemsSelect);
	SelectModalEl.appendChild(companysMessage);
	SelectModalEl.appendChild(companysSelect);
	SelectModalEl.appendChild(selectBtn);
	SelectModalEl.appendChild(cancelBtn);
	
	cancelBtn.addEventListener('click', (e) => { // 취소 클릭시 모달창 사라짐
			overlay.remove();
	})
	
	const itemsNameEl     = document.querySelector('#item-name')    // 선택칸에 최종 입력된 상품명 테그
	const companysNameEl  = document.querySelector('#company-name') // 선택칸에 최종 입력된 거래처명 테그
	const itemListEl      = document.querySelector('#items-list')   // 선택option 들을 담고있는 아이(dataList 테그)
	
 	fetch('/in/getItemsName')
		.then( response => response.json() )
		.then( data => {
			data.forEach( items => {
			    let option = document.createElement("option"); 
			    option.className = 'item-options';
			    option.value = items.gi_name;
			    option.setAttribute("data-gi_code", items.gi_code);
			    option.textContent = items.gi_name;
			    itemListEl.appendChild(option);
			} )
		})
		
	itemsNameEl.addEventListener('change', () => { // 거래처 선택은 물품 선택한거에 따라 보여주는 리스트가 달라져서 JS로 처리
		const companyListEl = document.querySelector('#companys-list') // 거래처명 선택 리스트들
					
		let itemsName    = itemsNameEl.value; 	 // 선택칸에 최종 입력된 상품명
		
		fetch('/in/items/' + itemsName) // 거래처명 갖고오기
			.then( response => response.json() )
			.then( data => {
				companyListEl.innerHTML = '';
				
				data.forEach( companys => {
				    option = document.createElement("option"); 
				    option.className = 'company-options';
				    option.value = companys.gcm_name;
				    option.setAttribute("data-gcm_code", companys.gcm_code);
				    option.textContent = companys.gcm_name;
				    companyListEl.appendChild(option);
				} )
				
			} )
	}) // change End
	
	selectBtn.addEventListener('click', (e) => { // 첫 모달창 확인 클릭 이벤트
		const rightItemNameEl = document.querySelector('#right-item-name');       // 오른쪽 모달 품목명 테그
		const rightCompanyNameEl = document.querySelector('#right-company-name'); // 오른쪽 모달 거래처명 테그
		const rightItemCodeEl = document.querySelector('#right-gi_code')          // 오른쪽 모달 아이템 코드 태그
		const rightCompanyCodeEl = document.querySelector('#right-gcm_code')			// 오른쪽 모달 거래처 코드 태그
		const rightQtyEl    = document.querySelector('#right-qty');    						// 오른쪽 모달 수량 태그
		const rightPriceEl  = document.querySelector('#right-price');  						// 오른쪽 모달 단가 태그
		const rightRemarkEl = document.querySelector('#right-remark'); 						// 오른쪽 모달 비고 태그
		const inBtnEl       = document.querySelector('#right-save');  						// 오른쪽 모달 저장 버튼
		const cancelBtnEl   = document.querySelector('#right-cancel') 						// 오른쪽 모달 취소 버튼
		const itemOptions = [...overlay.querySelectorAll('.item-options')];       // 물품 option 태그 배열
		const companyOptions = [...overlay.querySelectorAll('.company-options')]; // 거래처 option 태그 배열
		
		const btSave = document.querySelector('#right-save');
		btSave.style.display = 'block';
		
		// 최종선택란에 있는 이름과 일치하는걸 option에서 찾기
		const ItemOptionEl = itemOptions.find(opt => opt.value === itemsNameEl.value);
		const CompanyOptionEl = companyOptions.find(opt => opt.value === companysNameEl.value); 
 
		// 입력한 물품이 DB에 없으면 .some() 이 boolean 느낌
		if(itemOptions.some(opt => itemsNameEl.value === opt.value) === false) { 
			alert('빈칸이 있거나 입력하신 물품은 거래처에 등록되지 않은 상품입니다');
			e.preventDefault();
			return;
		}
		
		// 입력한 거래처가 DB 에 없으면 .some() 이 boolean 느낌
		if(companyOptions.some(opt => companysNameEl.value === opt.value) === false) {
			alert('빈칸이 있거나 입력하신 거래처는 현재 등록되지 않은 상태입니다');
			e.preventDefault();
			return;
		}
		
		e.stopPropagation();
		overlay.remove(); // 위에조건 다 만족하면 회색배경 제거
		
		// 밑에 렌더링 함수때문에 단가,수량,비고 초기화 한거
		rightQtyEl.value = '';
		rightPriceEl.value = '';
		rightRemarkEl.value = '';
		
	  modalContainerEl.style.transform = 'translateX(0%)'; // 오른쪽 모달창 등장	
		
		// 오른쪽 모달창에 출력할 물품코드 가져오기
 		fetch('in/getItemCode' + `?gi_name=\${itemsNameEl.value}&gcm_code=\${CompanyOptionEl?.dataset.gcm_code}`)
		 	.then( response => response.json() )
		 	.then( data => {
		 		// 오른쪽 모달 아이템 코드
		 		rightItemCodeEl.value = data
		 	}) 
		 	
		// 오른쪽 모달 거래처 코드
		rightCompanyCodeEl.value = CompanyOptionEl?.dataset.gcm_code 
				
		rightItemNameEl.value													  = itemsNameEl.value;
		rightCompanyNameEl.value 												= companysNameEl.value;
	
	  
		// 오른쪽 모달창 외의 화면 클릭시 다시 화면밖으로 감
		document.addEventListener('click', (e) => { 
			if (!modalContainerEl.contains(e.target) && e.target !== inCreateEl) {
				modalContainerEl.style.transform = 'translateX(100%)';
			}
		})
		
		// 오른쪽 모달창 취소 클릭시 다시 화면밖으로 감
		cancelBtnEl.addEventListener('click', () => {
			modalContainerEl.style.transform = 'translateX(100%)';
		})
		
		inBtnEl.addEventListener('click',(e) => { // 오른쪽 모달창 저장 클릭 이벤트
			const nodeArray3 = [rightQtyEl, rightPriceEl, rightRemarkEl];
			const nodeArray2 = [rightQtyEl, rightPriceEl];

		 if( nodeArray2.some( nodes => isNaN(nodes.value) ) ) {
				alert('매입단가나 수량은 숫자형태 여야 합니다')
				e.preventDefault();
				e.stopPropagation();
				return;
			} else if(nodeArray3.some( nodes => nodes.value.trim() === '' ) ) {
					alert('빈칸이 있으면 안됩니다');
					e.preventDefault();
					e.stopPropagation();
					return;
			}
			
			let inHistory = {
					gcm_code   : document.querySelector('#right-gcm_code').value,
					gi_code    : document.querySelector('#right-gi_code').value,
					gi_name    : rightItemNameEl.value,
					gih_qty    : rightQtyEl.value,
					gih_price  : rightPriceEl.value,
					gih_remark : rightRemarkEl.value
			}
			const url = '/in/insert'
			console.log(inHistory)
			let params = {
					method  : 'POST',
					headers : {"Content-Type":"application/json;charset=UTF-8"},
					body    : JSON.stringify(inHistory)
			}
			fetch(url,params)
				.then(response => response.json())
			
		}) // 오른쪽 모달창 저장 클릭 이벤트 끝
		
	}) // 첫 모달창 확인 클릭 이벤트 끝
	
}) // 메인 화면 입고 버튼 클릭 이벤트 끝
/*
const itemDetailEls = document.querySelectorAll('.item-detail');
itemDetailEls.forEach( details => details.addEventListener('click', (e) => {
	modalContainerEl.style.transform = 'translateX(0%)';
}) )
*/

const itemHistoryListEL = document.querySelector('#item-history-list');   // 입고 물품 리스트 컨테이너
const searchEvent1El 		= document.querySelector('#searchEvent1'); 				// 상품명   radio
const searchEvent2El	  = document.querySelector('#searchEvent2'); 				// 거래처명 radio
const searchEvent3El	  = document.querySelector('#searchEvent3'); 				// 거래단가 radio
const searchTextEl 	 		= document.querySelector('#search-text'); 		   	// 검색내용칸
const searchBtn 		 		= document.querySelector('#search-btn');  			  // 검색 버튼

const	listItemName 		=	document.querySelector('.list-item_name');       // 상품명
const	listCompanyName =	document.querySelector('.list-company_name');    // 거래처명
const	listPrice			  =	document.querySelector('.list-price');           // 단가
const	listRegdate 		=	document.querySelector('.list-regdate') ;        // 입고일

const startDateEl = document.querySelector('#startdate'); // 검색 시작일칸
const endDateEl = document.querySelector('#enddate'); 		// 검색 마지막일칸



	searchBtn.addEventListener('click', () => {
		ipgoRender(1);
	}) // 검색 클릭 이벤트 끝
	
	// 페이징
	// item-history-list parent ID
	
	const paging = new PagingManager();
	
	ipgoRender(1);
	
	function ipgoRender(page) {
		paging.nowPage = page;
		const searchEvent1Ell = document.querySelector('#searchEvent1'); 	// 상품명   radio
		const searchEvent2Ell = document.querySelector('#searchEvent2'); 	// 거래처명 radio
		const searchEvent3Ell = document.querySelector('#searchEvent3');  // 거래단가 radio
		let keyword = searchTextEl.value.trim(); // 검색 내용물값
		let startDate = startDateEl.value; // 검색 시작일
		let endDate = endDateEl.value; // 검색 마지막일
		
		// 검색바 달력 현재 날짜-7 ~ 현재날짜
		   let dateStart = document.getElementById("startdate");
		   let dateEnd = document.getElementById("enddate");
		   
		   if (!dateStart.value && !dateEnd.value) {
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
		   }
			let urlll = '/in/list?nowPage=' + paging.nowPage + `&dateStart=\${dateStart.value}&dateEnd=\${dateEnd.value}`;
		
		if(startDate && endDate) {
			urlll = `/In/list?start=\${startDate}&end=\${endDate}&nowPage=\${paging.nowPage}`;
		}
		
		if(searchEvent1Ell.checked) {
			urlll = 'in/searchItem/' + keyword + `?nowPage=\${paging.nowPage}`;
			if(startDate && endDate) {
				urlll = 'in/searchItem/' + keyword + `?start=\${startDate}&end=\${endDate}&nowPage=\${paging.nowPage}`;
			}
		} else if (searchEvent2Ell.checked) {
			urlll = 'in/searchCompany/' + keyword + `?nowPage=\${paging.nowPage}`;
			if(startDate && endDate) {
				urlll = 'in/searchCompany/' + keyword + `?start=\${startDate}&end=\${endDate}&nowPage=\${paging.nowPage}`;
			}
		} else if (searchEvent3Ell.checked) {
			urlll = 'in/searchPrice/' + keyword + `?nowPage=\${paging.nowPage}`;
			if(startDate && endDate) {
				urlll = 'in/searchPrice/' + keyword + `?start=\${startDate}&end=\${endDate}&nowPage=\${paging.nowPage}`;
			}			
		}
		
		console.log(urlll)
		
		const itemHistoryArea = document.querySelector('#item-history-list');
		itemHistoryArea.innerHTML = '';
		
		Render.callJSON(
		urlll,
		{},
		'item-history-list',
		(json) => {
			json.list.forEach((item, index) => {
				const div = document.createElement('div');
				const iii = item;
				div.innerHTML = `
			 	<div>\${index + 1}</div>
				<div id="list-item_name">\${item.gi_name}</div>
				<div id="list-company_name">\${item.gcm_name}</div>
				<div id="list-price">\${item.gih_price}원</div>
				<div>\${item.gih_qty} EA</div> 
				<div>총 \${item.tot_price}원</div>
				<div id="list-regdate">\${item.gih_regdate}</div>
				<div class="btns-box">
					<div class="items-btn orange" onclick='mopen(\${JSON.stringify(item)})'></div>
				</div>
				`;
				
				itemHistoryArea.appendChild(div);
				
				const totalPage = json.pg.totalPage;
				paging.renderer({
					start  : 'in-start',
					middle : 'in-middle',
					end    : 'in-end'
				},
				'paging',
				totalPage,
				5)
			})
			const btnsB = document.querySelector('#right-save');
			btnsB.style.display = 'none';
			const rightTitle = document.querySelector('#right-title')
			rightTitle.innerHTML = '물품 상세정보'
		});
	}
	
	function mopen(json) {
		const modal = document.querySelector('#modal-container');
		
		const fumco = document.getElementById('right-gi_code');
		fumco.value = json.gi_code
		const fumme = document.getElementById('right-item-name');
		fumme.value = json.gi_name
		const gico  = document.getElementById('right-gcm_code');
		gico.value  = json.gcm_code
		const conem = document.getElementById('right-company-name');
		conem.value = json.gcm_name
		const pri   = document.getElementById('right-price');
		pri.value   = json.gih_price
		const qtqt  = document.getElementById('right-qty');
		qtqt.value  = json.gih_qty
	  const mark  = document.getElementById('right-remark');
		mark.value  = json.gih_remark
		
		modal.style.transform = 'translateX(0%)';
	}
	
	function molse() {
		const modal = document.querySelector('#modal-container');
		modal.style.transform = 'translateX(100%)';		
	}
	
	// 페이징 렌더링 컴포넌트
	paging.setComponent('in-start', (data) => {
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
		return div;
	});
	paging.setComponent('in-middle', (data) => {
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
	paging.setComponent('in-end', (data) => {
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
	
</script>
</body>
</html>