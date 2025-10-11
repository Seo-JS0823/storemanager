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
	<title>미니입출고관리</title>
<style>
	#modal-container{ 
		position : fixed;
		width : 50rem;
		height : 100%;
		top : 0;
		right : 0;
		/*왼쪽에서 나타남 left : 0;*/ 
		/*background-color : #666666;*/
		background-color : white;
		box-shadow : 0 0 10px rgba(33,33,33,0.2);
		transform : translateX(100%);
		transition : transform 0.5s ease-in-out;
		z-index : 1000;
	}
	#modal-container > div:nth-child(1) {
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
    #modal-container #state,
    #modal-container #state-text {
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
        background-color: orange;
    }
    .modal-header {
        width: 90%;
        height: auto;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
	}
	.modal-middle{
		width: 90%;
        height: 18rem;
        margin: 0 auto;
        display: grid;
        grid-template-rows: repeat(3, 1fr);
        grid-template-columns: repeat(2, 1fr);
        grid-gap: 1px;
	}
	.modal-middle div {
        display: flex;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    .modal-middle div p {
        margin: 0;
        width: 50%;
        font-size: 1.7rem;
        font-weight: 600;
        text-align: center;
    }
    .modal-middle input {
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
        outline: none;
        padding-left: 0.5rem;
    }
    .modal-bottom {
    	width: 90%;
        height: 13rem;
        margin: 0 auto;
        display: flex;
        /*flex-direction: column;*/
        padding-left: 2.5rem;
        font-size: 3.0rem;
        font-weight: 600;
        margin-top : 20px;
        justify-content:flex-end;
    }
</style>
</head>
<body>
	<!-- 모달창 영역 -->
	<div id="modal-container">
		<div>
            <div id="state"></div><div id="state-text">상세보기</div>
        </div>
		<div class="modal-header"></div><!-- header -->
		<div class="modal-middle"><!-- middle -->
			<div><p>품목코드</p>    <input type="text" id="giCode" readonly></input></div>
			<div><p>품목명</p>      <input type="text" id="giName" readonly></input></div>
			<div><p>거래처코드</p>  <input type="text" id="gcmCode" readonly></input></div>
			<div><p>거래처명</p>    <input type="text" id="gcmName" readonly></input></div>

			<div><p>거래단가</p>    <input type="text" id="gihPrice" name="gihPrice" readonly></div>
			<div><p>수량</p>        <input type="text" id="gihQty" name="gihQty" readonly></div>
		</div>
		<div class="modal-bottom"><!-- bottom -->
			총계 :&nbsp;&nbsp;
			<div id="aMount"></div>
		</div>
	</div>
	
	<!-- 모달창 영역 -->
<div class="wrap">
	<%@ include file="../layout/left-menu.jsp"%>
	<div class="right-wrap">
		<%@ include file="../layout/header.jsp"%>
		<!-- 개인 작업 영역 -->
		<div>
			<!-- 상단 텍스트, 상태 동그라미, 입고생성버튼 -->
			<div class="m-box">
				<div class="m-header">
					<span class="material-symbols-outlined">receipt_long</span>
					<span>확인서/명세서 관리</span>
				</div>
				<div></div>
				<div>
					<div>
						<div class="m-state orange"></div><span>상세보기</span>
						<!-- <div class="m-state green"></div><span>입고수정</span> -->
						<!-- <div class="m-state red"></div><span>출고생성</span> -->
					</div>
					<div class="green" id="billCreate">명세서생성</div>
				</div>
			</div>
			<!-- 검색 라인 -->
			<div class="m-search">
				<div>
					<div class="m-search-line">
						<div class="m-search-date"> <!-- 날짜 구간 -->
							<input type="date" id="startdate" value="2025-01-01">
							<p>&nbsp;&nbsp;~&nbsp;&nbsp;</p>
							<input type="date" id="enddate" value="2025-01-01">
						</div>
						<div class="m-search-option">
							<!-- <div><input type="radio" id="searchEvent3" name="searchoption"><p>전체</p></div> -->
							<div><input type="radio" id="searchEvent1" name="searchoption" checked><label for="searchEvent1"><p>상품명</p></label></div>
							<div><input type="radio" id="searchEvent2" name="searchoption"><label for="searchEvent2"><p>거래처명</p></label></div>
						</div>
						<div class="m-search-text"> <!-- TEXT 검색 구간 -->
							<input type="text" id="search" name="search" placeholder="검색어를 입력하세요."><div>검색</div>
						</div>
					</div>
				</div>
			</div>
			<div class="m-search-option" style="font-size: 1.5rem;font-weight:bold">
				<div><input type="radio" id="searchInBill" name="searchBill" value="in" checked><label for="searchInBill"><p>입고확인서</p></label></div>
				<div><input type="radio" id="searchOutBill" name="searchBill" value="out"><label for="searchOutBill"><p>출고확인서</p></label></div>
				<div><input type="radio" id="searchAllBill" name="searchBill" value="all"><label for="searchAllBill"><p>명세서</p></label></div>
			</div>
			<!-- 정렬 구간 -->
			<div class="m-search-sort">
                <div></div>
                <div>상품명</div>
                <div>거래처명</div>
                <div>거래단가</div>
                <div>수량</div>
                <div>총합</div>
                <div>거래일자</div>
                <div></div>
            </div>
			<div class="m-items" id="m-items">
			<c:forEach var="billList" items="${billList}">
				<div>
					<input type="hidden" id="gih_input" value="${ billList.gih_inout }" />
	               	<div id="gih_idx"><input type="checkbox" id="chkBillId" value="${ billList.gih_idx }" />&nbsp;&nbsp;${ billList.num }</div>
	               	<div id="gi_name">${ billList.gi_name }</div>
	               	<div id="gcm_name">${ billList.gcm_name }</div>
	             	<div id="gih_price">${ billList.gih_price }</div>
	            	<div id="gih_qty">${ billList.gih_qty } EA</div>
	           	    <div id="all_amount">총 ${ billList.amount } 원</div>
	           	    <div id="gih_regdate">${ billList.gih_regdate }</div>
	           	    <div class="btns-box"> <!-- Ball -->
	           	        <div class="items-btn orange" id="itemsDetail" name="itemsDetail" value="${ billList.gih_idx }"></div>
	           	        <!-- <div class="items-btn green"></div> -->
	           	        <!-- <div class="items-btn red"></div> -->
	           	    </div>
	          	</div>
			</c:forEach>
			</div>
			<div class="paging">
                <div>◀◀</div>
                <div>◀</div>
                <!-- c:forEach start -->
                <div>1</div>
                <div>2</div>
                <div>3</div>
                <div>4</div>
                <div>5</div>
                <!-- c:forEach End -->
                <div>▶</div>
                <div>▶▶</div>
            </div>
		</div>
		
		<!-- 아이템 리스트 뿌려주기 -->
	</div>
</div>
<!-- <script src="js/modal.js"></script> -->
<script src="/js/render.js"></script>
<script>
	// 검색바 달력 현재 날짜-7 ~ 현재날짜
	let dateStart = document.getElementById("startdate");
	let dateEnd = document.getElementById("enddate");
	
	let today = new Date();
	let endDateValue =today.toISOString().substring(0,10);
	let startDateValue = new Date(today.setDate(today.getDate()-7)).toISOString().substring(0,10);
	
	dateStart.value = startDateValue;
	dateEnd.value = endDateValue;
	// 검색바 달력 현재 날짜-7 ~ 현재날짜 끝.
	// ============================================
	// bill/bill 에서 접속 -> 모달창 생성	
	let itemsDetailEl = document.querySelectorAll('[id=itemsDetail]');
	for(let i = 0; i< itemsDetailEl.length; i++){
		itemsDetailEl[i].addEventListener('click',(e) => {
			//alert(i);
			e.stopPropagation();
			let modalContainerEl = document.getElementById('modal-container');
			modalContainerEl.style.transform='translateX(0%)';
			
			let itemsIdx = itemsDetailEl[i].getAttribute('value');
			let giCodeEl = document.getElementById('giCode');
			let giNameEl = document.getElementById('giName');
			let gcmCodeEl = document.getElementById('gcmCode');
			let gcmNameEl = document.getElementById('gcmName');
			let gihPriceEl = document.getElementById('gihPrice');
			let gihQtyEl = document.getElementById('gihQty');
			let aMountEl = document.getElementById('aMount');
			
			//alert(itemsIdx);
			fetch('/bill/onebill/'+itemsIdx)
			.then( response => response.json() )
			.then( data     => {
				console.log(data)
				data.forEach(item => {
					giCodeEl.value = item.gi_code;
					giNameEl.value = item.gi_name;
					gcmCodeEl.value = item.gcm_code;
					gcmNameEl.value = item.gcm_name;
					gihPriceEl.value = item.gih_price;
					gihQty.value = item.gih_qty;
					aMountEl.textContent = item.amount;
					
				})
				//resultEl.innerHTML = makeTable( list )
			})
			.then(error => console.log(error) )
		})
	}
	// 모달창 생성 끝.	
	// ============================================
	// 모달창 닫기
	let wrapEl = document.querySelector('.right-wrap');
	wrapEl.addEventListener('click',(e)=>{
		let modalContainerEl = document.getElementById('modal-container');
		modalContainerEl.style.transform='translateX(100%)';
	});
	// 모달창 생성 및 닫기 끝.
	// ============================================
	// 출고확인서 리스트
	let searchOutBillEl = document.getElementById('searchOutBill');
	searchOutBillEl.addEventListener('click',(e)=>{
		//alert(searchOutBill.value);
		
		let gih_inputEl = document.getElementById('gih_input');
		let gih_idxEl = document.getElementById('gih_idx');
		let gi_nameEl = document.getElementById('gi_name');
		let gcm_nameEl = document.getElementById('gcm_name');
		let gih_priceEl = document.getElementById('gih_price');
		let gih_qtyEl = document.getElementById('gih_qty');
		let all_amountEl = document.getElementById('all_amount');
		let gih_regdateEl = document.getElementById('gih_regdate');
		
		let startDateEl = document.getElementById('startdate');
		let endDateEl = document.getElementById('enddate');
		
		let radiosEl = document.getElementsByName('searchoption');
		let searchStrEl = document.getElementById('search');
		let fetchUrl = '';
		//let searchStr = '';
		if(searchStrEl.value != ''){
			//searchStr = searchStrEl.value;
			fetchUrl = '/bill/billout/'+startDateEl.value+'/'+endDateEl.value+'/'+radiosEl[0].checked+'/'+radiosEl[1].checked+'/'+searchStrEl.value;
		}else{
			fetchUrl = '/bill/billout/'+startDateEl.value+'/'+endDateEl.value+'/'+radiosEl[0].checked+'/'+radiosEl[1].checked+'/null';
		}
		
		fetch(fetchUrl)
			.then( response => response.json() )
			.then( data     => {
				//console.log(data)
				let m_itemsEl = document.getElementById("m-items");
				m_itemsEl.innerHTML='';
				
				data.forEach(item => {
					const list = document.createElement("div");
					list.innerHTML =  `
						<input type="hidden" id="gih_input" value=\${item.gih_inout} />
						<div id="gih_idx"><input type="checkbox" id="chkBillId" value='\${item.gih_idx}' >&nbsp;&nbsp;\${item.num}</div>
						<div id='gi_name'>\${item.gi_name}</div>
						<div id="gcm_name">\${ item.gcm_name }</div>
						<div id="gih_price">\${ item.gih_price }</div>
						<div id="gih_qty">\${ item.gih_qty } EA</div>
						<div id="all_amount">총 \${ item.amount } 원</div>
						<div id="gih_regdate">\${ item.gih_regdate }</div>
					`;
						
					const itemsDetailsDiv = document.createElement('div');
					itemsDetailsDiv.className = 'items-btn orange';
					itemsDetailsDiv.id = 'itemsDetail';
					itemsDetailsDiv.name = 'itemsDetail';
					itemsDetailsDiv.setAttribute('value', `\${item.gih_idx}`);
						
					itemsDetailsDiv.addEventListener('click', (e) => {
						e.stopPropagation();
						let modalContainerEl = document.getElementById('modal-container');
						modalContainerEl.style.transform='translateX(0%)';
							
						let giCodeEl = document.getElementById('giCode');
						let giNameEl = document.getElementById('giName');
						let gcmCodeEl = document.getElementById('gcmCode');
						let gcmNameEl = document.getElementById('gcmName');
						let gihPriceEl = document.getElementById('gihPrice');
						let gihQtyEl = document.getElementById('gihQty');
						let aMountEl = document.getElementById('aMount');
							
						giCodeEl.value = `\${item.gih_idx}`;
						giNameEl.value = `\${item.gi_name}`;
						gcmCodeEl.value = `\${item.gcm_code}`;
						gcmNameEl.value = `\${item.gcm_name}`;
						gihPriceEl.value = `\${item.gih_price}`;
						gihQtyEl.value = `\${item.gih_qty}`;
						aMountEl.textContent = `\${item.amount}`;
					})
					const btnsBox = document.createElement('div');
					btnsBox.className = 'btns-box';
					
					btnsBox.appendChild(itemsDetailsDiv);
					
					list.appendChild(btnsBox);
	           	    m_itemsEl.appendChild(list);
				})
			})
			.then(error => console.log(error) )
	});
	// 출고확인서 리스트 끝.
	// ============================================
	// 입고확인서 리스트
	let searchInBillEl = document.getElementById('searchInBill');
	searchInBillEl.addEventListener('click',(e)=>{
		//alert(searchOutBill.value);
		
		let gih_inputEl = document.getElementById('gih_input');
		let gih_idxEl = document.getElementById('gih_idx');
		let gi_nameEl = document.getElementById('gi_name');
		let gcm_nameEl = document.getElementById('gcm_name');
		let gih_priceEl = document.getElementById('gih_price');
		let gih_qtyEl = document.getElementById('gih_qty');
		let all_amountEl = document.getElementById('all_amount');
		let gih_regdateEl = document.getElementById('gih_regdate');
		
		let startDateEl = document.getElementById('startdate');
		let endDateEl = document.getElementById('enddate');
		
		let radiosEl = document.getElementsByName('searchoption');
		let searchStrEl = document.getElementById('search');
		let fetchUrl = '';
		//let searchStr = '';
		if(searchStrEl.value != ''){
			//searchStr = searchStrEl.value;
			fetchUrl = '/bill/billin/'+startDateEl.value+'/'+endDateEl.value+'/'+radiosEl[0].checked+'/'+radiosEl[1].checked+'/'+searchStrEl.value;
		}else{
			fetchUrl = '/bill/billin/'+startDateEl.value+'/'+endDateEl.value+'/'+radiosEl[0].checked+'/'+radiosEl[1].checked+'/null';
		}
		
		fetch(fetchUrl)
			.then( response => response.json() )
			.then( data     => {
				//console.log(data)
				let m_itemsEl = document.getElementById("m-items");
				m_itemsEl.innerHTML='';
				
				data.forEach(item => {
					const list = document.createElement("div");
					list.innerHTML =  `
						<input type="hidden" id="gih_input" value=\${item.gih_inout} />
						<div id="gih_idx"><input type="checkbox" id="chkBillId" value='\${item.gih_idx}' >&nbsp;&nbsp;\${item.num}</div>
						<div id='gi_name'>\${item.gi_name}</div>
						<div id="gcm_name">\${ item.gcm_name }</div>
						<div id="gih_price">\${ item.gih_price }</div>
						<div id="gih_qty">\${ item.gih_qty } EA</div>
						<div id="all_amount">총 \${ item.amount } 원</div>
						<div id="gih_regdate">\${ item.gih_regdate }</div>
					`;
						
					const itemsDetailsDiv = document.createElement('div');
					itemsDetailsDiv.className = 'items-btn orange';
					itemsDetailsDiv.id = 'itemsDetail';
					itemsDetailsDiv.name = 'itemsDetail';
					itemsDetailsDiv.setAttribute('value', `\${item.gih_idx}`);
						
					itemsDetailsDiv.addEventListener('click', (e) => {
						e.stopPropagation();
						let modalContainerEl = document.getElementById('modal-container');
						modalContainerEl.style.transform='translateX(0%)';
							
						let giCodeEl = document.getElementById('giCode');
						let giNameEl = document.getElementById('giName');
						let gcmCodeEl = document.getElementById('gcmCode');
						let gcmNameEl = document.getElementById('gcmName');
						let gihPriceEl = document.getElementById('gihPrice');
						let gihQtyEl = document.getElementById('gihQty');
						let aMountEl = document.getElementById('aMount');
							
						giCodeEl.value = `\${item.gih_idx}`;
						giNameEl.value = `\${item.gi_name}`;
						gcmCodeEl.value = `\${item.gcm_code}`;
						gcmNameEl.value = `\${item.gcm_name}`;
						gihPriceEl.value = `\${item.gih_price}`;
						gihQtyEl.value = `\${item.gih_qty}`;
						aMountEl.textContent = `\${item.amount}`;
					})
					const btnsBox = document.createElement('div');
					btnsBox.className = 'btns-box';
					
					btnsBox.appendChild(itemsDetailsDiv);
					
					list.appendChild(btnsBox);
	           	    m_itemsEl.appendChild(list);
				})
			})
			.then(error => console.log(error) )
	});
</script>
</body>
</html>