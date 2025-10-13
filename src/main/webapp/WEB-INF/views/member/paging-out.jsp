<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&"/>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/wrap.css">
    <link rel="stylesheet" href="/css/m-header.css">
    <title></title>
	<style>
	    .side-bar{
            position:absolute;
            height:100%;
            width:48rem;
            right:-48rem;
            top:0;
            transition: 1s;
            z-index:10;
		}
        .back-ground{
            display:none;
            position:absolute;
            top:0;
            inset:0;
            z-index:5;
            background-color: #00000030;
        }
        .side-bar{  
            display: flex;
            flex-direction: column;
            background-color: #F5F5F5;
            box-shadow: 20px 0px 40px rgba(0, 0, 0, 0.5);
        }
        .side-bar > div:nth-child(1){
            height: 8.75rem;
            width: 90%;
            margin: 0 auto;
            padding-left: 2rem;
            padding-bottom: 1rem;
            display: flex;
            align-items: center;
            border-bottom: 0.2rem solid #666;
            margin-bottom: 1rem;
        }
        .side-bar> div:nth-child(1) > div:nth-child(2) {
            font-size: 2rem;
            height: 3rem;
            margin-top: auto;
            font-weight: 600;
        }
        #state {
            margin-top: auto;
            margin-right: 1rem;
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            background-color: #00AA00;
        }
        /* 상단 밑 본문 영역 */
        .side-bar > div:nth-child(2) {
            width: 90%;
            height: auto;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
        }
        /* 이미지 영역 */
        .side-bar > div:nth-child(2) > div:nth-child(1) {
            width: 15rem;
            height: 15rem;
            margin-bottom: 0.5rem;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .side-bar > div:nth-child(2) > div:nth-child(1) span {
            font-size: 10rem;
            font-weight: 50;
            text-align: center;
            color: gray;
        }
        .side-bar > div:nth-child(2) img {
            width: 100%;
            height: 100%;
        }
        /* 품목 데이터 영역 */
        .side-bar > div:nth-child(3) {
            width: 90%;
            height: 18rem;
            margin: 0 auto;
            display: grid;
            grid-template-rows: repeat(3, 1fr);
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 1px;
        }
        .side-bar > div:nth-child(3) > div {
            display: flex;
            align-items: center;
            width: 100%;
            height: 100%;
        }
        .side-bar > div:nth-child(3) > div p {
            margin: 0;
            width: 50%;
            font-size: 1.7rem;
            font-weight: 600;
            text-align: center;
        }
        .side-bar > div:nth-child(3) > div div,
        .side-bar > div:nth-child(3) > div input[type=text] {
            width: 45%;
            height: 45%;
            margin: 0 auto;
            background-color: white;
            border: 1px solid rgba(33, 33, 33, 0.3);
            border-radius: 0.5rem;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.2rem;
        }
        .side-bar > div:nth-child(3) > div input[type=text] {
            outline: none;
            padding-left: 0.5rem;
        }
        /* REMARK 영역 */
        .side-bar > div:nth-child(4) {
            width: 90%;
            height: 13rem;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            padding-left: 2.5rem;
        }
        .side-bar > div:nth-child(4) > div:nth-child(1) {
            width: 100%;
            height: auto;
            font-size: 1.5rem;
        }
        .side-bar > div:nth-child(4) > textarea {
            resize: none;
            width: 100%;
            height: 100%;
            outline: none;
            padding: 0.5rem;
        }
        /* 저장 or 수정, 취소 영역 */
        .side-bar > div:nth-child(5) {
            width: 90%;
            height: 8rem;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: end;
            gap: 2rem;
        }
        .side-bar > div:nth-child(5) button {
            width: 8rem;
            height: 4rem;
            font-size: 1.5rem;
            font-weight: 600;
            color: white;
            border: none;
            border-radius: 0.5rem;
            cursor: pointer;
        }
        .side-bar > div:nth-child(5) button:active {
            box-shadow: 0 0 5px rgba(33, 33, 33, 0.5);
        }
        .side-bar > div:nth-child(5) button:nth-of-type(1) { background-color: #00AA00; }
        .side-bar > div:nth-child(5) button:nth-of-type(2) { background-color: #DC3545; }
        .md-bg{
            position:absolute;
            top:0;
            inset:0;
            display:none;
            align-items: center;
            justify-content: center;
            background-color: #00000030;
        }
        .md-bg > div{
            width:40rem;
            height:30rem;
            background-color: white;
        }
	</style>
</head>
<body>
<div class="wrap">
    <!-- start of side-bar -->
    <div class="side-bar">
        <div>
            <div id="state"></div>
            <div>출고관리</div>
        </div>
        <div>
            <div><span class="material-symbols-outlined">hide_image</span></div>
        </div>
        <div>
            <div><p>출고번호</p><input type="text" name="gih_idx" readonly></div>
            <div><p>품목명</p><input type="text" name="gi_name" readonly></div>
            <div><p>거래처코드</p><input type="text" name="gi_code" readonly></div>
            <div><p>거래처명</p><input type="text" name="gcm_name" readonly></div>
            <div><p>출고단가</p><input type="text" name="gih_price"></div>
            <div><p>수량</p><input type="text" name="gih_qty"></div>
        </div>
        <div>
            <div><textarea name="gih_remark" rows="5" cols="40" maxlength="130"></textarea></div>
        </div>
        <div>
            <button id="btnUpdate">수정</button>
            <button id="btnCancle">취소</button>
        </div>
    </div>
    <div class="back-ground"></div>
    <!-- end of side-bar // start of modal -->
    <div class="md-bg">
        <div>
            <input type="text" placeholder="아이템 또는 거래처 검색">
            <input type="radio" id="btn item" name="item" value="1">
			<label for="btn item">품목</label>
			<input type="radio" id="btn customer" name="customer" value="2">
			<label for="btn customer">거래처</label>
        </div>
        <div>여기에 리스트가 나와야함</div>
    </div>
    <!-- end of modal  -->
    <%@ include file="../layout/left-menu.jsp"%>
    <div class="right-wrap">
        <%@ include file="../layout/header.jsp"%>
        <!-- 개인 작업 영역 -->
        <div>
            <!-- 상단 텍스트, 상태 동그라미, 입고생성버튼 -->
            <div class="m-box">
                <div class="m-header">
                    <span class="material-symbols-outlined">playlist_remove</span>
                    <span>출고관리</span>
                </div>
                <div></div>
                <div>
                    <div>
                        <div class="m-state orange"></div><span>상세보기</span>
                    </div>
                    <div class="green" id="btnOut">- 출고</div>
                </div>
            </div>
            <!-- 검색 라인 -->
            <div class="m-search">
                <div>
                    <div class="m-search-line">
                        <div class="m-search-date"> <!-- 날짜 구간 -->
                            <input type="date" name="startdate">
                            <p>&nbsp;&nbsp;~&nbsp;&nbsp;</p>
                            <input type="date" name="enddate">
                        </div>
                        <div class="m-search-option">
                            <div><input type="radio" id="searchEvent1" name="searchoption"><p>상품명</p></div>
                            <div><input type="radio" id="searchEvent2" name="searchoption"><p>거래처명</p></div>
                            <div><input type="radio" id="searchEvent3" name="searchoption"><p>출고단가</p></div>
                        </div>
                        <div class="m-search-text"> <!-- TEXT 검색 구간 -->
                            <input type="text" name="search" placeholder="검색어를 입력하세요."><div>검색</div>
                        </div>
                    </div>
               </div>
            </div>
            <!-- 정렬 구간 -->
            <div class="m-search-sort">
                <div></div>
                <div>상품명</div>
                <div>거래처명</div>
                <div>출고단가</div>
                <div>수량</div>
                <div>총합</div>
                <div>출고일</div>
                <div></div>
            </div>
            <div class="m-items" id="m-items-out">
               <!-- 
               <c:forEach var="out" items="${ outList }">
		       <div>
                    <div>1(순번)</div>
                    <div>${ out.gi_name }</div>
                    <div>${ out.gcm_name }</div>
                    <div>${ out.gih_price }원</div>
                    <div>${ out.gih_qty }EA</div>
                    <div>원</div>
                    <div>${out.gih_regdate}</div>
                    <div class="btns-box">
                        <input id="idx" name="gih_idx" type="hidden" value="${ out.gih_idx }">
                        <div class="items-btn orange"></div>
                    </div>
                </div>
                </c:forEach>
                -->
            </div>
            <!--  페이징 처리 -->
            <div class="paging" id="paging"></div>
        </div>
    </div>
</div>
<script src="/js/render.js"></script>
<script src="/js/member.js"></script>
<script src="/js/paging.js"></script>
<script>
let btnOut = document.getElementById('btnOut');                             // 출고버튼
let bgEl = document.getElementsByClassName('back-ground')[0];               // side-bar 나올때 백그라운드
let modalEl = document.getElementsByClassName("md-bg")[0];                  // 팝업 modal
let btnUpdate = document.getElementById('btnUpdate');                       // 버튼-수정(내역보기)
//let btnItems = document.getElementsByClassName('items-btn orange')[0];      // 버튼-상세보기

for(let i=0; i < 10; i++){
	btnItems = document.getElementsByClassName('items-btn orange')[i]       // 버튼-상세보기
}

bgEl.onclick = e => showSidebar(false);
btnOut.onclick = e => showModal(true);
modalEl.onclick = e => showModal(false);
modalEl.children[0].onclick = e => e.stopPropagation();

let showSidebar = x => {
    let el = document.getElementsByClassName("side-bar")[0];
    let bg = document.getElementsByClassName("back-ground")[0];
    
    if(x){
         el.style.right = "0";
         bg.style.display = "block";
        
    } else {
        el.style.right = "";
        bg.style.display = "";
    }
}

let showModal = x => {
    let el = document.getElementsByClassName("md-bg")[0];
    
    if(x){
        el.style.display = "flex";
    } else {
        el.style.display = "";
    }
}

// 버튼-상세보기 누를 시 처리
btnItems.onclick = e => {
	const idx = document.querySelector('#idx').value;
	//alert(idx);
	
	fetch('/out/list/'+idx)
    .catch(error => console.dir(error))
    .then(response => response.json())
    .then(data => {
        // 데이터를 가져오고 모달창의 항목에 값을 넣어준다.
        //console.log(data);
        document.getElementsByName('gih_idx')[0].value = data.gih_idx;
        document.getElementsByName('gi_name')[0].value = data.gi_name;
        document.getElementsByName('gi_code')[0].value = data.gi_code;
        document.getElementsByName('gcm_name')[0].value = data.gcm_name;
        document.getElementsByName('gih_price')[0].value = data.gih_price;
        document.getElementsByName('gih_qty')[0].value = data.gih_qty;
        document.getElementsByName('gih_remark')[0].value = data.gih_remark;
    })

	// 모달창을 띄운다
	showSidebar(true);
} 

//버튼-수정 누를시 처리
/* btnUpdate.onclick = e => {
    
    // 수정 데이터를 입력하고 데이터를 넘긴다(출고단가, 수량, 비고만 수정가능)
    let idx = document.querySelector('#idx').value;
    let gih_price = document.getElementsByName('gih_price')[0].value;
    let gih_qty = document.getElementsByName('gih_qty')[0].value;
    let gih_remark = document.getElementsByName('gih_remark')[0].value;
    
    params = {
        method: "post",
        method: "PATCH",
        headers: {
            "Accept"       : "application/json",
            "Content-Type" : "application/json",                                                                                               
            "Access-Control-Origin": "*"     // CORS 정책을 피한다
        },
        body:JSON.stringify({
            gih_idx : idx,
            gih_price : gih_price,
            gih_qty : gih_qty,
            gih_remark : gih_remark
        }),
    }
    fetch('/out/list/'+idx, params)
        .catch( error => console.dir(error))
        .then(response => response.json())
        .then(data => {
            // 저장된 데이터를 가져오고 처리해줘야함
            console.log(data)
        })
} */
</script>
<script>
   let dateStart = document.getElementById("startdate");
   let dateEnd = document.getElementById("enddate");
   
   let today = new Date();
   let endDateValue = today.toISOString().substring(0,10);
   let startDateValue = new Date(today.setDate(today.getDate()-7)).toISOString().substring(0,10);
   
   dateStart.value = startDateValue;
   dateEnd.value = endDateValue;
</script>
</body>
</html>