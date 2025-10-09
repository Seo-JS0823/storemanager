<<<<<<< HEAD
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
	<title>품목 관리</title>
</head>
<body>
<div class="wrap">
	<%@ include file="../layout/left-menu.jsp"%>
	<div class="right-wrap">
		<%@ include file="../layout/header.jsp"%>
		<div>
			<div class="m-box">
				<div class="m-header">
					<span class="material-symbols-outlined">apps</span>
					<span>품목관리</span>
				</div>
				<div></div>
				<div>
					<div>
						<div class="m-state orange"></div><span>상세보기</span>
						<div class="m-state green"></div><span>업데이트</span>
						<div class="m-state red"></div><span>삭제</span>
					</div>
					<div class="green" id="show-item-form-btn">품목등록</div>
				</div>
			</div>
			<div class="m-search">
				<div>
				<form action="/items" method="get" class="m-search line">
                	<div class="m-search-line">
                    	<div class="m-search-date"> <input type="date" name="startdate">
                            <p>&nbsp;&nbsp;~&nbsp;&nbsp;</p>
                            <input type="date" name="enddate">
                        </div>
                        <div class="m-search-option">
                            <div><input type="radio" id="searchEvent1" name="searchoption"><p>상품명</p></div>
                            <div><input type="radio" id="searchEvent2" name="searchoption"><p>매입처명</p></div>
                            <div><input type="radio" id="searchEvent3" name="searchoption"><p>거래단가</p></div>
                        </div>
                        <div class="m-search-text"> <input type="text" name="search" placeholder="검색어를 입력하세요."><button type="submit">검색</button>
                        </div>
                    </div>
                  </form>
               </div>
			</div>
			<div class="m-search-sort">
					<div>번호</div>
					<div>품목코드</div>
					<div>상품명</div>
					<div>매입처명</div>
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
							<div></div>
							<div></div>
							<div class="btns-box">
								<button class="detail-btn" data-gicode="${item.giCode}">상세</button>
								<button class="update-btn" data-gicode="${item.giCode}">업데이트</button>
								<button class="delete-btn" data-gicode="${item.giCode}">삭제</button>
							</div>
						</div>
					</c:forEach>
					<div></div>
				</div>
			</div>
		  <div id="right-modal-container"></div>
	</div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    console.log("1. 페이지 로딩 완료, 스크립트 실행 시작.");

    const showFormBtn = document.getElementById('show-item-form-btn');
    const sidebar = document.getElementById('right-modal-container');

    showFormBtn.addEventListener('click', showRegistrationModal);

    // '상세보기' 버튼 기능
    const detailButtons = document.querySelectorAll('.detail-btn');
    console.log(`2. 상세보기 버튼 ${detailButtons.length}개를 찾았습니다.`);
    detailButtons.forEach(button => {
        button.addEventListener('click', function() {
            console.log("3. 상세보기 버튼이 클릭되었습니다!");
            try {
                const giCode = this.getAttribute('data-gicode');
                console.log("4. 읽어온 data-gicode 값:", giCode); // <-- 가장 중요한 단서!

                if (!giCode) {
                    console.error("5. giCode 값이 비어있거나 null입니다. 여기서 중단됩니다.");
                    alert("오류: 품목 코드를 찾을 수 없습니다.");
                    return; // 함수 중단
                }
                
                const url = '/items/detail/' + giCode;
                console.log("6. 서버에 요청할 최종 URL:", url);
                
                // fetch 로직은 그대로 둡니다.
                fetch(url).then(response => {
                    if (!response.ok) throw new Error('데이터 로딩 실패');
                    return response.json();
                }).then(item => {
                    // ... (이하 생략)
                });
            } catch (e) {
                console.error("상세보기 기능 전체에서 오류 발생:", e);
            }
        });
    });
    
    // '업데이트' 버튼 기능
    const updateButtons = document.querySelectorAll('.update-btn');
    console.log(`2-1. 업데이트 버튼 ${updateButtons.length}개를 찾았습니다.`);
    updateButtons.forEach(button => {
        button.addEventListener('click', function() {
            console.log("3-1. 업데이트 버튼이 클릭되었습니다!");
            const giCode = this.getAttribute('data-gicode');
            console.log("4-1. 읽어온 data-gicode 값:", giCode);
            // ... (이하 생략)
        });
    });

    // '삭제' 버튼 기능
    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function() {
            const giCodeToDelete = this.getAttribute('data-gicode');
            if (confirm(`'${giCodeToDelete}' 품목을 정말로 삭제하시겠습니까?`)) {
                fetch('/items/delete/' + giCodeToDelete, {
                    method: 'DELETE'
                })
                .then(response => {
                    if(!response.ok) { return response.json().then(error => { throw new Error(error.message || '삭제 실패') }); }
                    return response.json();
                })
                .then(data => {
                    alert(data.message);
                    location.reload();
                })
                .catch(error => {
                    console.error('삭제 처리 중 오류 발생:', error);
                    alert('삭제 실패: ' + error.message);
                });
            }
        });
    });

    // --- 공통 함수들 ---

    // '품목 등록' 폼을 보여주는 함수
    async function showRegistrationModal() {
        const formUrl = '/items/new-form';
        const suppliersUrl = '/api/com-members';
        try {
            const [formResponse, suppliersResponse] = await Promise.all([
                fetch(formUrl),
                fetch(suppliersUrl)
            ]);
            if (!formResponse.ok || !suppliersResponse.ok) {
                throw new Error('API 호출에 실패했습니다.');
            }
            const formHtml = await formResponse.text();
            const suppliers = await suppliersResponse.json();
            sidebar.innerHTML = formHtml;
            const supplierSelect = sidebar.querySelector('#gcmCode');
            supplierSelect.innerHTML = '<option value="" disabled selected>거래처를 선택하세요</option>';
            suppliers.forEach(supplier => {
                const option = document.createElement('option');
                option.value = supplier.gcmCode;
                option.textContent = supplier.gcmName;
                supplierSelect.appendChild(option);
            });
            sidebar.style.transform = 'translateX(0)';
            addModalEventListeners();
        } catch (error) {
            console.error('모달을 준비하는 중 오류 발생:', error);
            alert('폼을 불러오는 데 실패했습니다.');
        }
    }

    // '품목 등록' 폼의 버튼에 이벤트 리스너를 추가하는 함수
    function addModalEventListeners() {
        const form = sidebar.querySelector('#item-register-form');
        if (!form) return;
        form.addEventListener('submit', handleFormSubmit);
        sidebar.querySelector('#modal-clear').addEventListener('click', hideModal);
        sidebar.querySelector('#modal-close-btn').addEventListener('click', hideModal);
    }

    // '품목 등록' 폼 데이터를 서버로 전송하는 함수
    async function handleFormSubmit(event) {
        event.preventDefault(); 
        const form = event.target;
        const bodyData = new URLSearchParams(new FormData(form)).toString();
        try {
            const response = await fetch(form.action, {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: bodyData
            });
            if (!response.ok) throw new Error('서버 응답에 실패했습니다.');
            const result = await response.json();
            alert(result.message);
            if (response.ok) location.reload(); 
        } catch (error) {
            console.error('폼 제출 중 오류 발생:', error);
            alert('등록 중 오류가 발생했습니다.');
        }
    }

    // 사이드바를 숨기는 공통 함수
    function hideModal() {
        sidebar.style.transform = 'translateX(100%)';
    }

});   
</script>
<script src="/js/member.js"></script>
</body>
=======
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
>>>>>>> fe880323677131d19633a252e168557fc548128b
</html>