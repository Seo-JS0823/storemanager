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
<!-- <script>
async function openDetail(idx){
	const res = await fetch('/api/customer/' + encodeURIComponent(idx));
	if(!res.ok) return alert('조회 실패');
	const d = await res.josn(); // d.gcm_name, d.gcm_email ...
	
	const html = `
		<div class = "modal-header"><b>거래처 상세
		<button onclick="closeModal()">&times;</button></div>
		<div class="modal-middle">
			<div><b>거래처명:</b> ${escapeHtml(d.gcm_name||'')}</div>
			<div><b>전화:</b> ${escapeHtml(d.gcm_email||'')}</div>
			<div><b>전화:</b> ${escapeHtml(d.gcm_email||'')}</div>
			<div><b>전화:</b> ${escapeHtml(d.gcm_email||'')}</div>
		</div>
		<div class="modal-bottom">
			<button onclcik="closeModal()">닫기</button>
		</div>`;
		document.getElementById('slide-modal').innerHTML = html;
		openModal();
		function openModal(){ document.getElementById('modal').style.display = 'block'; }
		function closeModal(){ document.getElementById('modal').style.display = 'none'; }

		// 상세 조회 → 모달에 주입
		async function openDetail(idx){
		  try{
		    const res = await fetch('/api/customer/' + encodeURIComponent(idx)); // 예: /api/customer/3
		    if(!res.ok) throw new Error('조회 실패');
		    const d = await res.json(); // { gcm_name, gcm_email, gcm_tel, gcm_addr, ... } (snake_case)

		    // 값 주입 (null/undefined 방지)
		    document.getElementById('name').textContent  = d.gcm_name  ?? '';
		    document.getElementById('email').textContent = d.gcm_email ?? '';
		    document.getElementById('tel').textContent   = d.gcm_tel   ?? '';
		    document.getElementById('addr').textContent  = d.gcm_addr  ?? '';

		    openModal();
		  }catch(e){
		    console.error(e);
		    alert('상세 조회 중 오류가 발생했습니다.');
		  }
		}

		// TODO: 수정/삭제는 추후 구현
		function openEdit(idx){ alert('수정 모달은 이어서 붙일게요. idx=' + idx); }
		function softDelete(idx){ alert('소프트 삭제는 이어서 붙일게요. idx=' + idx); }
}
 
function openModal(){ /* ... */ }
function closeModal(){ /* ... */ }
function escapeHtml(s){ return String(s).replace(/[&<>"']/g, m=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[m])); }

 
 
</script> -->
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
										        <c:out value="${c.gcm_Regdate}"/>
					      </div>
					      <div></div> 
					      <div class="btns-box">
					        <div class="items-btn orange" onclick="openDetail('${c.gcm_Idx}')"></div>
					        <div class="items-btn green"  onclick="openEdit('${c.gcm_Idx}')"></div>
					        <div class="items-btn red"    onclick="softDelete('${c.gcm_Idx}')"></div>
					      </div>
					    </div>
				</c:forEach>
					
			
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