<<<<<<< HEAD
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
>>>>>>> edd0af4572442d2de9b4ca0b709f7328a36b019f

<%-- 데이터를 전송할 수 있도록 form 태그로 전체를 감싸고 ID를 부여합니다. --%>
<form id="item-register-form">
	<div>
		<div id="state"></div>
		<div id="state-text">품목 등록</div>
	</div>

<<<<<<< HEAD
    .form-header {
        display: flex;
        align-items: center;
        padding-bottom: 1rem;
        margin-bottom: 1rem;
        /*border-bottom: 0.2rem solid #666;*/
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
        position: relative;
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
	    position: relative;
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
        padding: 0.5rem 1rem;
        background-color: #007bff;
        color: white;
        border-radius: 0.5rem;
        cursor: pointer;
        margin-top: 0.5rem;
        border: none;
        font-size: 1rem;
    }
    
    #deleteImageBtn {
        position: absolute;
        top: 0.5rem;
        right: 0.5rem;
        background-color: rgba(220, 53, 69, 0.8);
        color: white;
        border: none;
        border-radius: 50%; 
        width: 2rem;
        height: 2rem;
        font-size: 1rem;
        font-weight: bold;
        display: flex; 
        align-items: center;
        justify-content: center;
        cursor: pointer;
        z-index: 10; 
        padding: 0; 
        line-height: 1;
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
=======
	<div>
		<div>
			<img class="modal-image" src="/images/image003.jpg">
		</div>
	</div>

	<div>
		<div>
			<p>품목코드</p>
			<input type="text" id="giCode">
		</div>
		<div>
			<p>품목명</p>
			<input type="text" id="giName">
		</div>
		<div>
			<p>매입처코드</p>
			<input type="text" id="gcmCode">
		</div>
		<div>
			<p>매입처명</p>
			<input type="text" id="gcmName">
		</div>
		<div>
			<p>매입단가</p>
			<input type="text" id="gihPrice" name="gihPrice">
		</div>
		<div>
			<p>수량</p>
			<input type="text" id="gihQry" name="gihQry">
		</div>
	</div>
>>>>>>> edd0af4572442d2de9b4ca0b709f7328a36b019f

	<div>
		<div>REMARK</div>
		<textarea name="memo" id="memo" placeholder="Memo"></textarea>
	</div>

<<<<<<< HEAD
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
			<div class="image-preview" id="imagePreview">
				<img id="previewImageElement" src="" alt="Image preview" style="display: none;"> 
				<span id="initialTextSpan">이미지 추가</span>
                <button type="button" id="deleteImageBtn" style="display: none;">X</button> 
			</div> 
            <label for="itemImageFile" class="btn-change-image">이미지 변경</label>
			<input type="file" id="itemImageFile" name="file" accept="image/*"">
		</div>
		
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
			<label for="giRemark">REMARK</label>
			<textarea id="giRemark" name="giRemark" placeholder="Memo"></textarea>
		</div>

		<div class="form-actions">
			<button type="submit" class="btn-save">저 장</button>
			<button type="button" class="btn-cancel modal-close-btn">취 소</button>
		</div>
	</form>
</div>
=======
	<div>
		<button type="button" id="modal-items-search">아이템 목록</button>
		<button type="button" id="modal-save">저 장</button>
		<button type="button" id="modal-clear">취 소</button>
	</div>
</form>
>>>>>>> edd0af4572442d2de9b4ca0b709f7328a36b019f
