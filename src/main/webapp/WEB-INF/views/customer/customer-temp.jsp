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

/* 전체 모달 컨테이너 */
#modal-container {
	position: fixed;
	top: 0;
	right: 0;
	width: 400px;
	height: 100%;
	background: #fff;
	box-shadow: -5px 0 15px rgba(0, 0, 0, 0.2);
	transform: translateX(100%);
	transition: transform 0.4s ease;
	z-index: 1000;
	display: flex;
	flex-direction: column;
}

/* 모달 헤더 */
.modal-header {
	padding: 16px 20px;
	background-color: #2f5bff;
	color: white;
	font-weight: bold;
	font-size: 18px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	border-bottom: 1px solid #e5e5e5;
}

/* 닫기 버튼 */
.modal-header .close-btn {
	cursor: pointer;
	font-size: 22px;
	transition: 0.3s;
}
.modal-header .close-btn:hover {
	transform: rotate(90deg);
}

/* 모달 중간 내용 */
.modal-middle {
	flex: 1;
	overflow-y: auto;
	padding: 20px;
	display: flex;
	flex-direction: column;
	gap: 14px;
}
.modal-middle div {
	display: flex;
	flex-direction: column;
}
.modal-middle p {
	font-weight: 600;
	margin-bottom: 6px;
	color: #333;
}
.modal-middle input {
	border: 1px solid #ddd;
	border-radius: 6px;
	padding: 8px 10px;
	font-size: 14px;
	transition: border 0.3s;
}
.modal-middle input:focus {
	border-color: #2f5bff;
	outline: none;
}

/* 하단 버튼 영역 */
.modal-bottom {
	padding: 16px 20px;
	background-color: #f7f7f7;
	border-top: 1px solid #e5e5e5;
	display: flex;
	justify-content: flex-end;
	gap: 10px;
}
.modal-bottom button {
	padding: 8px 14px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-weight: 600;
}
.modal-bottom .save {
	background-color: #2f5bff;
	color: white;
}
.modal-bottom .cancel {
	background-color: #ccc;
	color: #333;
}
.modal-bottom .save:hover {
	background-color: #2346d4;
}
.modal-bottom .cancel:hover {
	background-color: #aaa;
}

/* 모달 오버레이 (배경 어둡게) */
#modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	display: none;
	z-index: 999;
}
</style>

</head>
<body>
<div id="modal-overlay"></div>
<div id="modal-container">
	<div class="modal-header">
		<div>거래처 상세보기</div>
		<span class="close-btn" id="modal-close">&times;</span>
	</div>
	<div class="modal-middle">
		<div><p>거래처 코드</p> <input type="text" id="giCode" readonly></div>
		<div><p>거래처 명</p> <input type="text" id="giName" readonly></div>
		<div><p>이메일</p> <input type="text" id="giEmail" readonly></div>
		<div><p>전화번호</p> <input type="text" id="giTel" readonly></div>
		<div><p>주소</p> <input type="text" id="giAddr" readonly></div>
		<div><p>등록일</p> <input type="text" id="giRegDate" readonly></div>
	</div>
	<div class="modal-bottom">
		<button class="cancel" id="modal-cancel">닫기</button>
		<button class="save">수정하기</button>
	</div>
</div>
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
					<div class="green" id="각자따로" id="btn-create">입고생성</div>
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
					        <div class="items-btn orange" onclick="openDetail(${c.gcm_Idx})"></div>
					        <div class="items-btn green"  onclick="openEdit(${c.gcm_Idx})"></div>
					        <div class="items-btn red"    onclick="softDelete(${c.gcm_Idx})"></div>
					      </div>
					    </div>
				</c:forEach>
		    </div>
		<!-- 아이템 리스트 뿌려주기 -->
		</div>
	</div>
</div>
<div id="modal" style="display:none">
	<div><b>거래처명</b><span id="name"></span></div>
	<div><b>이메일</b><span id="email"></span></div>
	<div><b>전화번호</b><span id="tel"></span></div>
	<div><b>주소</b><span id="addr"></span></div>
