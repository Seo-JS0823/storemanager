<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        <div class="state-circle"></div>
        <h2>품목 등록</h2>
    </div>

		<form id="item-register-form" action="/items/register" method="post" enctype="multipart/form-data">
		    <div class="image-area">
		        <label for="itemImageFile" class="image-preview" id="imagePreview">
		            <img id="previewImageElement" src="" alt="Image preview" style="display: none;"> 
		            <span id="initialTextSpan">이미지 추가</span>
		        </label> 
		        <input type="file" id="itemImageFile" name="file" accept="image/*">
		        
		        <button type="button" id="deleteImageBtn" style="display: none;" onclick="deleteImage();">X</button>
		    </div>
		</form>
		
		<div class="input-grid">
            <div class="form-group">
                <label for="gcmCode">거래처 선택</label>
                <select id="gcmCode" name="gcmCode" required></select>
            </div>
            <div class="form-group">
                <label for="giName">품목명</label>
                <input type="text" id="giName" name="giName" required>
            </div>
        </div>

        <div class="remark-area">
            <label for="remark">REMARK</label>
            <textarea id="remark" name="remark" placeholder="Memo"></textarea>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-save">저 장</button>
            <button type="button" class="btn-cancel modal-close-btn">취 소</button>
        </div>
    </form>
</div>