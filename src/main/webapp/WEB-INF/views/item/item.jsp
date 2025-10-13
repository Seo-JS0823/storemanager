<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&"/>
	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/wrap.css">
	<link rel="stylesheet" href="/css/m-header.css">
	<link rel="stylesheet" href="/css/modal.css">
	<title></title>
<style>
	
</style>
</head>
<body>
<div class="wrap">
	<%@ include file="../layout/left-menu.jsp"%>
	<div class="right-wrap">
		<%@ include file="../layout/header.jsp"%>
		<!-- 개인 작업 영역 -->
		<div>
			<!-- 상단 텍스트, 상태 동그라미, 입고생성버튼 -->
			<div class="m-box">
				<div class="m-header">
					<span class="material-symbols-outlined">apps</span>
					<span>품목관리</span>
				</div>
				<div></div>
				<div>
					<div>
						<div class="m-state orange"></div><span>상세보기</span>
						<div class="m-state green"></div><span>입고수정</span>
						<div class="m-state red"></div><span>출고생성</span>
					</div>
					<div class="green" id="show-item-form-btn">품목등록</div>
				</div>
			</div>
			<!-- 검색 라인 -->
			<div class="m-search">
				<div>
				<form action=:/items method="get" class="m-search line">	
                	<div class="m-search-line">
                    	<div class="m-search-date"> <!-- 날짜 구간 -->
                            <input type="date" name="startdate">
                            <p>&nbsp;&nbsp;~&nbsp;&nbsp;</p>
                            <input type="date" name="enddate">
                        </div>
                        <div class="m-search-option">
                            <div><input type="radio" id="searchEvent1" name="searchoption"><p>상품명</p></div>
                            <div><input type="radio" id="searchEvent2" name="searchoption"><p>매입처명</p></div>
                            <div><input type="radio" id="searchEvent3" name="searchoption"><p>거래단가</p></div>
                        </div>
                        <div class="m-search-text"> <!-- TEXT 검색 구간 -->
                            <input type="text" name="search" placeholder="검색어를 입력하세요."><div>검색</div>
                        </div>
                    </div>
                  </form>
               </div>
			</div>
			<!-- 정렬 구간 -->
				<div class="m-search-sort">
					<div>번호</div>
					<div>품목코드</div>
					<div>상품명</div>
					<div>매입처명</div>
					<div>현재고</div>
					<div></div>
					<div></div>
					<div></div>
				</div>
				<div class="m-items">

					<c:forEach var="item" items="${items}" varStatus="loop">
						<div>
							<div>${loop.count}</div>
							<div>${item.giCode}</div>
							<div>${item.giName}</div>
							<div>${item.gcmName}</div>
							<div>${item.gisTotQty}개</div>
							<div></div>
							<div></div>
							<div class="btns-box">
								<div class="items-btn orange"></div>
								<div class="items-btn green"></div>
								<div class="items-btn red"></div>
							</div>
						</div>
					</c:forEach>
					<div></div>
				</div>
			</div>
		  <div id="right-modal-container"></div>
		<!-- 아이템 리스트 뿌려주기 -->
	</div>
</div>
	<script>
    // '품목등록' 버튼과 사이드바 공간을 변수에 저장
    const showFormBtn = document.getElementById('show-item-form-btn');
    const sidebar = document.getElementById('right-modal-container');

    //'품목등록' 버튼에 클릭 이벤트를 설정
    showFormBtn.addEventListener('click', function() {
        //컨트롤러의 '/items/new-form' 주소로 HTML을 요청
        fetch('/items/new-form')
            .then(response => response.text()) 
            .then(html => {
                sidebar.innerHTML = html;
                //CSS 스타일
                sidebar.style.transform = 'translateX(0)';                
                const closeBtn = document.getElementById('modal-clear');
                if (closeBtn) {
                    closeBtn.addEventListener('click', function() {
                        sidebar.style.transform = 'translateX(100%)';
                    });
                }
            })
            .catch(error => console.error('폼을 불러오는 중 오류 발생:', error));
    });
</script>
</body>
</html>