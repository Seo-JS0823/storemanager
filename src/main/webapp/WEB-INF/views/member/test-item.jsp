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
					<div class="green" id="각자따로">품목등록</div>
				</div>
			</div>
			<!-- 검색 라인 -->
			<div class="m-search">
				<div>
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
			</div>
		
		<!-- 아이템 리스트 뿌려주기 -->
	</div>
</div>
</body>
</html>