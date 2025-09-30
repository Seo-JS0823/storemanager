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
			<div class="content-container">

			    <div class="title-bar">
			        <div class="left">
			            <h3>입고관리</h3>
			            <div class="status-filter">
			                <label><input type="radio" name="status" checked> 전체</label>
			                <label><input type="radio" name="status"> 입고대기</label>
			                <label><input type="radio" name="status"> 입고완료</label>
			            </div>
			        </div>
			        <div class="right">
			            <button class="btn-primary">입고생성</button>
			        </div>
			    </div>

			    <div class="search-bar">
			        <input type="text" placeholder="날짜FROM">
			        <span>~</span>
			        <input type="text" placeholder="날짜TO">

			        <select>
			            <option>거래처명</option>
			        </select>
			        <input type="text" placeholder="검색어를 입력하세요">
			        <button class="btn-secondary">검색</button>
			    </div>

			    <table class="data-table">
			        <thead>
			            <tr>
			                <th>상품명</th>
			                <th>거래처명</th>
			                <th>매입단가</th>
			                <th>매입수량</th>
			                <th>총 금액</th>
			                <th>입고일</th>
			                <th>상태</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="item" items="${items}">
			                <tr>
			                    <td>${item.name}</td>
			                    <td>(주)동서식품</td>
			                    <td><fmt:formatNumber value="38450" pattern="#,##0" />원</td>
			                    <td>2EA</td>
			                    <td><fmt:formatNumber value="76900" pattern="#,##0" />원</td>
			                    <td>2025-09-10</td>
			                    <td>
			                        <span class="status-dot green"></span>
			                        <span class="status-dot orange"></span>
			                        <span class="status-dot red"></span>
			                    </td>
			                </tr>
			            </c:forEach>
			        </tbody>
			    </table>
			    
			    <div class="pagination">
			        <a href="#">&laquo;</a>
			        <a href="#">&lsaquo;</a>
			        <a href="#" class="active">1</a>
			        <a href="#">2</a>
			        <a href="#">3</a>
			        <a href="#">4</a>
			        <a href="#">5</a>
			        <a href="#">&rsaquo;</a>
			        <a href="#">&raquo;</a>
			    </div>
			</div>
		</div>
	</div>
</div>
<script src="/js/modal.js"></script>
</body>
</html>>