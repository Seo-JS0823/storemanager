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
						<div class="m-state green"></div><span>입고수정</span>
						<div class="m-state red"></div><span>출고생성</span>
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
	</div>
</div>
	<script>
    document.addEventListener('DOMContentLoaded', function() {
        const showFormBtn = document.getElementById('show-item-form-btn');
        const sidebar = document.getElementById('right-modal-container');

        // '품목등록' 버튼 클릭 시 모달창 표시
        showFormBtn.addEventListener('click', showRegistrationModal);

        // --- 함수 정의 ---
        async function showRegistrationModal() {
            // API 주소
            const formUrl = '/items/new-form';
            const suppliersUrl = '/api/com-members';

            try {
                // 두 API를 동시에 호출해서 폼 HTML과 거래처 목록을 가져옴
                const [formResponse, suppliersResponse] = await Promise.all([
                    fetch(formUrl),
                    fetch(suppliersUrl)
                ]);

                if (!formResponse.ok || !suppliersResponse.ok) {
                    throw new Error('API 호출에 실패했습니다.');
                }

                const formHtml = await formResponse.text();
                const suppliers = await suppliersResponse.json();

                // 사이드바에 폼 HTML을 삽입
                sidebar.innerHTML = formHtml;
                
                // 가져온 거래처 목록으로 드롭다운을 채움
                const supplierSelect = sidebar.querySelector('#gcmCode');
                supplierSelect.innerHTML = '<option value="" disabled selected>거래처를 선택하세요</option>'; // 기본 옵션
                suppliers.forEach(supplier => {
                    const option = document.createElement('option');
                    option.value = supplier.gcmCode;
                    option.textContent = supplier.gcmName;
                    supplierSelect.appendChild(option);
                });

                // 모달창을 부드럽게 표시
                sidebar.style.transform = 'translateX(0)';

                // 폼 제출 및 취소 버튼에 이벤트 리스너 추가
                addModalEventListeners();

            } catch (error) {
                console.error('모달을 준비하는 중 오류 발생:', error);
                alert('폼을 불러오는 데 실패했습니다.');
            }
        }

        function addModalEventListeners() {
            const form = sidebar.querySelector('#item-register-form');
            if (!form) return;

            const closeBtn = sidebar.querySelector('#modal-clear');
            const cancelBtn = sidebar.querySelector('#modal-close-btn');

            form.addEventListener('submit', handleFormSubmit);
            if(closeBtn) closeBtn.addEventListener('click', hideModal);
            if(cancelBtn) cancelBtn.addEventListener('click', hideModal);
        }

        async function handleFormSubmit(event) {
            event.preventDefault(); 
            const form = event.target;
            const formData = new FormData(form);

            try {
                const response = await fetch(form.action, {
                    method: 'POST',
                    body: new URLSearchParams(formData)
                });

                if (!response.ok) {
                    throw new Error('서버 응답에 실패했습니다.');
                }

                const result = await response.json();

                if (result.status === 'success') {
                    alert(result.message);
                    location.reload(); 
                } else {
                    alert('등록 실패: ' + (result.message || '알 수 없는 오류'));
                }
            } catch (error) {
                console.error('폼 제출 중 오류 발생:', error);
                alert('등록 중 오류가 발생했습니다.');
            }
        }

        function hideModal() {
            sidebar.style.transform = 'translateX(100%)';
        }
    });
    
</script>
</body>
</html>