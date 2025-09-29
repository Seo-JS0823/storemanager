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
	<link rel="stylesheet" href="/css/items-modal.css">
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
			<div class="main-menu">
                    <div>
                        <span class="material-symbols-outlined">apps</span>
                        <span>입고관리</span>
                    </div>
                    <div></div>
                    <div>
                        <div>
                            <div></div><span>상세보기</span>
                            <div></div><span>입고수정</span>
                            <div></div><span>출고생성</span>
                        </div>
                        <div id="create">입고생성</div>
                    </div>
                </div>
                <div class="main-container">   
                    <div>
                        <!-- 검색 바 -->
                        <div class="main-search">
                            <div> <!-- 날짜 구간 -->
                                <input type="date" name="startdate">
                                <p>&nbsp;&nbsp;~&nbsp;&nbsp;</p>
                                <input type="date" name="enddate">
                            </div>
                            <div id="net-search-option"> <!-- 검색 옵션 구간 + 출고 옵션 부분 : ID로 JS에서 출고 페이지인 경우 안에 INNER 바꾸기 -->
                                <div><input type="radio" id="searchEvent1" name="searchoption"><p>상품명</p></div>
                                <div><input type="radio" id="searchEvent2" name="searchoption"><p>매입처명</p></div>
                                <div><input type="radio" id="searchEvent3" name="searchoption"><p>거래단가</p></div>
                            </div>
                            <div> <!-- TEXT 검색 구간 -->
                                <input type="text" name="search" placeholder="검색어를 입력하세요."><div>검색</div>
                            </div>
                        </div>
                    </div>
                    <div> <!-- 정렬 기능 부분 -->
                        <div></div>
                        <div>상품명</div>
                        <div>매입처명</div>
                        <div>매입단가</div>
                        <div></div>
                        <div></div>
                        <div>입고일</div>
                        <div></div>
                    </div>
                </div>
                <!-- 아이템 리스트 부분 / c:forEach -->
                <div class="main-items">
                    <!-- <c:forEach var="item" items="${items}"> c:forEach가 아니라 JS for문으로. -->
                    <div>
                        <!--<input type="hidden" class="items-idx" value="${item.idx}">-->
                        <div>1</div>
                        <div>예가체프-콜롬비아</div>
                        <div>동서식품</div>
                        <div>38,450원</div>
                        <div>2EA</div>
                        <div>총 76,900원</div>
                        <div>2025-09-10</div>
                        <div class="btns-box"> <!-- Ball -->
                            <div class="items-btn-orange" data-idx="orange1"></div>
                            <div class="items-btn-green" data-idx="green1"></div>
                            <div class="items-btn-red" data-idx="red1"></div>
                        </div>
                    </div>
                    <div>
                        <!--<input type="hidden" class="items-idx" value="${item.idx}">-->
                        <div>1</div>
                        <div>예가체프-콜롬비아</div>
                        <div>동서식품</div>
                        <div>38,450원</div>
                        <div>2EA</div>
                        <div>총 76,900원</div>
                        <div>2025-09-10</div>
                        <div class="btns-box"> <!-- Ball -->
                            <div class="items-btn-orange" data-idx="orange2"></div>
                            <div class="items-btn-green" data-idx="green2"></div>
                            <div class="items-btn-red" data-idx="red2"></div>
                        </div>
                    </div>
                    <div>
                        <!--<input type="hidden" class="items-idx" value="${item.idx}">-->
                        <div>1</div>
                        <div>예가체프-콜롬비아</div>
                        <div>동서식품</div>
                        <div>38,450원</div>
                        <div>2EA</div>
                        <div>총 76,900원</div>
                        <div>2025-09-10</div>
                        <div class="btns-box"> <!-- Ball -->
                            <div class="items-btn-orange" data-idx="orange3"></div>
                            <div class="items-btn-green" data-idx="green3"></div>
                            <div class="items-btn-red" data-idx="red3"></div>
                        </div>
                    </div>
                    <!-- </c:forEach> -->
                    
                    <!-- 마지막은 페이징 -->
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
            </div>
		</div>
	</div>
</div>
<script src="js/modal.js"></script>
</body>
</html>