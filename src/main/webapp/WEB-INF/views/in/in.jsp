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
	  align-self: center;
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
<template id="items-select" > <!-- template : 순전 태크 보관용(화면에 안뿌려짐) -->
	<div>
	<label for="items"></label>
		<input id="item-name" list="items-list"  name="gi_name"/>
		<datalist id="items-list">
			<c:forEach var="itemsName" items="${itemsName}">
				<option class="item-options" data-gi_code="${itemsName.gi_code}" value="${itemsName.gi_name}">
			</c:forEach>
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
      <h1>입고생성</h1>
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
      <button id="save" class="btn green" type="button">저장</button>
      <button class="btn red">취소</button>
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
							<span>상세보기</span>
							<div class="m-state green"></div>
							<span>입고수정</span>
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
							<!-- Ball -->
							<div class="items-btn orange"></div>
							<div class="items-btn green"></div>
							<!-- <div class="items-btn red"></div> -->
						</div>
				  </div>
				</c:forEach> 
				</div>
				<div class="paging">
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
<script>

const inCreateEl = document.querySelector('#in-create');  // 입고 버튼

inCreateEl.addEventListener('click', (e) => { // 입고 버튼 클릭 이벤트
	
	const overlay         = document.createElement('div');  // 클릭할때 나온는 회색배경
	const SelectModalEl   = document.createElement('div');  // 입고생성 처음 뜨는 모달창
	
	const itemsMessage    = document.createElement('h2');   // 입고할 물품 선택 :
	const itemsSelect 	  = document.querySelector('#items-select').content.cloneNode(true); // 위에 template 갖고올때 쓰는문법
	
	const companysMessage = document.createElement('h2');   // 거래처 선택 :
	const companysSelect  = document.querySelector('#companys-select').content.cloneNode(true);
	
	const selectBtn       = document.createElement('button'); // 물품,거래처 확인 버튼
	
	overlay.className = "overlay"; 
	SelectModalEl.className = "select-modal";
	
	itemsMessage.className = "items-message";
	itemsMessage.innerHTML = "입고할 물품 선택 : ";
	
	companysMessage.className = "companys-message";
	companysMessage.innerHTML = "거래처 선택 : ";
	
	selectBtn.innerHTML = '확인';
	
	document.body.appendChild(overlay);
	overlay.appendChild(SelectModalEl);
	SelectModalEl.appendChild(itemsMessage);
	SelectModalEl.appendChild(itemsSelect);
	SelectModalEl.appendChild(companysMessage);
	SelectModalEl.appendChild(companysSelect);
	SelectModalEl.appendChild(selectBtn);
	
	overlay.addEventListener('click', (e) => { // 다른데 클릭시 모달창 사라짐
		if(e.target === overlay)  
			overlay.remove();
	})
	
	const itemsNameEl     = document.querySelector('#item-name')       // 선택칸에 최종 입력된 상품명
	const companysNameEl     = document.querySelector('#company-name') // 선택칸에 최종 입력된 거래처명

	itemsNameEl.addEventListener('change', () => { // 거래처 선택은 물품 선택한거에 따라 보여주는 리스트가 달라져서 JS로 처리
		const companyListEl = document.querySelector('#companys-list') // 거래처명 선택 리스트들
				
		let itemsName = itemsNameEl.value
		fetch('/in/items/' + itemsName) // 거래처명 갖고오기
			.then( response => response.json() )
			.then( data => {
				companyListEl.innerHTML = '';
				
				data.forEach( companys => {
				    const option = document.createElement("option"); 
				    option.className = 'company-options';
				    option.value = companys.gcm_name;
				    option.setAttribute("data-gcm_code", companys.gcm_code);
				    option.textContent = companys.gcm_name;
				    companyListEl.appendChild(option);
				} )
				
			} )
	}) // change End
	
	selectBtn.addEventListener('click', (e) => { // 물품,거래처 확인 클릭 이벤트
		e.stopPropagation();
		overlay.remove();
		
		const rightItemNameEl = document.querySelector('#right-item-name');       // 오른쪽 모달 상품명
		const rightCompanyNameEl = document.querySelector('#right-company-name'); // 오른쪽 모달 거래처명
		
		const itemOptionEl 		= [...overlay.querySelectorAll('.item-options')]
														  .find(opt => opt.value === itemsNameEl.value); // 최종선택란에 있는 이름과 일치하는걸 option에서 찾기
		const CompanyOptionEl = [...overlay.querySelectorAll('.company-options')]
		 													.find(opt => opt.value === companysNameEl.value);
													   
		document.querySelector('#right-gi_code').value  = itemOptionEl?.dataset.gi_code
		document.querySelector('#right-gcm_code').value = CompanyOptionEl?.dataset.gcm_code
		rightItemNameEl.value													  = itemsNameEl.value;
		rightCompanyNameEl.value 												= companysNameEl.value;
	
		const modalContainerEl = document.querySelector('#modal-container'); // 오른쪽 모달창
	  modalContainerEl.style.transform = 'translateX(0%)';	
	  
		document.addEventListener('click', (e) => {
			if (!modalContainerEl.contains(e.target) && e.target !== inCreateEl) {
				modalContainerEl.style.transform = 'translateX(100%)';
			}
		})
		
		const inBtnEl       = document.querySelector('#save');         // 오른쪽 모달 저장 버튼
		const rightQtyEl    = document.querySelector('#right-qty');    // 오른쪽 모달 수량
		const rightPriceEl  = document.querySelector('#right-price');  // 오른쪽 모달 단가
		const rightRemarkEl = document.querySelector('#right-remark'); // 오른쪽 모달 비고
		inBtnEl.addEventListener('click',() => { // 저장 클릭 이벤트
			alert('ㅇㅇ')
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
			
		}) // 저장 클릭 이벤트 끝
		
	}) // 확인 클릭 이벤트 끝
	
}) // 입고 클릭 이벤트 끝

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
		let keyword = searchTextEl.value.trim(); // 검색 내용물값
		let startDate = startDateEl.value; // 검색 시작일
		let endDate = endDateEl.value; 		 // 검색 마지막일
		let html = '';
		let url = '';	
		
		if(startDate && endDate) {
			url += `/In/list?start=\${startDate}&end=\${endDate}`;
				fetch(url)
				.then( response => response.json() )
				.then( data => {
					console.log(data)
				itemHistoryListEL.innerHTML = '';
/* 			  if(data.length === 0) {
				  alert('검색 결과가 없습니다')
			    return;
			  } */
			  
			  data.forEach( (list1,index) => {
				  html += `<div>
								  	<div>\${index + 1}</div>
										<div id="list-item_name">\${list1.gi_name}</div>
										<div id="list-company_name">\${list1.gcm_name}</div>
										<div id="list-price">\${list1.gih_price}원</div>
										<div>\${list1.gih_qty} EA</div> 
										<div>총 \${list1.tot_price}원</div>
										<div id="list-regdate">\${list1.gih_regdate}</div>
										<div class="btns-box">
											<div class="items-btn orange"></div>
											<div class="items-btn green"></div>
										</div>
				 				  </div>`;
									
			  })
			  itemHistoryListEL.innerHTML = html;
			}) 
			
		} else if (!keyword) {
		    alert('검색어를 입력하세요!');
		    return;
		  }
		
		if(searchEvent1El.checked) {
		url = '/in/searchItem/' + keyword;
			if(startDate && endDate) {
				url += `?start=\${startDate}&end=\${endDate}`;
			}
		fetch(url)
			.then( response => response.json() )
			.then( data => {
				itemHistoryListEL.innerHTML = '';
			  if(data.length === 0) {
				  alert('검색 결과가 없습니다')
			    return;
			  }
			  
			  data.forEach( (list1,index) => {
				  html += `<div>
								  	<div>\${index + 1}</div>
										<div id="list-item_name">\${list1.gi_name}</div>
										<div id="list-company_name">\${list1.gcm_name}</div>
										<div id="list-price">\${list1.gih_price}원</div>
										<div>\${list1.gih_qty} EA</div> 
										<div>총 \${list1.tot_price}원</div>
										<div id="list-regdate">\${list1.gih_regdate}</div>
										<div class="btns-box">
											<div class="items-btn orange"></div>
											<div class="items-btn green"></div>
										</div>
				 				  </div>`;
									
			  })
			  itemHistoryListEL.innerHTML = html;
			}) // 1번째 data 끝
			
		} else if(searchEvent2El.checked) {
			url = '/in/searchCompany/' + keyword;
				if(startDate && endDate) {
					url += `?start=\${startDate}&end=\${endDate}`;
				}
			fetch(url)
			.then( response => response.json() )
			.then( data => {
				
			  if(data.length === 0) {
				  alert('검색 결과가 없습니다')
			    return;
			  }
				itemHistoryListEL.innerHTML = '';
			  
			  data.forEach( (list1,index) => {
				  html += `<div>
								  	<div>\${index + 1}</div>
										<div id="list-item_name">\${list1.gi_name}</div>
										<div id="list-company_name">\${list1.gcm_name}</div>
										<div id="list-price">\${list1.gih_price}원</div>
										<div>\${list1.gih_qty} EA</div> 
										<div>총 \${list1.tot_price}원</div>
										<div id="list-regdate">\${list1.gih_regdate}</div>
										<div class="btns-box">
											<div class="items-btn orange"></div>
											<div class="items-btn green"></div>
										</div>
				 				  </div>`;
									
			  })
			  itemHistoryListEL.innerHTML = html;
			}) // 2번째 data 끝
			
		} else if(searchEvent3El.checked) {
			url = '/in/searchPrice/' + keyword;
				if(startDate && endDate) {
					url += `?start=\${startDate}&end=\${endDate}`;
				}
			fetch(url)
			.then( response => response.json() )
			.then( data => {
				itemHistoryListEL.innerHTML = '';
				
			  if(data.length === 0) {
				  alert('검색 결과가 없습니다')
			    return;
			  }
			  
			  data.forEach( (list1,index) => {
				  html += `<div>
								  	<div>\${index + 1}</div>
										<div id="list-item_name">\${list1.gi_name}</div>
										<div id="list-company_name">\${list1.gcm_name}</div>
										<div id="list-price">\${list1.gih_price}원</div>
										<div>\${list1.gih_qty} EA</div> 
										<div>총 \${list1.tot_price}원</div>
										<div id="list-regdate">\${list1.gih_regdate}</div>
										<div class="btns-box">
											<div class="items-btn orange"></div>
											<div class="items-btn green"></div>
										</div>
				 				  </div>`;
									
			  })
			  itemHistoryListEL.innerHTML = html;
			}) // 3번째 data 끝
		}
	}) // 검색 클릭 이벤트 끝
	
</script>

<script src="/js/member.js"></script>

</body>
</html>