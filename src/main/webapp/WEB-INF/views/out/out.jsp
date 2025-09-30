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
                        <div id="create">출고</div>
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
                                <div><input type="radio" id="searchEvent2" name="searchoption"><p>거래처명</p></div>
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
                        <div>거래처명</div>
                        <div>거래단가</div>
                        <div></div>
                        <div></div>
                        <div>출고일</div>
                        <div></div>
                    </div>
                </div>
                <div class="main-items">
                    <!-- 아이템 리스트 부분 / 제이슨데이터 가져오기 -->
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
<script src="js/modal.js"></script>
<script src="/out/out.js"></script>
</body>
</html>