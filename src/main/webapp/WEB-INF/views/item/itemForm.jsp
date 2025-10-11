<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="right-modal-wrap">
    <div class="modal-header">
        <div>
            <span class="material-symbols-outlined">apps</span>
            <span>품목 등록</span>
        </div>
        <span class="material-symbols-outlined" id="modal-clear">close</span>
    </div>
    <div class="modal-content">
        <form id="item-register-form" action="/api/items" method="post">
            <div class="modal-item">
                <label for="giCode">품목 코드</label>
                <input type="text" id="giCode" name="giCode" placeholder="품목 코드를 입력하세요" required>
            </div>
            <div class="modal-item">
                <label for="giName">품목명</label>
                <input type="text" id="giName" name="giName" placeholder="품목명을 입력하세요" required>
            </div>
            <div class="modal-item">
                <label for="gcmCode">거래처 선택</label>
                <select id="gcmCode" name="gcmCode" required>
                    <option value="" disabled selected>거래처를 선택하세요</option>
                    </select>
            </div>
            <div class="modal-btn-box">
                <button type="submit" class="btn green">저장</button>
                <button type="button" class="btn gray" id="modal-close-btn">취소</button>
            </div>
        </form>
    </div>
</div> 
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 데이터를 전송할 수 있도록 form 태그로 전체를 감싸고 ID를 부여합니다. --%>
<form id="item-register-form">
	<div>
		<div id="state"></div>
		<div id="state-text">품목 등록</div>
	</div>

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

	<div>
		<div>REMARK</div>
		<textarea name="memo" id="memo" placeholder="Memo"></textarea>
	</div>

	<div>
		<button type="button" id="modal-items-search">아이템 목록</button>
		<button type="button" id="modal-save">저 장</button>
		<button type="button" id="modal-clear">취 소</button>
	</div>
</form>
>>>>>>> fe880323677131d19633a252e168557fc548128b
