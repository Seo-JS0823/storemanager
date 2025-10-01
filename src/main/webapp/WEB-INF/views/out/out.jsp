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
			width:40rem;
			right:-40rem;
			top:0;
			transition: 0.5s;
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
            justify-content: flex-start;
            align-items: flex-start;
            background-color: #f2f2f2;
        }
        .side-bar > div:nth-child(1){ height: 10%;}
        .side-bar > div:nth-child(2){ height: 50%;}
        .container-head{
            width: 40rem;
            height: 20%;
            margin: 3rem 0;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
        }
        .container-head > div:nth-child(1){
           width: 10rem;
           height: 5rem;
           margin: 0 6rem;
           padding: 0 1rem;
           font-size: 2rem;
           font-weight: 550;
           /*background-color: yellow;*/
        }
        .container-head > div:nth-child(2){
            width: 100%;
            height: 2rem;
            border-bottom: 0.2rem solid #666;
        }
        .container-item{
            width: 40rem;
            height: 100%;
            margin: 0 1rem;
            font-size: 1.3rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: flex-start;
        }
        .container-item > div:nth-child(1){
            width: 15rem;
            height: 15rem;
            border-radius: 0.4rem;
            background-color:white;
        }
        .container-item > div:nth-child(2){
            width: calc(100% - 2rem);
            height: 4rem;
            gap: 0.3rem;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            background-color: white;
        }
        .container-item > div:nth-child(3){
            width: calc(100% - 2rem);
            height: 4rem;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            background-color: white;
        }
        .container-item > div:nth-child(4){
            width: calc(100% - 2rem);
            height: 4rem;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            background-color: white;
        }
        .container-item > div:nth-child(5){
            width: 20rem;
            height: 10rem;
            background-color:white;
        }
        .container-item > div:nth-child(6){
            width: calc(100% - 2rem);
            height: 3rem;
            gap: 1rem;
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            align-items: center;
            background-color:white;
        }
        .container-item input{
            width: 13rem;
        }
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
            <div class="container-head">
                <div>출고관리</div>
                <div></div>
            </div>
        </div>
        <div>
            <div class="container-item">
                <div></div>
                <div>
                    <div>출고번호</div>
                    <div><input type="text" name="gih_idx"></div>
                    <div>품목명</div>
                    <div><input type="text" name="gi_name"></div>
                </div>
                <div>
                    <div>거래처코드</div>
                    <div><input type="text" name="gi_code"></div>
                    <div>거래처명</div>
                    <div><input type="text" name="gcm_name"></div>
                </div>
                <div>
                    <div>출고단가</div>
                    <div><input type="text" name="gih_price"></div>
                    <div>수량</div>
                    <div><input type="text" name="gih_qty"></div>
                </div>
                <div><textarea name="gih_remark" rows="5" cols="40" maxlength="130"></textarea></div>
                <div>
                    <div><button>저장</button></div>
                    <div><button>취소</button></div>
                </div>
            </div>
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
                        <!--<div class="m-state green"></div><span>출고수정</span>-->
                        <div class="m-state red"></div><span>출고수정</span>
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
            <div class="m-items">
               <c:forEach var="out" items="${ outList }">
               <c:set var="num1" value="${out.qty}"/>
               <c:set var="num2" value="${out.qih_price}"/>
		       <div>
                    <div>1(순번)</div>
                    <div>${ out.gi_name }</div>
                    <div>${ out.gcm_name }</div>
                    <div>${ out.gih_price }원</div>
                    <div>${ out.gih_qty }EA</div>
                    <div>원</div>
                    <div>${out.gih_regdate}</div>
                    <div class="btns-box"> <!-- Ball -->
                        <input id="idx" name="gih_idx" type="hidden" value="${ out.gih_idx }">
                        <div class="items-btn orange"></div>
                        <!--  <div class="items-btn green"></div> -->
                        <div class="items-btn red"></div>
                    </div>
                </div>
                </c:forEach>
                <div></div>
            </div>
        </div>
    </div>
   </div>
<script>
let btnOut = document.getElementById('btnOut');                         // 출고버튼
let bgEl = document.getElementsByClassName('back-ground')[0];           // side-bar 나올때 백그라운드
let modalEl = document.getElementsByClassName("md-bg")[0];              // 팝업 modal
let btnEl1 = document.getElementsByClassName('items-btn orange')[0];    // 버튼-상세보기
let btnEl2 = document.getElementsByClassName('items-btn red')[0];       // 버튼-출고수정

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
btnEl1.onclick = e => {
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

//버튼-출고수정 누를시 처리
btnEl2.onclick = e => {
    // 모달창을 띄운다
    showSidebar(true);
    
    // 수정 데이터를 입력하고 데이터를 넘긴다(출고단가, 수량, 비고만 수정가능)
    let idx = document.querySelector('#idx').value;
    let gcm_name = document.getElementsByName('gcm_name')[0].value;
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
            gih_idx : idx,
            gcm_name : gcm_name,
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
}
</script>
</body>
</html>