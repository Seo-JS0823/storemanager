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
		background-color : white;
		height : 40%;
		width : 50%;
		padding : 20px;
		border-radius : 8px;
		text-align : center;
	}
	
	#modal-container {
		position : fixed;
		width : 50rem;
		height : 100%;
		top: 0;
		right : 0;
		background-color : gold;
		transform : translateX(100%);
		transition : transform 0.5s ease-in-out;
		z-index : 1000;
	}
	
	
</style>

</head>
<body>
<form>
<!-- 태그 보관소 -->
<template id="items-select" > <!-- template : 순전 태크 보관용(화면에 안뿌려짐) -->
<div>
<label for="items"></label>
		<select id="item-name" name="gi_name">
			<c:forEach var="itemsName" items="${itemsName}">
			<option value="${itemsName.gi_name}">${itemsName.gi_name}</option>
			<%-- <input type="hidden" id="hiddenItems" value="${list.gcm_code}"/> --%>			
			</c:forEach>
		</select>
</div>
</template>

<template id="companys-select" > <!-- template : 순전 태크 보관용(화면에 안뿌려짐) -->
<div>
<label for="companys"></label>
		<select>
			<c:forEach var="companysName" items="${companysName}">
			<option value="gcm_name">${companysName.gcm_name}</option>
			<%-- <input type="hidden" id="hiddenCompanys" value="${list.gcm_code}"/> --%>			
			</c:forEach>
		</select>
</div>
</template>

<!-- 모달 창 -->
<div id="company-select-modal"></div>
<div id="item-select-modal"></div>
<div id="modal-container"></div>
<div class="wrap">
    <!-- 모달 -->
    
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
								<input type="date" name="startdate">
								<p>&nbsp;&nbsp;~&nbsp;&nbsp;</p>
								<input type="date" name="enddate">
							</div>
							<div class="m-search-option">
								<div>
									<input type="radio" id="searchEvent1" name="searchoption">
									<p>상품명</p>
								</div>
								<div>
									<input type="radio" id="searchEvent2" name="searchoption">
									<p>매입처명</p>
								</div>
								<div>
									<input type="radio" id="searchEvent3" name="searchoption">
									<p>거래단가</p>
								</div>
							</div>
							<div class="m-search-text">
								<!-- TEXT 검색 구간 -->
								<input type="text" name="search" placeholder="검색어를 입력하세요.">
								<div>검색</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 정렬 구간 -->
				<div class="m-search-sort">
					<div></div>
					<div>상품명</div>
					<div>매입처명</div>
					<div>매입단가</div>
					<div>수량</div>
					<div>총합</div>
					<div>입고일</div>
					<div></div>
				</div>
				
				<div class="m-items"> <!-- 입고 리스트 -->
				<c:forEach var="list" items="${list}" varStatus="status">
					<div>
						<div>${status.index + 1}</div>
						<div>${list.gi_name}</div>
						<div>동서식품</div>
						<div>${list.gih_price}원</div>
						<div>${list.gih_qty} EA</div> 
						<div>총 ${list.tot_price}원</div>
						<div>${list.gih_regdate}</div>
						<div class="btns-box">
							<!-- Ball -->
							<div class="items-btn orange"></div>
							<div class="items-btn green"></div>
							<!-- <div class="items-btn red"></div> -->
						</div>
				  </div>
				</c:forEach> 
					<div></div>
				</div>
				
			</div> <!-- 개인 작업 영역 끝 -->
			
			<!-- 아이템 리스트 뿌려주기 -->
	</div>
</div>
</form>
<script>

const inCreateEl = document.querySelector('#in-create');

inCreateEl.addEventListener('click', (e) => {
	
/* 	fetch('/in/items')
		.then( response => response.json() )
		.then( data => {
			console.log(data[0].gcm_name)
		} ) */
	
	
	const overlay         = document.createElement('div');
	const SelectModalEl   = document.createElement('div');
	
	const itemsMessage    = document.createElement('h2');
	const itemsSelect 	  = document.querySelector('#items-select').content.cloneNode(true);
	
	const companysMessage = document.createElement('h2');
	const companysSelect  = document.querySelector('#companys-select').content.cloneNode(true);
	
	
	overlay.className = "overlay"; 
	SelectModalEl.className = "select-modal";
	
	itemsMessage.className = "items-message";
	itemsMessage.innerHTML = "입고할 물품 선택 : ";
	
	companysMessage.className = "companys-message";
	companysMessage.innerHTML = "거래처 선택 : ";
	
	document.body.appendChild(overlay);
	overlay.appendChild(SelectModalEl);
	SelectModalEl.appendChild(itemsMessage);
	SelectModalEl.appendChild(itemsSelect);
	SelectModalEl.appendChild(companysMessage);
	SelectModalEl.appendChild(companysSelect);
	
	const itemsNameEl     = document.querySelector('#item-name')
	
	itemsNameEl.addEventListener('change', () => {
		let itemsName = itemsNameEl.value
		fetch('/in/items/' + itemsName)
			.then( response => response.json() )
			.then( data => (e) {
				
			} )
	})
	
})

const modalContainerEl = document.querySelector('#modal-container');
 // modalContainerEl.style.transform = 'translateX(0%)';
</script>
</body>
</html>