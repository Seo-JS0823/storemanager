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