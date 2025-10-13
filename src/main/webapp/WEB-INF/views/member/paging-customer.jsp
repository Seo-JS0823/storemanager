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
  <title>거래처관리</title>
  <style>
    @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
    body {
      font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
      background-color: #f8fafc;
      color: #222;
    }
    /* 모달 전체 */
    #modal-container {
      position: fixed; top: 0; right: 0;
      width: 420px; height: 100%;
      background: rgba(255,255,255,0.9);
      backdrop-filter: blur(15px);
      box-shadow: -8px 0 30px rgba(0,0,0,0.15);
      transform: translateX(100%);
      transition: transform 0.35s cubic-bezier(0.4, 0, 0.2, 1);
      z-index: 1000; display: flex; flex-direction: column;
      border-left: 1px solid rgba(0,0,0,0.08);
    }
    #modal-overlay {
      position: fixed; top:0; left:0; width:100%; height:100%;
      background: rgba(17,24,39,0.4);
      display: none; z-index:999; backdrop-filter: blur(4px);
    }
    .modal-header {
      display: flex; align-items: center; justify-content: space-between;
      padding: 18px 22px; background: linear-gradient(135deg,#3b82f6,#2563eb);
      color:#fff; font-weight:600; font-size:18px;
      box-shadow:0 1px 8px rgba(0,0,0,0.1);
    }
    .modal-header .close-btn { cursor:pointer; font-size:22px; opacity:.85; transition:.3s; }
    .modal-header .close-btn:hover { transform: rotate(90deg) scale(1.2); opacity:1; }
    .modal-middle {
      flex:1; overflow-y:auto; padding:24px;
      display:flex; flex-direction:column; gap:16px;
    }
    .modal-middle p { font-weight:600; margin-bottom:6px; color:#374151; font-size:14px; }
    .modal-middle input {
      border:1px solid #e5e7eb; border-radius:10px; padding:10px 12px;
      font-size:14px; background-color:#f9fafb; transition: all 0.25s ease;
    }
    .modal-middle input:focus {
      border-color:#3b82f6; background-color:#fff;
      box-shadow:0 0 0 3px rgba(59,130,246,0.2); outline:none;
    }
    .modal-middle button {
      margin-top:6px; align-self:flex-start;
      background:#f3f4f6; color:#333; border:none;
      border-radius:8px; padding:6px 12px; font-size:13px; cursor:pointer;
      transition: background 0.25s ease;
    }
    .modal-middle button:hover { background:#e5e7eb; }
    .modal-bottom {
      padding:16px 22px; background:rgba(250,250,250,0.8);
      border-top:1px solid #e5e7eb;
      display:flex; justify-content:flex-end; gap:10px;
    }
    .modal-bottom button {
      padding:10px 18px; border:none; border-radius:8px;
      cursor:pointer; font-weight:600; font-size:14px; transition:.3s;
    }
    .modal-bottom .cancel { background-color:#e5e7eb; color:#374151; }
    .modal-bottom .cancel:hover { background-color:#d1d5db; }
    .modal-bottom .save {
      background: linear-gradient(135deg,#3b82f6,#2563eb);
      color:#fff; box-shadow:0 3px 10px rgba(59,130,246,0.25);
    }
    .modal-bottom .save:hover {
      background: linear-gradient(135deg,#2563eb,#1d4ed8);
      box-shadow:0 5px 12px rgba(37,99,235,0.35);
    }
  </style>
</head>
<body>

<!-- ===== 모달 ===== -->
<div id="modal-overlay"></div>
<div id="modal-container">
  <div class="modal-header">
    <div>거래처 상세보기</div>
    <span class="close-btn" id="modal-close">&times;</span>
  </div>
  <div class="modal-middle">
    <div><p>거래처 코드</p><input type="text" id="giCode" readonly></div>
    <div><p>거래처 명</p><input type="text" id="giName" readonly></div>
    <div><p>이메일</p><input type="text" id="giEmail" readonly></div>
    <div><p>전화번호</p><input type="text" id="giTel" readonly></div>
    <div><p>주소</p><input type="text" id="giAddr" readonly><button type="button" onclick="Postcode()">검색</button></div>
    <div><p>등록일</p><input type="text" id="giRegDate" readonly></div>
  </div>
  <div class="modal-bottom">
    <button class="cancel" id="modal-cancel">닫기</button>
    <button class="save" id="modal-save">수정하기</button>
  </div>
</div>

<!-- ===== 메인 영역 ===== -->
<div class="wrap">
  <%@ include file="../layout/left-menu.jsp"%>
  <div class="right-wrap">
    <%@ include file="../layout/header.jsp"%>

    <div class="m-box">
      <div class="m-header">
        <span class="material-symbols-outlined">apps</span>
        <span>거래처관리</span>
      </div>
      <div></div>
      <div>
        <div>
          <div class="m-state orange"></div><span>상세보기</span>
          <div class="m-state green"></div><span>입고수정</span>
          <div class="m-state red"></div><span>출고생성</span>
        </div>
   
        <div class="green" id="btn-create">거래처등록</div>
      </div>
    <!-- ===== 검색 ===== -->
    <div class="m-search">
      <div class="m-search-line">
        <div class="m-search-date">
          <input type="date" name="startdate">
          <p>&nbsp;~&nbsp;</p>
          <input type="date" name="enddate">
        </div>
        <div class="m-search-option">
          <div><input type="radio" id="searchEvent1" name="searchoption"><p>상품명</p></div>
          <div><input type="radio" id="searchEvent2" name="searchoption"><p>매입처명</p></div>
          <div><input type="radio" id="searchEvent3" name="searchoption"><p>거래단가</p></div>
        </div>
        <div class="m-search-text">
          <input type="text" name="search" placeholder="검색어를 입력하세요."><div>검색</div>
        </div>
      </div>
    </div>

    <!-- ===== 테이블 ===== -->
    <div class="m-search-sort">
      <div>거래처 코드</div>
      <div>거래처명</div>
      <div>이메일</div>
      <div>전화번호</div>
      <div>주소</div>
      <div>등록일</div>
    </div>

    <div class="m-items" id="m-items-customer"></div>
    <div class="paging" id="paging"></div>
    </div>

  </div>
</div>

<!-- ===== JS ===== -->
<script>
// === 모달 제어 ===
const modal = document.getElementById('modal-container');
const overlay = document.getElementById('modal-overlay');
const closeBtn = document.getElementById('modal-close');
const cancelBtn = document.getElementById('modal-cancel');
const saveBtn = document.getElementById('modal-save');

function openModal(){ modal.style.transform='translateX(0%)'; overlay.style.display='block'; }
function closeModal(){ modal.style.transform='translateX(100%)'; overlay.style.display='none'; }

closeBtn.addEventListener('click', closeModal);
cancelBtn.addEventListener('click', closeModal);
overlay.addEventListener('click', closeModal);

// === 거래처등록 버튼 ===
document.getElementById('btn-create').addEventListener('click', ()=>{
  setCreateMode();
  openModal();
});

function setCreateMode(){
  modal.querySelector('.modal-header div').textContent='거래처 등록';
  saveBtn.textContent='저장';
  saveBtn.onclick=handleCreateSave;
  ['giCode','giName','giEmail','giTel','giAddr','giRegDate'].forEach(id=>{
    const el=document.getElementById(id);
    if(!el)return;
    el.readOnly=false;
    el.value='';
  });
}

// === 등록 저장 ===
async function handleCreateSave(){
  const payload={
    gcm_Code:giCode.value.trim(),
    gcm_Name:giName.value.trim(),
    gcm_Email:giEmail.value.trim(),
    gcm_Tel:giTel.value.trim(),
    gcm_Addr:giAddr.value.trim()
  };
  try{
    const res=await fetch('/api/customer',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(payload)});
    if(!res.ok) throw new Error('등록 실패');
    alert('등록 완료');
    closeModal();
    location.reload();
  }catch(e){alert('등록 중 오류');console.error(e);}
}

// === 검색 & 날짜 ===
const searchInput=document.querySelector('.m-search-text input[name="search"]');
const searchBtn=document.querySelector('.m-search-text div');
const startEl=document.querySelector('input[name="startdate"]');
const endEl=document.querySelector('input[name="enddate"]');
const listWrap=document.querySelector('.m-items');

searchBtn.addEventListener('click',doSearch);
searchInput.addEventListener('keydown',(e)=>{if(e.key==='Enter')doSearch();});
startEl.addEventListener('change',doSearch);
endEl.addEventListener('change',doSearch);

async function doSearch(){
  const keyword=searchInput.value.trim();
  const start=startEl.value.trim();
  const end=endEl.value.trim();

  const params=new URLSearchParams();
  if(keyword)params.append('keyword',keyword);
  if(start)params.append('startdate',start);
  if(end)params.append('enddate',end);

  try{
    const res=await fetch('/api/customer/search?'+params.toString());
    if(!res.ok)throw new Error('검색 실패');
    const list=await res.json();
    if(!Array.isArray(list)||list.length===0){
      listWrap.innerHTML='<div style="padding:20px;text-align:center;color:#999;">검색 결과가 없습니다.</div>';
      return;
    }
    listWrap.innerHTML=list.map(c=>`
      <div>
        <div>\${escapeHtml(c.gcm_Code||'')}</div>
        <div>\${escapeHtml(c.gcm_Name||'')}</div>
        <div>\${escapeHtml(c.gcm_Email||'')}</div>
        <div>\${escapeHtml(c.gcm_Tel||'')}</div>
        <div>\${escapeHtml(c.gcm_Addr||'')}</div>
        <div>\${c.gcm_Regdate?c.gcm_Regdate.replace('T',' '):''}</div>
        <div></div>
        <div class="btns-box">
          <div class="items-btn orange" onclick="openDetail(\${c.gcm_Idx})"></div>
          <div class="items-btn green" onclick="openEdit(\${c.gcm_Idx})"></div>
          <div class="items-btn red" onclick="softDelete(\${c.gcm_Idx})"></div>
        </div>
      </div>`).join('');
  }catch(e){console.error(e);alert('검색 오류');}
}

function escapeHtml(s){
  return String(s).replace(/[&<>"'`=\/]/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;','/':'&#x2F;','`':'&#x60;','=':'&#x3D;'}[c]));
}
</script>
</body>
</html>
