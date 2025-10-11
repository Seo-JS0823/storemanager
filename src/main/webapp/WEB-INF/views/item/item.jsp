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
                            <input type="checkbox" id="includeDeleted" name="includeDeleted" value="true">
                            <label for="includeDeleted">삭제된 품목 보기</label>
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
						<div>품목</div>
						<div>품목코드</div>
						<div>거래처</div>
						<div>거래처코드</div>
						<div></div>
						<div>관리</div>
				</div>
				<div class="m-items">
					<c:forEach var="item" items="${items}" varStatus="loop">
						<div class="${item.giDelFlag == 'Y' ? 'deleted-item' : ''}">
							<div>${loop.count}</div>
							<div>${item.giName}</div>
							<div>${item.giCode}</div>
							<div>${item.gcmName}</div>
							<div>${item.gcmCode}</div>
							<div></div>
							<div class="btns-box">
								<c:if test="${item.giDelFlag == 'N'}">
									<button class="detail-btn" data-gicode="${item.giCode}">상세</button>
									<button class="update-btn" data-gicode="${item.giCode}">업데이트</button>
									<button class="delete-btn" data-gicode="${item.giCode}">삭제</button>
								</c:if>
								<c:if test="${item.giDelFlag == 'Y'}">
									<button class="restore-btn" data-gicode="${item.giCode}">복구</button>
								</c:if>
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
    
    const modalContainer = document.getElementById('right-modal-container');

    // --- 신규 품목 등록 버튼 ---
    const showFormBtn = document.getElementById('show-item-form-btn');
    if (showFormBtn) {
        showFormBtn.addEventListener('click', showRegistrationModal);
    }
    
    // --- 상세보기 버튼 ---
    document.querySelectorAll('.detail-btn').forEach(button => {
        button.addEventListener('click', function() {
            const giCode = this.getAttribute('data-gicode');
            fetch('/items/detail-form/' + giCode)
                .then(res => res.text())
                .then(formHtml => {
                    openModal(formHtml); 
                });
        });
    });
    
    // --- 업데이트 버튼 ---
	document.querySelectorAll('.update-btn').forEach(button => {
	    button.addEventListener('click', function() {
	        const giCode = this.getAttribute('data-gicode');
	
	        fetch('/items/update-form/' + giCode)
	            .then(res => res.text())
	            .then(formHtml => {
	                openModal(formHtml);
	                
	                const updateForm = document.getElementById('item-update-form');
	                if (updateForm) {
	                    updateForm.addEventListener('submit', function(event) {
	                        event.preventDefault();
	
	                        const formData = new FormData(this);
	
	                        fetch(this.action, {
	                            method: 'POST',
	                            body: formData
	                        })
	                        .then(response => response.json())
	                        .then(data => {
	                            alert(data.message || '성공적으로 수정되었습니다.');
	                            closeModal();
	                            location.reload();
	                        })
	                        .catch(error => {
	                            console.error('Update Error:', error);
	                            alert('수정 중 오류가 발생했습니다.');
	                        });
	                    });
	                }
	            });
	    });
	});
    // --- 삭제 버튼 ---
    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function() {
            const giCodeToDelete = this.getAttribute('data-gicode');
            if (!giCodeToDelete) return alert("오류: 품목 코드를 찾을 수 없습니다.");

            if (confirm(`'${giCodeToDelete}' 품목을 정말로 삭제하시겠습니까?`)) {
                fetch('/items/delete/' + giCodeToDelete, { method: 'DELETE' })
                    .then(response => {
                        if (!response.ok) return response.json().then(err => { throw new Error(err.message || '삭제 실패') });
                        return response.json();
                    })
                    .then(data => {
                        alert(data.message);
                        location.reload();
                    })
                    .catch(error => alert('삭제 실패: ' + error.message));
            }
        });
    });
    
    // --- 복구 버튼 ---
    document.querySelectorAll('.restore-btn').forEach(button => {
        button.addEventListener('click', function() {
            const giCodeToRestore = this.getAttribute('data-gicode');
            if (!giCodeToRestore) return alert("오류: 품목 코드를 찾을 수 없습니다.");

            if (confirm(`'${giCodeToRestore}' 품목을 정말로 복구하시겠습니까?`)) {
                fetch('/items/restore/' + giCodeToRestore, { method: 'POST' }) 
                    .then(response => {
                        if (!response.ok) return response.json().then(err => { throw new Error(err.message || '복구 실패') });
                        return response.json();
                    })
                    .then(data => {
                        alert(data.message);
                        location.reload();
                    })
                    .catch(error => alert('복구 실패: ' + error.message));
            }
        });
    });

    // --- 공통 모달 함수 ---
    function openModal(htmlContent) {
        modalContainer.innerHTML = htmlContent;
        modalContainer.style.transform = 'translateX(0)';
        modalContainer.querySelectorAll('.modal-close-btn').forEach(btn => {
            btn.addEventListener('click', closeModal);
        });
    }

    function closeModal() {
        modalContainer.style.transform = 'translateX(100%)';
    }

    // --- 품목 등록 관련 함수들 ---
	async function showRegistrationModal() {
	    try {
	        const formHtml = await fetch('/items/new-form').then(res => res.text());
	
	        modalContainer.innerHTML = formHtml;
	        modalContainer.style.transform = 'translateX(0)';
	
	        const imageInput = modalContainer.querySelector('#itemImageFile');
	        const imgElement = modalContainer.querySelector('#previewImageElement');
	        const initialTextSpan = modalContainer.querySelector('#initialTextSpan');
	        const deleteBtn = modalContainer.querySelector('#deleteImageBtn');
	
	        if (imageInput && imgElement && initialTextSpan && deleteBtn) {
	            
	            imageInput.addEventListener('change', function() {
	                const file = this.files[0];
	                if (file) {
	                    const reader = new FileReader();
	                    reader.onload = function(e) {
	                        imgElement.src = e.target.result;
	                        imgElement.style.display = 'block';
	                        initialTextSpan.style.display = 'none';
	                        deleteBtn.style.display = 'inline-block';
	                    }
	                    reader.readAsDataURL(file);
	                } else {
	                    imgElement.src = '';
	                    imgElement.style.display = 'none';
	                    initialTextSpan.style.display = 'block';
	                    deleteBtn.style.display = 'none';
	                }
	            });
	
	            deleteBtn.addEventListener('click', function() {
	                imageInput.value = ''; 
	                imgElement.src = '';
	                imgElement.style.display = 'none';
	                initialTextSpan.style.display = 'block';
	                deleteBtn.style.display = 'none';
	            });
	        }
	        
	        modalContainer.querySelectorAll('.modal-close-btn').forEach(btn => {
	            btn.addEventListener('click', closeModal);
	        });
	
	        const suppliers = await fetch('/api/suppliers').then(res => res.json());
	        const supplierSelect = modalContainer.querySelector('#gcmCode');
	        suppliers.forEach(supplier => {
	            const option = document.createElement('option');
	            option.value = supplier.gcmCode;
	            option.textContent = supplier.gcmName;
	            supplierSelect.appendChild(option);
	        });
	        
	        const form = modalContainer.querySelector('#item-register-form');
	        if(form) {
	            form.addEventListener('submit', handleFormSubmit);
	        }
	
	    } catch (error) {
	        alert('폼을 불러오는 데 실패했습니다.');
	        console.error('Registration modal error:', error);
	    }
	}


	async function handleFormSubmit(event) {
	    event.preventDefault(); 
	    const form = event.target;
	    const formData = new FormData(form);
	
	    try {
	        const response = await fetch(form.action, {
	            method: 'POST',
	            body: formData
	        });

	        if (!response.ok) {
	            const errorText = await response.text(); 
	            throw new Error(`서버 응답 실패: ${errorText}`);
	        }
	
	        const result = await response.json();
	        alert(result.message);
	        location.reload(); 
	    } catch (error) {
	        console.error('등록 오류:', error);
	        alert('등록 중 오류가 발생했습니다. 개발자 콘솔을 확인하세요.');
	    }
	}
});
</script>
<script src="/js/render.js"></script>
<script src="/js/member.js"></script>
</body>
</html>	