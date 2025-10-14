<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .form-container {
        padding: 16px;
        display: flex;
        flex-direction: column;
        height: 100%;
        background-color: #f8fafc;
    }
    .form-header {
        display: flex;
        align-items: center;
        margin-bottom: 16px;
    }
    .form-header .state-circle {
        width: 24px;
        height: 24px;
        border-radius: 50%;
        margin-right: 12px;
    }
    .form-header h2 {
        font-size: 24px; 
        font-weight: 700;
        margin: 0;
        color: #1f2937;
    }
    .image-area {
        margin-bottom: 16px;
        text-align: center;
    }
    .image-preview {
	    width: 160px; 
	    height: 160px;
	    border: 2px dashed #d1d5db;
	    border-radius: 12px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    color: #9ca3af;
	    font-size: 16px;
	    margin: 0 auto 12px;
	    background-color: white;
	    cursor: pointer;
	    overflow: hidden; 
	    position: relative;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }
    .image-preview img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    #itemImageFile {
        display: none; 
    }
    .btn-change-image {
        display: inline-block;
        padding: 8px 16px;
        background-color: #3b82f6;
        color: white;
        border-radius: 8px;
        cursor: pointer;
        border: none;
        font-size: 14px;
        font-weight: 600;
        transition: background-color 0.2s;
    }
    .btn-change-image:hover {
        background-color: #2563eb;
    }
    #deleteImageBtn {
        position: absolute;
        top: 4px; 
        right: 4px; 
        background-color: rgba(239, 68, 68, 0.8);
        color: white;
        border: none;
        border-radius: 50%; 
        width: 24px; 
        height: 24px; 
        font-size: 14px; 
        font-weight: bold;
        display: flex; 
        align-items: center;
        justify-content: center;
        cursor: pointer;
        z-index: 10; 
        padding: 0; 
        line-height: 1;
        transition: background-color 0.2s;
    }
    #deleteImageBtn:hover {
        background-color: #dc2626;
    }
    .input-grid {
        display: grid;
        grid-template-columns: 1fr;
        gap: 12px;
        margin-bottom: 16px; 
    }
    .input-grid .form-group {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }
    .input-grid .form-group label {
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 6px; 
        color: #374151;
    }
    .input-grid .form-group input, 
    .input-grid .form-group select {
        width: 100%;
        padding: 8px 16px;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        font-size: 16px;
        background-color: white;
        height: 40px; 
        box-sizing: border-box;
    }
    .remark-area {
        margin-bottom: 16px; 
    }
    .remark-area label {
        display: block;
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 6px;
        color: #374151;
    }
    .remark-area textarea {
        width: 100%;
        height: 120px;
        resize: vertical;
        outline: none;
        padding: 10px 16px; 
        border: 1px solid #d1d5db;
        border-radius: 8px;
        font-size: 16px;
        box-sizing: border-box;
    }
    .form-actions {
        display: flex;
        justify-content: flex-end;
        gap: 12px; 
        margin-top: auto; 
    }
    .form-actions button {
        padding: 10px 24px; 
        font-size: 16px; 
        font-weight: 600;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: opacity 0.2s;
    }
    .form-actions button:hover {
        opacity: 0.85;
    }
    .btn-save { background-color: #22c55e; }
    .btn-cancel { background-color: #DC3545; }
</style>

<div class="form-container">
    <div class="form-header">
        <div class="state-circle" style="background-color: #22c55e;"></div>
        <h2>품목 수정</h2>
    </div>

    <form id="item-update-form" action="/items/update" method="post" enctype="multipart/form-data">
        <div class="image-area">
            <div class="image-preview" id="imagePreview">
                <img id="previewImageElement" 
                     src="${not empty item.giImg ? '/items/image/'.concat(item.giImg) : ''}" 
                     alt="Image preview" 
                     style="${empty item.giImg ? 'display: none;' : ''}">
                <span id="initialTextSpan" style="${not empty item.giImg ? 'display: none;' : ''}">이미지 추가</span>
                <button type="button" id="deleteImageBtn" style="${empty item.giImg ? 'display: none;' : ''}">X</button>
            </div>
            <label for="itemImageFile" class="btn-change-image">이미지 변경</label>
            <input type="file" id="itemImageFile" name="file" accept="image/*">
        </div>
        
        <div class="input-grid">
            <input type="hidden" name="giCode" value="${item.giCode}">
            <input type="hidden" name="originalGiImg" value="${item.giImg}">
            <input type="hidden" id="imageDeleted" name="imageDeleted" value="false">

            <div class="form-group">
                <label for="gcmCode">거래처 선택</label>
                <select id="gcmCode" name="gcmCode" required>
                    <c:forEach var="supplier" items="${suppliers}">
                       <option value="${supplier.gcmCode}" ${supplier.gcmCode eq item.gcmCode ? 'selected' : ''}>
                            ${supplier.gcmName}
                       </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="giName">품목명</label>
                <input type="text" id="giName" name="giName" value="${item.giName}" required>
            </div>
        </div>

        <div class="remark-area">
            <label for="giRemark">REMARK</label>
            <textarea id="giRemark" name="giRemark" placeholder="Memo">${item.giRemark}</textarea>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-save">수 정</button>
            <button type="button" class="btn-cancel modal-close-btn">취 소</button>
        </div>
    </form>
</div>