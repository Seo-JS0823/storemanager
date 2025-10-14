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
	    /*===== 사이드바 =====*/
	    .side-bar{
            position:fixed;
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
		.side-bar > div:nth-child(5) button:nth-of-type(1) { background-color: orange; width: 12rem;}
		.side-bar > div:nth-child(5) button:nth-of-type(2) { background-color: #00AA00; }
		.side-bar > div:nth-child(5) button:nth-of-type(3) { background-color: #DC3545; }
		/* ===== 검색창 ===== */
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
            width:70rem;
            height:50rem;
            background-color: white;
            box-shadow:0.3rem 0.3rem 0.5rem 0.5rem #88888888;
            border-radius: 1rem;
            padding: 1rem;
            box-sizing: content-box;
        }
        .md-bg > div > div:nth-child(1){
            font-size: 2rem;
            font-weight: 600;
            display:flex;
            justify-content: flex-start;
            align-items: center;
            border-bottom: 0.2rem solid #666;
            height: 5rem;
            padding: 0 1rem;
        }
        .md-bg > div > div:nth-child(2){height: calc(100% - 11rem);position:relative;padding: 2rem 0;}
        .md-bg > div > div:nth-child(2) > div{
            display:flex;
            align-items: center;
            height: 6rem;
            padding: 0 2rem;
        }
        .md-bg > div > div:nth-child(2) > div > span:nth-child(1){
            font-size: 2rem;
            width: 10rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2rem 0 0;
        }
        .md-bg > div > div:nth-child(2) > div > input{
            outline: none;
            font-size: 2rem;
            padding: 0.5rem 0.8rem;
            border-radius: 0.8rem;
            border: 0.1rem solid #a5a5a5;
        }
        .md-bg > div > div:nth-child(2) > div:nth-child(1) > span:nth-child(3),
        .md-bg > div > div:nth-child(2) > div:nth-child(2) > span:nth-child(3){
            text-align: center;
            width: 6rem;
            background-color: #e7e7e7;
            height: 3rem;
            margin: 0 2rem;
            border-radius: 0.5rem;
            font-size: 1.8rem;;
        }
        .md-bg > div > div:nth-child(2) > div:nth-child(3) > input,
        .md-bg > div > div:nth-child(2) > div:nth-child(4) > input{text-align: right;}
        .md-bg > div > div:nth-child(2) > div > .add-value{
            background-color: #41db41;
            color: white;
            font-weight: bold;
            font-size: 1.5rem;
            margin-left: 1rem;
            padding: 0 1rem;
            border-radius: 1rem;
            cursor: pointer;
            transition: 0.3s;
            user-select: none;
        }
        .md-bg > div > div:nth-child(2) > div > .add-value:hover{background-color: #00BB00;}
        .md-bg > div > div:nth-child(3){
            height: 6rem;
            display:flex;
            justify-content: flex-end;
            padding: 0 2rem;
            align-items: center;
        }
        .md-bg > div > div:nth-child(2) .auto-complete{
            position: absolute;            
            max-height: 30rem;
            overflow-y: auto;
            overflow-x: hidden;
            background-color: white;
            border: 0.1rem solid #a5a5a5;
            box-shadow: 0.3rem 0.3rem 0.5rem #88888888;
            z-index: 10;
            display:none;
            border-radius: 0.8rem;
            padding:0 1rem;
        }
        .md-bg > div > div:nth-child(2) .auto-complete > div{
            padding: 0.5rem;
            cursor: pointer;
            font-size: 1.5rem;
        }
        .md-bg > div > div:nth-child(2) .auto-complete > div:hover{
            background-color: #f0f0f0;
        }
        .md-bg > div > div:nth-child(2) .auto-complete > div > span:nth-child(1){
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 3rem;
            height: 2rem;
        }
        .md-bg > div > div:nth-child(2) .auto-complete > div > span:nth-child(2){
            display: inline-flex;
            align-items: center;
            justify-content: flex-start;
            width: calc(100% - 4rem);
            height: 2rem;
        }
        .md-bg > div > div:nth-child(2) > textarea{
            margin: 1rem 2rem 1rem 12rem;
            width: 55rem;
            height: 10rem;
            border-radius: 0.8rem;
            border: 0.1rem solid #a5a5a5;
            padding: 0.5rem;
            font-size: 1.8rem;
        }

        .md-bg > div > div:nth-child(3) > span{
            font-size: 2rem;
            cursor: pointer;
            margin: 0 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0 1rem;
            height: 5rem;
            width: 10rem;
            border-radius: 0.8rem;
            transition: 0.5s;;
        }
        .md-bg > div > div:nth-child(3) > span:hover{box-shadow: 0.5rem 0.5rem 0.7rem #bdbdbd;}
        .md-bg > div > div:nth-child(3) > span:nth-child(1){
            color: white;
            background-color: #8a8ae7;
        }
        .md-bg > div > div:nth-child(3) > span:nth-child(2){
            color: #5f5fd1;
            border: 0.2rem solid #5f5fd1;
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
    <div class="md-bg"><div></div></div>
    <!-- end of modal  -->
    <%@ include file="../layout/left-menu.jsp"%>
    <div class="right-wrap">
        <%@ include file="../layout/header.jsp"%>
        <!-- 개인 작업 영역 -->
        <div>
            <!-- 상단 텍스트, 상태 동그라미 -->
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
                            <input type="date" name="startdate" id="startdate">
                            <p>&nbsp;&nbsp;~&nbsp;&nbsp;</p>
                            <input type="date" name="enddate" id="enddate">
                        </div>
                        <div class="m-search-option">
                            <div><input type="radio" id="searchEvent1" name="searchoption" checked><p>상품명</p></div>
                            <div><input type="radio" id="searchEvent2" name="searchoption"><p>거래처명</p></div>
                            <div><input type="radio" id="searchEvent3" name="searchoption"><p>출고단가</p></div>
                        </div>
                        <div class="m-search-text"> <!-- TEXT 검색 구간 -->
                            <input type="text" name="search" placeholder="검색어를 입력하세요."><div id="btnSearch">검색</div>
                        </div>
                    </div>
               </div>
            </div>
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
            <div class="m-items" id="m-items-chul"></div>
            <!--  페이징 처리 -->
            <div class="paging" id="paging"></div>
        </div>
    </div>
</div>
<script>
let btnOut = document.getElementById('btnOut');                             // 출고버튼
let bgEl = document.getElementsByClassName('back-ground')[0];               // side-bar 나올때 백그라운드
let modalEl = document.getElementsByClassName("md-bg")[0];                  // 팝업 modal
let btnUpdate = document.getElementById('btnUpdate');                       // 버튼-수정(내역보기)
let btnCancel = document.getElementById('btnCancle');                       // 버튼-수정(내역보기)
let btnItems = document.getElementsByClassName('items-btn orange');         // 버튼-상세보기
let autoComplete = {container:null,target:null,keyUpHandler:null};          // 자동완성 기능에서 사용할 데이터를 담아둘 객체
let btnSearch = document.getElementById('btnSearch');                       // 검색버튼

// 검색
btnSearch.onclick = e => {
	searchRender(1);
}

function searchRender(page) {
	let x, data = {}, el = {};
	
	el.sdate = document.getElementById("startdate");
	el.edate = document.getElementById('enddate');
	el.keyword  = document.getElementsByClassName('m-search-text')[0].children[0]
	el.check = document.getElementsByClassName('m-search-option')[0]
	
	data.sdate = document.getElementById("startdate").value;
	data.edate = document.getElementById('enddate').value;
	
	if(el.check.children[0].children[0].checked) { // 라디오버튼 - 상품명 체크
		data.check = 0
		data.keyword  = document.getElementsByClassName('m-search-text')[0].children[0].value.replaceAll(" ","");
	} else if(el.check.children[1].children[0].checked) { // 라디오버튼 - 거래처명 체크
		data.check = 1
		data.keyword  = document.getElementsByClassName('m-search-text')[0].children[0].value.replaceAll(" ","");
	} else if(el.check.children[2].children[0].checked) { // 라디오버튼 - 출고단가 체크
		data.check = 2
		data.keyword = document.getElementsByClassName('m-search-text')[0].children[0].value.replaceAll(" ","")*1
	}
	
	
	fetch('/out/list?nowPage=' + page, {
        method:"POST",
        headers:{
	        "Content-Type":"application/json",
			"Access-Control-Origin": "*"
		},
        body:JSON.stringify(data)
    })
	.catch( error => console.dir(error))
	.then( response => response.json())
	.then( data => {
		let parent = document.getElementById('m-items-chul');
		parent.innerHTML = '';
		data.list.forEach(json => {
			const frag = document.createElement('div');
			const idx = document.createElement('div');
			idx.textContent = json.gcm_code;
			
			const giName = document.createElement('div');
			giName.textContent = json.gi_name;
			
			const gcmName = document.createElement('div');
			gcmName.textContent = json.gcm_name;
			
			const price = document.createElement('div');
			price.textContent = json.gih_price + ' 원';
			
			const qty = document.createElement('div');
			qty.textContent = json.gih_qty + ' EA';
			
			const total = document.createElement('div');
			total.textContent = json.total + ' 원'
			
			const regDate = document.createElement('div');
			regDate.textContent = json.gih_regdate;
			
			const btnsbox = document.createElement('div');
			btnsbox.classList.add('btns-box');
			
			const input = document.createElement('input');
			input.id = 'idx';
			input.name = 'gih_idx';
			input.type = 'hidden';
			input.value = json.gih_idx;
			
			const btn1 = document.createElement('div');
			btn1.classList.add('items-btn');
			btn1.classList.add('orange');
			btn1.onclick = (e) => {
				const idx = json.gih_idx;
				fetch('/out/list/'+idx)
			    .catch(error => console.dir(error))
			    .then(response => response.json())
			    .then(data => {
			    	console.log(data)
			        // 데이터를 가져오고 모달창의 항목에 값을 넣어준다.
			        //console.log(data);
			        document.getElementsByName('gih_idx')[0].value = data.gih_idx;
			        document.getElementsByName('gi_name')[0].value = data.gi_name;
			        document.getElementsByName('gi_code')[0].value = data.gi_code;
			        document.getElementsByName('gcm_name')[0].value = data.gcm_name;
			        document.getElementsByName('gih_price')[0].value = data.gih_price;
			        document.getElementsByName('gih_qty')[0].value = data.gih_qty;
			        document.getElementsByName('gih_remark')[0].value = data.gih_remark;
				    showSidebar(true);// 모달창을 띄운다
			    });
			}
			// 함수 할당
			
			// 함수 할당
			
			btnsbox.appendChild(input);
			btnsbox.appendChild(btn1);
			
			frag.appendChild(idx);
			frag.appendChild(giName);
			frag.appendChild(gcmName);
			frag.appendChild(price);
			frag.appendChild(qty);
			frag.appendChild(total);
			frag.appendChild(regDate);
			frag.appendChild(btnsbox);
			
			parent.appendChild(frag);
			
		});
		const totalPage = data.pg.totalPage;
		paging.renderer({
			start   : 'start-search',
			middle  : 'middle-search',
			end     : 'end-search'
		},
		'paging',
		totalPage,
		5);
	});
}

// 자동완성 :: 초기화
autoComplete.clear = () => {
    autoComplete.container.style.display = "none";
    autoComplete.container.innerHTML = "";
    autoComplete.target = null;
    autoComplete.keyUpHandler = null;    
}

// 자동완성 :: 거래처 검색 함수
autoComplete.findCustomer = e => {
    let input = e.target, target = input.nextElementSibling, url = "/out/autoComplete/customer/"+input.value;

    if(input.value === "") return;
    
    if(autoComplete.keyUpHandler !== null) clearTimeout(autoComplete.keyUpHandler);
    autoComplete.keyUpHandler = setTimeout( () => {
        console.log(input.value);
        fetch(url)
        .catch( error => console.dir(error))
        .then( response => response.json())
        .then( data => {
            let x, el1, el2, position = {};
            if(data.length === 0) {autoComplete.clear();return;}

            position.x = e.target.offsetLeft;
            position.y = e.target.offsetTop + e.target.offsetHeight + 5;
            position.width = e.target.offsetWidth;
            autoComplete.container.style.display = "block";
            autoComplete.container.style.left = position.x + "px";
            autoComplete.container.style.top = position.y + "px";
            autoComplete.container.style.width = position.width + "px";

            while(autoComplete.container.children.length > 0) autoComplete.container.children[0].remove();

            for(x = 0 ; x < data.length ; x++){
                el1 = document.createElement("div");
                el1.dataset.data = JSON.stringify(data[x]);
                autoComplete.container.appendChild(el1);
                el2 = document.createElement("span");
                el2.innerText = data[x].idx;
                el1.appendChild(el2);
                el2 = document.createElement("span");
                el2.innerText = data[x].name;
                el1.appendChild(el2);
                el1.onclick = event => {
                    let data, el = event.target;
                    if(el.tagName !== "DIV") el = el.parentElement;
                    data = JSON.parse(el.dataset.data);
                    input.value = data.name;
                    target.innerText = data.idx;
                    autoComplete.clear();
                }
            }
            
        })
    }, 500);
} // End of autoComplete.findCustomer()

// 자동완성 :: 아이템 검색 함수
autoComplete.findItem = e => {
    let input = e.target, target = input.nextElementSibling, customer, url = "/out/autoComplete/item/";

    // 거래처가 선택되지 않은 상태에서 아이템 검색을 시도할 경우 함수 종료
    customer = document.getElementsByClassName("md-bg")[0].children[0].children[1].children[0].children[2].innerText;

    if(input.value === "" || customer === "") return;

    url += customer + "/" + input.value;
    
    if(autoComplete.keyUpHandler !== null) clearTimeout(autoComplete.keyUpHandler);
    autoComplete.keyUpHandler = setTimeout( () => {
        console.log(input.value);
        fetch(url)
        .catch( error => console.dir(error))
        .then( response => response.json())
        .then( data => {
            let x, el1, el2, position = {};
            if(data.length === 0) {autoComplete.clear();return;}

            position.x = e.target.offsetLeft;
            position.y = e.target.offsetTop + e.target.offsetHeight + 5;
            position.width = e.target.offsetWidth;
            autoComplete.container.style.display = "block";
            autoComplete.container.style.left = position.x + "px";
            autoComplete.container.style.top = position.y + "px";
            autoComplete.container.style.width = position.width + "px";

            while(autoComplete.container.children.length > 0) autoComplete.container.children[0].remove();

            for(x = 0 ; x < data.length ; x++){
                el1 = document.createElement("div");
                el1.dataset.data = JSON.stringify(data[x]);
                autoComplete.container.appendChild(el1);
                el2 = document.createElement("span");
                el2.innerText = data[x].idx;
                el1.appendChild(el2);
                el2 = document.createElement("span");
                el2.innerText = data[x].name;
                el1.appendChild(el2);
                el1.onclick = event => {
                    let data, el = event.target;
                    if(el.tagName !== "DIV") el = el.parentElement;
                    data = JSON.parse(el.dataset.data);
                    input.value = data.name;
                    target.innerText = data.idx;
                    autoComplete.clear();
                }
            }
            
        })
    }, 500);
} // End of autoComplete.findItem()



/*let btnItems;

for(let i=0; i < 10; i++){
	btnItems = document.getElementsByClassName('items-btn orange')[i]); // 버튼-상세보기 배열로 해야되는데 못함
}*/

bgEl.onclick = e => showSidebar(false);
btnOut.onclick = e => addOutItem();
modalEl.onclick = e => showModal(false);
modalEl.children[0].onclick = e => e.stopPropagation();

// 출고버튼 클릭시
let addOutItem = () => {
    let x, str, html, el1, el2, f = {}, el = {btn:{},input:{}}, container = document.getElementsByClassName("md-bg")[0].children[0];

    // 수량, 단가 +버튼 클릭 이벤트 리스너
    f.addValue = e => {
        let x, value, input = e.target.parentElement.children[1];
        value = e.target.innerText.replaceAll(",","").replace("+","")*1;
        if(value === 0) x = 0;
        else x = input.value.replaceAll(",","")*1 + value;
        input.value = x.toLocaleString();
    } // End of f.addValue()

    // 저장 버튼 클릭 이벤트 리스너
    f.save = e => {
        let data = {};
        data.customer = el.input.customer.nextElementSibling.innerText*1;
        data.item = el.input.item.nextElementSibling.innerText*1;
        data.qty = el.input.qty.value.replaceAll(",","")*1;
        data.unitPrice = el.input.unitPrice.value.replaceAll(",","")*1;
        data.remark = el.input.remark.value.replaceAll("\r","").replaceAll("\n","<br>");
        console.log(data);
        if(data.customer === "" || data.item === "" || data.qty === "" || data.qty === 0 || data.unitPrice === "" || data.unitPrice === 0){alert("거래처, 아이템, 수량, 출고단가는 필수 입력 항목입니다.");return;}
        fetch("/out/add", {
            method:"POST",
            headers:{"Content-Type":"application/json"},
            body:JSON.stringify(data)
        }).catch( error => console.dir(error))
        .then( response => response.json())
        .then( data => {
            if(data.result == "ok"){
                alert("출고등록이 완료되었습니다.");
                location.reload();
            } else  alert("출고등록에 실패하였습니다.");
        })
    } // End of f.save()

    el.header = document.createElement("div");
    el.content = document.createElement("div");
    el.bottom = document.createElement("div");
    el.btn.save = document.createElement("span");
    el.btn.close = document.createElement("span");
    container.appendChild(el.header);
    container.appendChild(el.content);
    container.appendChild(el.bottom);
    el.bottom.appendChild(el.btn.save);
    el.bottom.appendChild(el.btn.close);

    el.header.innerText = "출고등록";
    el.btn.save.innerText = "저 장";
    el.btn.close.innerText = "취 소";

    // 거레처
    str = "거래처";
    html = "";
    for(x = 0 ; x < str.length; x++) html += "<t>"+str[x]+"</t>";
    el1 = document.createElement("div");
    el.content.appendChild(el1);
    el2 = document.createElement("span");
    el2.innerHTML = html;
    el1.appendChild(el2);
    el2 = document.createElement("input");
    el.input.customer = el2;
    el1.appendChild(el2);
    el2 = document.createElement("span");
    el1.appendChild(el2);

    // 아이템
    str = "아이템";
    html = "";
    for(x = 0 ; x < str.length; x++) html += "<t>"+str[x]+"</t>";
    el1 = document.createElement("div");
    el.content.appendChild(el1);
    el2 = document.createElement("span");
    el2.innerHTML = html;
    el1.appendChild(el2);
    el2 = document.createElement("input");
    el.input.item = el2;
    el1.appendChild(el2);
    el2 = document.createElement("span");
    el1.appendChild(el2);

    // 수량
    str = "수량";
    html = "";
    for(x = 0 ; x < str.length; x++) html += "<t>"+str[x]+"</t>";
    el1 = document.createElement("div");
    el.content.appendChild(el1);
    el2 = document.createElement("span");
    el2.innerHTML = html;
    el1.appendChild(el2);
    el2 = document.createElement("input");
    el2.value = "0";
    el1.appendChild(el2);
    el.input.qty = el2;
    el2 = document.createElement("span");
    el2.className = "add-value";
    el2.onclick = f.addValue;
    el2.innerText = "0";
    el1.appendChild(el2);
    el2 = document.createElement("span");
    el2.className = "add-value";
    el2.onclick = f.addValue;
    el2.innerText = "+ 10";
    el1.appendChild(el2);
    el2 = document.createElement("span");
    el2.className = "add-value";
    el2.onclick = f.addValue;
    el2.innerText = "+ 100";
    el1.appendChild(el2);
    el2 = document.createElement("span");
    el2.className = "add-value";
    el2.onclick = f.addValue;
    el2.innerText = "+ 1,000";
    el1.appendChild(el2);

    // 출고단가
    str = "출고단가";
    html = "";
    for(x = 0 ; x < str.length; x++) html += "<t>"+str[x]+"</t>";
    el1 = document.createElement("div");
    el.content.appendChild(el1);
    el2 = document.createElement("span");
    el2.innerHTML = html;
    el1.appendChild(el2);
    el2 = document.createElement("input");
    el2.value = "0";
    el1.appendChild(el2);
    el.input.unitPrice = el2;
    el2 = document.createElement("span");
    el2.className = "add-value";
    el2.onclick = f.addValue;
    el2.innerText = "0";
    el1.appendChild(el2);
    el2 = document.createElement("span");
    el2.className = "add-value";
    el2.onclick = f.addValue;
    el2.innerText = "+ 100";
    el1.appendChild(el2);
    el2 = document.createElement("span");
    el2.className = "add-value";
    el2.onclick = f.addValue;
    el2.innerText = "+ 1,000";
    el1.appendChild(el2);
    el2 = document.createElement("span");
    el2.className = "add-value";
    el2.onclick = f.addValue;
    el2.innerText = "+ 10,000";
    el1.appendChild(el2);
    
    // 비고
    el1 = document.createElement("textarea");
    el.content.appendChild(el1);
    el.input.remark = el1;

    el.input.customer.onkeyup = autoComplete.findCustomer;
    el.input.item.onkeyup = autoComplete.findItem
    el.btn.close.onclick = e => showModal(false);
    el.btn.save.onclick = f.save;

    // 자동완성 도우미 컨테이너 생성
    autoComplete.container = document.createElement("div");
    el.content.appendChild(autoComplete.container);
    autoComplete.container.className = "auto-complete";
    

    showModal(true);
} // End of addOutItem()

let showSidebar = x => {
    let el = document.getElementsByClassName("side-bar")[0];
    let bg = document.getElementsByClassName("back-ground")[0];    
    if(x) el.style = "right:0;display:block;";
    else el.style = "";
}

let showModal = x => {
    let el = document.getElementsByClassName("md-bg")[0];
    
    if(x) el.style.display = "flex";
    else {
        el.style.display = "";
        el.children[0].innerHTML = "";
        autoComplet.container = null;
        autoComplet.target = null;
    }
}

// 버튼-상세보기 누를 시
for(let x in btnItems) btnItems[x].onclick = e => {
	const idx = e.target.previousElementSibling.value;
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
	    showSidebar(true);// 모달창을 띄운다
    });

}

//버튼-수정 누를시
btnUpdate.onclick = e => {
    let idx, data = {}, el = {}, container = document.getElementsByClassName("side-bar")[0];
    
    el.idx = container.children[2].children[0].children[1];
    el.gih_price = container.children[2].children[4].children[1];
    el.gih_qty = container.children[2].children[5].children[1];
    el.gih_remark = container.children[3].children[0].children[0];

    console.log(el);

    // 수정 데이터를 입력하고 데이터를 넘긴다(출고단가, 수량, 비고만 수정가능)
    data.gih_idx = el.idx.value*1;
    data.gih_price = el.gih_price.value*1;
    data.gih_qty = el.gih_qty.value*1;
    data.gih_remark = el.gih_remark.value;

    console.log(data);
    
    params = {
        method: "POST",
        headers: {
            "Content-Type" : "application/json",                                                                                               
            "Access-Control-Origin": "*"     // CORS 정책을 피한다
        },
        body:JSON.stringify(data),
    }
    fetch("/out/list/"+data.gih_idx, params)
        .catch( error => console.dir(error))
        .then(response => response.json())
        .then(data => {
            if(data.result === "ok") location.reload();
            else console.log(data)
    })
}

// 버튼-취소 클릭시
btnCancel.onclick = e => showSidebar(false);
</script>
<script>
	//검색바 달력 현재 날짜-7 ~ 현재날짜
	let dateStart = document.getElementById("startdate");
	let dateEnd = document.getElementById("enddate");
	
	let today = new Date();
	let endDateValue =today.toISOString().substring(0,10);
	let startDateValue = (new Date(today.getTime() - 86400000*7)).toISOString().substring(0,10);
	
	dateStart.value = startDateValue;
	dateEnd.value = endDateValue;
</script>
<script src="/js/render.js"></script>
<script src="/js/member.js"></script>
<script src="/js/paging.js"></script>
<script>
/*
let btnOut = document.getElementById('btnOut');                             // 출고버튼
let bgEl = document.getElementsByClassName('back-ground')[0];               // side-bar 나올때 백그라운드
let modalEl = document.getElementsByClassName("md-bg")[0];                  // 팝업 modal
let btnUpdate = document.getElementById('btnUpdate');                       // 버튼-수정(내역보기)
let btnCancel = document.getElementById('btnCancle');                       // 버튼-수정(내역보기)
let btnItems = document.getElementsByClassName('items-btn orange');         // 버튼-상세보기
let autoComplete = {container:null,target:null,keyUpHandler:null};          // 자동완성 기능에서 사용할 데이터를 담아둘 객체
let btnSearch = document.getElementById('btnSearch');                       // 검색버튼
*/

const paging = new PagingManager();

chulRender(1);

function chulRender(page) {
	paging.nowPage = page;
	
	let url = '/out/list';
	
	const parent = document.getElementsByClassName('m-items')[0];
	parent.innerHTML = '';
	
	Render.callJSON(
	url,
	{
		nowPage:paging.nowPage
	},
	'm-items-chul',
	(items) => {
		items.list.forEach(json => {
			const frag = document.createElement('div');
			const idx = document.createElement('div');
			idx.textContent = json.gcm_code;
			
			const giName = document.createElement('div');
			giName.textContent = json.gi_name;
			
			const gcmName = document.createElement('div');
			gcmName.textContent = json.gcm_name;
			
			const price = document.createElement('div');
			price.textContent = json.gih_price + ' 원';
			
			const qty = document.createElement('div');
			qty.textContent = json.gih_qty + ' EA';
			
			const total = document.createElement('div');
			total.textContent = json.total + ' 원'
			
			const regDate = document.createElement('div');
			regDate.textContent = json.gih_regdate;
			
			const btnsbox = document.createElement('div');
			btnsbox.classList.add('btns-box');
			
			const input = document.createElement('input');
			input.id = 'idx';
			input.name = 'gih-idx';
			input.type = 'hidden';
			input.value = json.gih_idx;
			
			const btn1 = document.createElement('div');
			btn1.classList.add('items-btn');
			btn1.classList.add('orange');
			btn1.onclick = (e) => {
				const idx = e.target.previousElementSibling.value;
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
				    showSidebar(true);// 모달창을 띄운다
			    });
			}
			// 함수 할당
			
			// 함수 할당
			
			btnsbox.appendChild(input);
			btnsbox.appendChild(btn1);
			
			frag.appendChild(idx);
			frag.appendChild(giName);
			frag.appendChild(gcmName);
			frag.appendChild(price);
			frag.appendChild(qty);
			frag.appendChild(total);
			frag.appendChild(regDate);
			frag.appendChild(btnsbox);
			
			parent.appendChild(frag);
			
			const totalPage = items.pg.totalPage;
			paging.renderer({
				start   : 'start',
				middle  : 'middle',
				end     : 'end'
			},
			'paging',
			totalPage,
			5);
		});
	});
}

paging.setComponent('start', (data) => {
	const div = document.createElement('div');
	div.textContent = '◀';
	
	const backPage = data.start - data.pageSize;
	
	if (data.start <= 1) {
		div.style.opacity = '0.3';
		div.style.cursor = 'default';
		return div;
	}
	
	div.addEventListener('click', () => {
		chulRender(backPage);
	});
	return div;
});
paging.setComponent('middle', (data) => {
	const div = document.createElement('div');
	div.textContent = `\${data.currentPage}`;
	
	if (data.currentPage === data.activePage) {
		div.style.fontWeight = 'bold';
		div.style.color = '#00AA00';
		div.style.fontSize = '1.5rem';
    }

    div.addEventListener('click', () => {
    	chulRender(data.currentPage);
    });
	return div;
});
paging.setComponent('end', (data) => {
	const div = document.createElement('div');
	div.textContent = '▶';
	
	const nextPage = data.end + 1;
	
	if(nextPage > data.totalPage) {
		div.style.opacity = '0.3';
		div.style.cursor = 'default';
		return div;
	}
	
	div.addEventListener('click', () => {
		chulRender(nextPage);
	});
	
	return div;
});
paging.setComponent('start-search', (data) => {
	const div = document.createElement('div');
	div.textContent = '◀';
	
	const backPage = data.start - data.pageSize;
	
	if (data.start <= 1) {
		div.style.opacity = '0.3';
		div.style.cursor = 'default';
		return div;
	}
	
	div.addEventListener('click', () => {
		searchRender(backPage);
	});
	return div;
});
paging.setComponent('middle-search', (data) => {
	const div = document.createElement('div');
	div.textContent = `\${data.currentPage}`;
	
	if (data.currentPage === data.activePage) {
		div.style.fontWeight = 'bold';
		div.style.color = '#00AA00';
		div.style.fontSize = '1.5rem';
    }

    div.addEventListener('click', () => {
    	searchRender(data.currentPage);
    });
	return div;
});
paging.setComponent('end-search', (data) => {
	const div = document.createElement('div');
	div.textContent = '▶';
	
	const nextPage = data.end + 1;
	
	if(nextPage > data.totalPage) {
		div.style.opacity = '0.3';
		div.style.cursor = 'default';
		return div;
	}
	
	div.addEventListener('click', () => {
		searchRender(nextPage);
	});
	
	return div;
});
</script>
</body>
</html>