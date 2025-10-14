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
	    cursor: default;
	    overflow: hidden; 
	    position: relative;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }
    .image-preview img {
        width: 100%;
        height: 100%;
        object-fit: cover;
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
    /* 읽기 전용 필드 스타일 */
    .readonly-field {
        width: 100%;
        padding: 8px 16px;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        font-size: 16px;
        background-color: #f3f4f6;
        min-height: 40px;
        display: flex;
        align-items: center;
        box-sizing: border-box;
        color: #374151;
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
    .readonly-textarea {
        width: 100%;
        min-height: 120px;
        padding: 10px 16px;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        font-size: 16px;
        background-color: #f3f4f6;
        box-sizing: border-box;
        color: #374151;
        white-space: pre-wrap;
        overflow-y: auto;
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
    .btn-cancel { background-color: #DC3545; }
</style>

<div class="form-container">
    <div class="form-header">
        <div class="state-circle" style="background-color: #f97316;"></div>
        <h2>상세 정보</h2>
    </div>

    <div class="image-area">
        <div class="image-preview">
            <c:choose>
                <c:when test="${not empty item.giImg}">
                    <img src="/items/image/${item.giImg}" alt="품목 이미지">
                </c:when>
                <c:otherwise>
                    <span id="initialTextSpan">이미지 없음</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <div class="input-grid">
        <div class="form-group">
            <label>품목 코드</label>
            <div class="readonly-field">${item.giCode}</div>
        </div>
        <div class="form-group">
            <label>거래처</label>
            <div class="readonly-field">${item.gcmName}</div>
        </div>
        <div class="form-group">
            <label>품목명</label>
            <div class="readonly-field">${item.giName}</div>
        </div>
    </div>

    <div class="remark-area">
        <label>REMARK</label>
        <div class="readonly-textarea">${item.giRemark}</div>
    </div>

    <div class="form-actions">
        <button type="button" class="btn-cancel modal-close-btn">닫 기</button>
    </div>
</div>