</div>
 <script>

//모달 엘리먼트
const modal    = document.getElementById('modal-container');
const overlay  = document.getElementById('modal-overlay');
const closeBtn = document.getElementById('modal-close');
const cancelBtn= document.getElementById('modal-cancel');
const saveBtn  = document.querySelector('.modal-bottom .save');

//공통: 열고 닫기
function openModal() {
modal.style.transform = 'translateX(0%)';
overlay.style.display = 'block';
}
function closeModal() {
modal.style.transform = 'translateX(100%)';
overlay.style.display = 'none';
}

//“입고생성” 전용: 입력 초기화 + 편집 가능 + 타이틀/버튼 텍스트 변경
function setCreateMode() {
const titleEl = modal.querySelector('.modal-header div');
titleEl.textContent = '입고 생성';

// 필요한 입력값 초기화(필요 시 항목 바꾸세요)
const fields = ['giCode','giName','giEmail','giTel','giAddr','giRegDate'];
fields.forEach(id => {
  const el = document.getElementById(id);
  if (!el) return;
  el.readOnly = false;      // 생성은 편집 가능
  el.value = '';            // 생성이니까 비워두기
});

// 저장 버튼 라벨/동작
saveBtn.textContent = '저장';
saveBtn.onclick = handleCreateSave;
}

//실제 저장(샘플) — API 경로는 프로젝트에 맞게 변경
async function handleCreateSave(){
try{
  const payload = {
    code:  document.getElementById('giCode')?.value ?? '',
    name:  document.getElementById('giName')?.value ?? '',
    email: document.getElementById('giEmail')?.value ?? '',
    tel:   document.getElementById('giTel')?.value ?? '',
    addr:  document.getElementById('giAddr')?.value ?? '',
    // regDate는 서버에서 now()로 넣는 게 보통이라 비워두거나 선택 입력
  };

  // TODO: 실제 API 엔드포인트로 교체
  // const res = await fetch('/api/inbound', {
  //   method: 'POST',
  //   headers: {'Content-Type':'application/json'},
  //   body: JSON.stringify(payload)
  // });
  // if(!res.ok) throw new Error('저장 실패');
  // const result = await res.json();

  alert('입고가 저장되었다고 가정(엔드포인트 연결 필요)!');
  closeModal();
  // TODO: 목록 갱신 필요 시 fetch 후 렌더링 or location.reload();
}catch(e){
  console.error(e);
  alert('저장 중 오류가 발생했습니다.');
}
}

//닫기 이벤트 바인딩(중복 바인딩 방지 위해 optional chaining)
closeBtn?.addEventListener('click', closeModal);
cancelBtn?.addEventListener('click', closeModal);
overlay?.addEventListener('click', closeModal);

//★ 여기! “입고생성” 버튼 클릭 시 생성 모드로 오픈
document.getElementById('각자따로')?.addEventListener('click', (e)=>{
e.stopPropagation();
setCreateMode();
openModal();
});

document.addEventListener("DOMContentLoaded", () => {
	  const modal = document.getElementById('modal-container');
	  const overlay = document.getElementById('modal-overlay');
	  const closeBtn = document.getElementById('modal-close');
	  const cancelBtn = document.getElementById('modal-cancel');
	  const createBtn = document.getElementById('btn-create');

	  // 모달 열기 / 닫기
	  function openModal() {
	    modal.style.transform = 'translateX(0%)';
	    overlay.style.display = 'block';
	  }
	  function closeModal() {
	    modal.style.transform = 'translateX(100%)';
	    overlay.style.display = 'none';
	  }

	  // 이벤트 등록
	  closeBtn.addEventListener('click', closeModal);
	  cancelBtn.addEventListener('click', closeModal);
	  overlay.addEventListener('click', closeModal);
	  createBtn.addEventListener('click', openModal); // ✅ 입고생성 클릭 시 열기
	});
</script>

</body>
</html>