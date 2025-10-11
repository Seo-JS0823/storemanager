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
								<button class="detail-btn" data-gicode="${item.giCode}">상세</button>
								<button class="update-btn" data-gicode="${item.giCode}">수정</button>
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
        const showFormBtn = document.getElementById('show-item-form-btn');
        const sidebar = document.getElementById('right-modal-container');

        // '품목등록' 버튼 모달창 
        showFormBtn.addEventListener('click', showRegistrationModal);

        // '상세보기' 버튼들
        document.querySelectorAll('.detail-btn').forEach(button => {
            button.addEventListener('click', async function() {
                const giCode = this.dataset.gicode;

                try {
                    const response = await fetch('/items/' + giCode);
                    if (!response.ok) throw new Error('데이터 로딩 실패');
                    
                    const item = await response.json();

                    const contentHtml = `
                        <div class="right-modal-wrap">
                            <div class="modal-header">
                                <div>
                                    <span class="material-symbols-outlined">description</span>
                                    <span>품목 상세보기</span>
                                </div>
                                <span class="material-symbols-outlined" id="modal-clear">close</span>
                            </div>
                            <div class="modal-content">
                                <div class="modal-item">
                                    <label>품목 코드</label>
                                    <input type="text" value="${item.giCode || ''}" readonly>
                                </div>
                                <div class="modal-item">
                                    <label>품목명</label>
                                    <input type="text" value="${item.giName || ''}" readonly>
                                </div>
                                <div class="modal-item">
                                    <label>거래처</label>
                                    <input type="text" value="${item.gcmName || ''} (${item.gcmCode || ''})" readonly>
                                </div>
                                <div class="modal-btn-box">
                                    <button type="button" class="btn gray" id="modal-close-btn">닫기</button>
                                </div>
                            </div>
                        </div>
                    `;

                    sidebar.innerHTML = contentHtml;
                    sidebar.style.transform = 'translateX(0)';

                    sidebar.querySelector('#modal-clear').addEventListener('click', hideModal);
                    sidebar.querySelector('#modal-close-btn').addEventListener('click', hideModal);

                } catch (error) {
                    console.error('상세보기 오류:', error);
                    alert('상세 정보를 불러오는 데 실패했습니다.');
                }
            });
        });
        
        //업데이트 버튼 기능
        document.querySelectorAll('.update-btn').forEach(button => {
            button.addEventListener('click', async function() {
                const giCode = this.dataset.gicode;
                try {
                    const response = await fetch('/items/updateform/' + giCode);
                    if (!response.ok) throw new Error('수정 폼 로딩 실패');
                    const formHtml = await response.text();
                    sidebar.innerHTML = formHtml;
                    sidebar.style.transform = 'translateX(0)';
                } catch (error) {
                    console.error('수정 폼 로딩 오류:', error);
                    alert('수정 폼을 불러오는 데 실패했습니다.');
                }
            });
        });
        
        // --- 삭제 버튼 기능 ---
        document.querySelectorAll('.delete-btn').forEach(button => {
            button.addEventListener('click', function() {
                const giCodeToDelete = this.dataset.gicode;
                
                if (confirm(`'${giCodeToDelete}' 품목을 정말로 삭제하시겠습니까?`)) {
                    
                    fetch('/items/' + giCodeToDelete, {
                        method: 'DELETE'
                    })
                    .then(response => {
                        if (!response.ok) {
                            return response.json().then(error => { throw new Error(error.message || '삭제에 실패했습니다.') });
                        }
                        return response.json(); 
                    })
                    .then(data => {
                        alert(data.message);
                        location.reload();
                    })
                    .catch(error => {
                        console.error('삭제 중 오류 발생:', error);
                        alert('삭제 실패: ' + error.message);
                    });
                }
            });
        });

        // 품목 등록 기능
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
            
            // FormData를 URL-encoded string으로 변환
            const formData = new FormData(form);
            const bodyData = new URLSearchParams(formData).toString();

            try {
                const response = await fetch(form.action, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: bodyData
                });

                if (!response.ok) {
                    throw new Error('서버 응답에 실패했습니다.');
                }

                const result = await response.json();
                
                alert(result.message);
                if (response.ok) {
                    location.reload(); 
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