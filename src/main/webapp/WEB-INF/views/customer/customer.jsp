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
	
</style>
</head>
<body>
<script>

 
 //idx가 왜 필요하지? 식별자
/*  function openDetail(idx) {
	fetch('/api/customer/' + idx) // 예: /customer/3으로 GET
		.then(res => {
			if (!res.ok) throw new Error('조회 실패')
			return res.json(); //json 파싱
		})
		.then(data => {
			// 응답 JSON의 필드를 DOM에 채워넣기(data에서 값 꺼내서 텍스트 세팅하고 상세 박스 보이게 만듦)
			document.getElementById('name').textContent		=	data.gcmName ?? '';//??'' 널 병합 연산자. null이나 undefined면 빈칸
			document.getElementById('email').textContent	=	data.gcmEmail ?? '';
			document.getElementById('tel').textContent		=	data.gcmTel ?? '';
			document.getElementById('addr').textContent		=	data.gcmAddr ?? '';
			document.getElementById('detail').style.display =   'block';// display:none 다시 보이게
		})
		.catch(console.error);
}
function renderItems(list){
	const box = document.querySelector('.m-items');
	if (!box) return;
	
	
} */

 
</script>
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
					<span>입고관리</span>
				</div>
				<div></div>
				<div>
					<div>
						<div class="m-state orange"></div><span>상세보기</span>
						<div class="m-state green"></div><span>입고수정</span>
						<div class="m-state red"></div><span>출고생성</span>
					</div>
					<div class="green" id="각자따로">입고생성</div>
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
                <div>거래처 코드</div>
                <div>거래처명</div>
                <div>이메일</div>
                <div>전화번호</div>
                <div>주소</div>
                <div>등록일</div>
                <div>입고일</div>
                <div></div>
            </div>
			<div class="m-items"><!-- 거래처 리스트 -->
			  <c:forEach var="c" items="${customerList}">
					    <div>
					      <div><c:out value="${c.gcm_Code}"/></div>      <!-- 거래처 코드 -->
					      <div><c:out value="${c.gcm_Name}"/></div>      <!-- 거래처명 -->
					      <div><c:out value="${c.gcm_Email}"/></div>     <!-- 이메일 -->
					      <div><c:out value="${c.gcm_Tel}"/></div>       <!-- 전화 -->
					      <div><c:out value="${c.gcm_Addr}"/></div>      <!-- 주소 -->
					      <div>
					        <!-- 등록일 표시 (LocalDateTime이면 아래 주석 참고) -->
					        <c:out value="${c.gcm_Regdate}"/>
					      </div>
					      <div></div> <!-- 입고일(해당없음이면 비워둠) -->
					      <div class="btns-box">
					        <div class="items-btn orange" onclick="openDetail('${c.gcm_Idx}')"></div>
					        <div class="items-btn green"  onclick="openEdit('${c.gcm_Idx}')"></div>
					        <div class="items-btn red"    onclick="softDelete('${c.gcm_Idx}')"></div>
					      </div>
					    </div>
				</c:forEach>
					
				<%-- <c:if test="${empty customerList}">
					    <div>데이터가 없습니다.</div>
				</c:if> --%>
		</div>
		
		<!-- 아이템 리스트 뿌려주기 -->
	</div>
</div>
<div id="modal" style="display:none">
	<div><b>거래처명</b><span id="name"></span></div>
	<div><b>이메일</b><span id="email"></span></div>
	<div><b>전화번호</b><span id="tel"></span></div>
	<div><b>주소</b><span id="addr"></span></div>
</div>

</body>
</html>