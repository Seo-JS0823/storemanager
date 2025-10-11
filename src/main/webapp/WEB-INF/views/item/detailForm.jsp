<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 이 페이지 전용 스타일 --%>
<style>
    .form-container {
        padding: 2rem;
        display: flex;
        flex-direction: column;
        height: 100%;
        background-color: #F5F5F5;
    }

    .form-header {
        display: flex;
        align-items: center;
        padding-bottom: 1rem;
        margin-bottom: 1rem;
        border-bottom: 0.2rem solid #666;
    }
    .form-header .state-circle {
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        background-color: #00AA00;
        margin-right: 1rem;
    }
    .form-header h2 {
        font-size: 2rem;
        font-weight: 600;
        margin: 0;
    }

    /* 이미지 영역 스타일 */
    .image-area {
        margin-bottom: 1.5rem;
        text-align: center;
    }
    .image-preview {
        width: 15rem;
        height: 15rem;
        border: 2px dashed #ccc;
        border-radius: 0.5rem;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #aaa;
        font-size: 1rem;
        margin: 0 auto 1rem;
        background-color: white;
        cursor: pointer;
        overflow: hidden; 
    }
    .image-preview img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    #itemImageFile {
        display: none; 
    }
    
    /* 입력 필드 그리드 */
    .input-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 0.5rem;
        margin-bottom: 1rem;
    }
    .input-grid .form-group {
        display: flex;
        align-items: center;
        height: 3rem;
    }
    .input-grid .form-group label {
        width: 35%;
        font-size: 1.1rem;
        font-weight: 600;
        text-align: right;
        margin-right: 0.5rem;
    }
    .input-grid .form-group input, .input-grid .form-group select {
        flex-grow: 1;
        padding: 0.5rem;
        border: 1px solid rgba(33, 33, 33, 0.3);
        border-radius: 0.5rem;
        font-size: 1rem;
        background-color: white;
        height: 100%;
    }

    /* REMARK 영역 */
    .remark-area {
        margin-bottom: 2rem;
    }
    .remark-area label {
        display: block;
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 0.5rem;
    }
    .remark-area textarea {
        width: 100%;
        height: 6rem; 
        resize: none;
        outline: none;
        padding: 0.5rem;
        border: 1px solid rgba(33, 33, 33, 0.3);
        border-radius: 0.5rem;
        font-size: 1rem;
    }

    /* 하단 버튼 영역 */
    .form-actions {
        display: flex;
        justify-content: flex-end;
        gap: 1rem;
        margin-top: auto; 
    }
    .form-actions button {
        width: 8rem;
        height: 4rem;
        font-size: 1.5rem;
        font-weight: 600;
        color: white;
        border: none;
        border-radius: 0.5rem;
        cursor: pointer;
    }
    .btn-save { background-color: #00AA00; }
    .btn-cancel { background-color: #DC3545; }
</style>

<div class="form-container">
    <div class="form-header">
        <div class="state-circle" style="background-color: #FFA500;"></div>
        <h2>상세 정보</h2>
        <button type="button" class="btn-cancel modal-close-btn" style="margin-left: auto; background: none; color: #333; font-size: 2rem; width: auto; height: auto;">&times;</button>
    </div>

	<div>
		<div class="image-area">
            <c:choose>
                <c:when test="${not empty item.giImg}">
                    <img src="/item-images/${item.giImg}" alt="품목 이미지" style="cursor: default;">
                </c:when>
                <c:otherwise>
                    <div class="image-preview" style="cursor: default;"><span>이미지 없음</span></div>
                </c:otherwise>
            </c:choose>
		</div>
		
		<div class="input-grid">
			<div class="form-group">
				<label>품목 코드</label>
				<input type="text" value="${item.giCode}" readonly>
			</div>
			<div class="form-group">
				<label>품목명</label>
				<input type="text" value="${item.giName}" readonly>
			</div>
			<div class="form-group">
				<label>거래처</label>
				<input type="text" value="${item.gcmName}" readonly>
			</div>
		</div>

		<div class="remark-area">
			<label for="remark">REMARK</label>
			<textarea id="remark" readonly>${item.remark}</textarea>
		</div>

		<div class="form-actions"> >
            <button type="button" class="btn-cancel modal-close-btn">닫 기</button>
		</div>
	</div>
</div>