<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&"/>
	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/wrap.css">
	<link rel="stylesheet" href="/css/m-header.css">
	<title>Store Manager</title>
<style>
	.material-symbols-outlined {
		
	}
	#dash-container {
		flex-grow: 1;
		display: flex;
		flex-direction: column;
		gap: 2rem;
	}
	#dash-container > div:nth-of-type(1) {
		width: 100%;
		height: 15rem;
		display: flex;
		align-items: center;
		gap: 2rem;
	}
	#dash-container > div:nth-of-type(1) > div {
		width: 25%;
		height: 13rem;
		border-radius: 1rem;
		overflow: hidden;
	}
	#dash-container > div:nth-of-type(1) > div > div:first-child {
		width: 100%;
		height: 4rem;
		line-height: 4rem;
		font-size: 1.8rem;
		text-align: center;
		background-color: #00CC00;
		color: white;
		text-shadow:
		0 0 2px #FFF,
		0 0 5px #003300,
		0 0 10px #006600;
	}
	#dash-container > div:nth-of-type(1) > div > div:last-child {
		width: 100%;
		height: calc(100% - 4rem);
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 2.5rem;
		background-color: #FFFAFA;
		box-shadow: 0 0 5px rgba(33, 33, 33, 0.2);
	}
	
	/* 전월 대비 색상 AJAX CODE 로 */
	#dash-container > div:nth-of-type(1) > div:nth-of-type(3) > div:last-child {
		color: #1E90FF;
	}
	#dash-container > div:nth-of-type(1) > div:nth-of-type(4) > div:last-child {
		color: #DC3545;
	}
	
	#dash-container > div:nth-of-type(2) {
		width: 100%;
		height: calc(100% - 13rem);
		display: flex;
		gap: 2rem;
	}
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) {
		width: 40%;
		height: 100%;
		display: flex;
		flex-direction: column;
		gap: 2rem;
	}
	#dash-container > div:nth-of-type(2) > div:nth-of-type(2) {
		width: 60%;
		height: 100%;
		display: grid;
		grid-template-rows: repeat(3, 1fr);
		grid-gap: 2rem;
	}
	
	/* ID:ds-donut-box */
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(1) {
		width: 100%;
		height: 25rem;
		border: 1px solid rgba(33, 33, 33, 0.2);
		border-radius: 1rem;
		overflow: hidden;
	}
	/* ID:ds-donut-header */
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1),
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(1) {
		width: 100%;
		height: 4rem;
		font-size: 1.5rem;
		background-color: #D9D9D9;
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 0 2rem;
		color: black;
	}
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1),
	#ds-stick-headerText {
		width: 30%;
		display: flex;
		align-items: center;
	}
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(2),
	#ds-stick-headerBTNS {
		width: 70%;
		display: flex;
		align-items: center;
		justify-content: flex-end;
		gap: 1rem;
	}
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(2) button,
	#ds-stick-headerBTNS button {
		font-size: 1rem;
		padding: 0.3rem 0.8rem;
		border: none;
		color: white;
		border-radius: 0.5rem;
		cursor: pointer;
		background-color: #00AA00;
		
		&:hover { transform: scale(1.03); }
		&:active { transform: scale(1); }
	}
	
	/* ID:ds-donut-content */
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(2) {
		width: 100%;
		height: calc(100% - 4rem);
		display: flex;
		align-items: center;
		justify-content: center;
		padding: 0 1rem;
	}
	
	#ds-donut-content {
		background-color: #FFFAFA;
	}
	#ds-stick-content {
		background-color: #FFFAFA;		
	}
	
	/* ID:ds-donut-image */
	#ds-donut-content > div:nth-of-type(1) {
		width: 18rem;
		height: 18rem;
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
		
		/* AJAX DATA */
		background-image: conic-gradient(
		#DC3545 0% 39%,
		orange 39% 75%,
		#FFD700 75% 87%,
		#00AA00 87% 94%,
		#1E90FF 94% 100%
		);
	}
	
	#ds-donut-content > div:nth-of-type(1)::before {
		content:'(주) 부성';
		width: 14rem;
		height: 14rem;
		background-color: white;
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 2rem;
		color:white;
		text-shadow: 0 0 3px #000;
	}
	
	/* ID:ds-donut-text */
	#ds-donut-content > div:nth-of-type(2) {
		width: calc(100% - 20rem);
		height: 100%;
		display: grid;
		grid-template-rows: repeat(5, 1fr);
		grid-gap: 1rem;
		padding: 1rem 0;
	}
	#ds-donut-content > div:nth-of-type(2) > div {
		flex-grow: 1;
		width: 80%;
		margin: 0 auto;
		display: flex;
		align-items: center;
		justify-content: center;
		border: 1px solid rgba(33, 33, 33, 0.2);
		border-radius: 0.5rem;
		box-shadow: 0 0 5px rgba(33, 33, 33, 0.2);
		
		&:nth-of-type(1) { border: 2px solid #DC3545 }
		&:nth-of-type(2) { border: 2px solid orange }
		&:nth-of-type(3) { border: 2px solid #FFD700 }
		&:nth-of-type(4) { border: 2px solid #00AA00 }
		&:nth-of-type(5) { border: 2px solid #1E90FF }
	}
	#ds-donut-text > div {
		&:nth-of-type(1) > div:nth-of-type(1) { background-color: #DC3545; }
		&:nth-of-type(2) > div:nth-of-type(1) { background-color: orange; }
		&:nth-of-type(3) > div:nth-of-type(1) { background-color: #FFD700; }
		&:nth-of-type(4) > div:nth-of-type(1) { background-color: #00AA00; }
		&:nth-of-type(5) > div:nth-of-type(1) { background-color: #1E90FF; }
	}
	#ds-donut-text > div > div:nth-of-type(1) {
		width: 30%;
		height: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 1.5rem;
		color: white;
	}
	#ds-donut-text > div > div:nth-of-type(2) {
		width: 70%;
		line-height: 100%;
		text-align: center;
		font-size: 1.5rem;
	}
	
	/* 막대 차트 */
	#ds-stick-box {
		width: 100%;
		height: calc(100% - 25rem);
		border: 1px solid rgba(33, 33, 33, 0.2);
		border-radius: 1rem;
		overflow: hidden;
	}
	#ds-stick-content {
		width: 100%;
		height: calc(100% - 4rem);
		display: flex;
		flex-direction: column;
		padding: 2rem;
	}
	#ds-stick-image {
		position: relative;
		width: 80%;
		height: 80%;
		margin: 0 auto;
		display: flex;
		align-items: flex-end;
		justify-content: center;
		gap: 2rem;
		border-bottom: 2px solid black;
		border-left: 2px solid black;
		
		&::before {
			content: '100%';
			position: absolute;
			top: 0;
			left: -45px;
			font-size: 1.5rem;
		}
		&::after {
			content: '0%';
			position: absolute;
			left: -45px;
			font-size: 1.5rem;
		}
	}
	#ds-stick-image > div {
		width: 10%;
		border-top-left-radius: 1rem;
		border-top-right-radius: 1rem;
		display: flex;
		justify-content: center;
		font-size: 1.3rem;
		color: white;
		&:nth-of-type(1) { background-color: #DC3545; height: 39%; }
		&:nth-of-type(2) { background-color: orange; height: 36%; }
		&:nth-of-type(3) { background-color: #FFD700; height: 12%; }
		&:nth-of-type(4) { background-color: #00AA00; height: 7%; }
		&:nth-of-type(5) { background-color: #1E90FF; height: 6%; }
	}
	#ds-stick-text {
		width: 80%;
		height: calc(100% - 80%);
		margin: 0 auto;
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 2rem;
	}
	#ds-stick-text > div {
		width: 10%;
		height: 100%;
		display: flex;
		justify-content: center;
		padding-top: 0.5rem;
		font-size: 1.3rem;
	}
	
	
	
	/* TOP 5 List */
	#dash-container > div:nth-of-type(2) > div:nth-of-type(2) > div {
		flex-grow: 1;
		border: 1px solid rgba(33, 33, 33, 0.2);
		border-radius: 1rem;
		display: flex;
		flex-direction: column;
		overflow: hidden;
	}
	#in-parent > div:nth-of-type(1),
	#out-parent > div:nth-of-type(1),
	#bill-parent > div:nth-of-type(1) {
		width: 100%;
		height: 4rem;
		background-color: #D9D9D9;
		padding-left: 2rem;
		display: flex;
		align-items: center;
		font-size: 1.5rem;
	}
	#in-top5-box,
	#out-top5-box,
	#bill-top5-box {
		width: 100%;
		height: auto;
		padding: 1rem 2rem;
		display: flex;
		flex-direction: column;
		justify-content: flex-start;
		gap: 0.5rem;
		background-color: #FFFAFA;
	}
	#in-top5-box > div,
	#out-top5-box > div,
	#bill-top5-box > div {
		width: 100%;
		height: 3rem;
		border: 1px solid rgba(33, 33, 33, 0.2);
		border-radius: 0.5rem;
		
		display: grid;
		grid-template-columns: repeat(6, 1fr);
		grid-gap: 1rem;
		
		background-color: white;
		
		&:first-child {
			border: none;
			background-color: #008800;
			
			& div { color: white; }
		}
	}
	#out-top5-box > div:first-child {
		background-color: #00AA00;
	}
	#bill-top5-box > div:first-child {
		background-color: #00CC00;
	}
	#in-top5-box > div > div,
	#out-top5-box > div > div,
	#bill-top5-box > div > div {
		text-align: center;
		line-height: 3rem;
		font-size: 1.3rem;
	}
</style>
</head>
<body>
<div class="wrap">
	<%@ include file="../layout/left-menu.jsp"%>
	<div class="right-wrap">
		<%@ include file="../layout/header.jsp"%>
		<div id="dash-container">
			<!-- dashboard header -->
			<div>
				<div>
					<div>당월 입고가 총계</div>
					<div id="now-in-price"></div>
				</div>
				<div>
					<div>당월 출고가 총계</div>
					<div id="now-out-price"></div>
				</div>
				<div>
					<div>전월 매출액</div>
					<div id="bef-sales">▼ 7,542,000 원</div>
				</div>
				<div>
					<div>남은 재고 입고가 총계</div>
					<div id="remain-items-price">31,540,400 원</div>
				</div>
			</div>
			
			<!-- dashboard main content flex row 40:60 -->
			<div>
				<!-- 첫 번째 레이아웃 : 컴포넌트 버전 -->
				<div>
					<!-- 도넛 차트 -->
					<div id="ds-donut-box">
						<div id="ds-donut-header">
							<div id="ds-donut-headerTEXT">
								<span style="margin-right: 0.5rem;" class="material-symbols-outlined">donut_large</span>
								당월 총 입고 차트
							</div>
							<div id="ds-donut-headerBTNS">
								<button id="d-t-now-in">당월 총 입고</button>
								<button id="d-t-now-out">당월 총 출고</button>
								<button id="dbef-items-intop">전월 입고 상위 품목</button>
								<button id="dbef-items-outtop">전월 출고 상위 품목</button>
							</div>
						</div>
						<!-- 도넛 영역 -->
						<div id="ds-donut-content">
							<!-- 도넛 그림 -->
							<div id="ds-donut-image"></div>
							<!-- 도넛 그림 텍스트 내용 -->
							<div id="ds-donut-text">
								<div><div>39%</div><div>문어</div></div>
								<div><div>36%</div><div>시금치</div></div>
								<div><div>12%</div><div>양갱</div></div>
								<div><div>7%</div><div>오징어</div></div>
								<div><div>6%</div><div>원두</div></div>
							</div>
						</div>
					</div>
					
					<!-- 막대 차트 -->
					<div id="ds-stick-box">
						<div id="ds-stick-header">
							<div id="ds-stick-headerText">
								<span style="margin-right: 0.5rem;" class="material-symbols-outlined">bar_chart</span>
<<<<<<< HEAD
								당월 입/출고 현황 TOP 5
=======
								당월 총 입고 차트
>>>>>>> item
							</div>
							<div id="ds-stick-headerBTNS">
								<button id="s-t-now-in">당월 총 입고</button>
								<button id="s-t-now-out">당월 총 출고</button>
								<button id="sbef-items-intop">전월 입고 상위 품목</button>
								<button id="sbef-items-outtop">전월 출고 상위 품목</button>
							</div>
						</div>
						
						<!-- 막대 영역 -->
						<div id="ds-stick-content">
							<!-- 막대 그림 -->
							<div id="ds-stick-image">
								<div>39%</div>
								<div>36%</div>
								<div>12%</div>
								<div>7%</div>
								<div>6%</div>
							</div>
							<div id="ds-stick-text">
								<div>문어</div>
								<div>시금치</div>
								<div>양갱</div>
								<div>오징어</div>
								<div>원두</div>								
							</div>
						</div>
					</div>
				</div>
				
				<!-- 두 번째 레이아웃 : 컴포넌트 버전 -->
				<div>
					<div id="in-parent">
						<div>
							<span style="margin-right: 0.5rem;" class="material-symbols-outlined">list</span>
							최신 입고 내역
						</div>
						<!-- 최신 입고 내역 리스트 parent box -->
						<div id="in-top5-box">
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
						</div>
					</div>
					<div id="out-parent">
						<div>
							<span style="margin-right: 0.5rem;" class="material-symbols-outlined">list</span>
							최신 출고 내역
						</div>
						<!-- 최신 출고 내역 리스트 parent box -->
						<div id="out-top5-box">
							<div> <div>출고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 출고액</div> </div>
							<div> <div>출고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 출고액</div> </div>
							<div> <div>출고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 출고액</div> </div>
							<div> <div>출고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 출고액</div> </div>
							<div> <div>출고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 출고액</div> </div>
							<div> <div>출고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 출고액</div> </div>
						</div>
					</div>
					<div id="bill-parent">
						<div>
							<span style="margin-right: 0.5rem;" class="material-symbols-outlined">list</span>
							최신 명세서 내역
						</div>
						<div id="bill-top5-box"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/js/render.js"></script>
<script src="/js/member.js"></script>
<script src="/js/dash.js"></script>
<script>
<<<<<<< HEAD
billTopFive();
outTopFive();
inTopFive();
stickTotalNowIn();
befSales();
nowOutPrice();
nowInPrice();
=======
// 당월 입고가 총계
function nowInPrice() {
	fetch('/dash/now-in-price')
	.catch(error => console.log(error))
	.then(response => response.text())
	.then(price => {
		const nowInPrice = document.getElementById('now-in-price');
		nowInPrice.textContent = price;
	})
}
nowInPrice();
// 당월 출고가 총계
function nowOutPrice() {
	fetch('/dash/now-out-price')
	.catch(error => console.log(error))
	.then(response => response.text())
	.then(price => {
		const nowOutPrice = document.getElementById('now-out-price');
		nowOutPrice.textContent = price;
	});
}
nowOutPrice();
// 전월 매출액
function befSales() {
	fetch('/dash/bef-sales')
	.catch(error => console.log(error))
	.then(response => response.json())
	.then(json => {
		const befSales = document.getElementById('bef-sales');
		befSales.textContent = json.sales;
		befSales.style.color = json.color;
	});
}
befSales();	
// 남은 재고 입고가 총계
Render.setComponent('remain-items-price', () => {
	
});
function remainItemsPrice() {
	
}

// CHART 당월 총 입고
function donutTotalNowIn() {
	
}
function stickTotalNowIn() {
	
}
// CHART 당월 총 출고
function donutTotalNowOut() {
	
}
function stickTotalNowOut() {
	
}
// CHART 전월 입고 상위 품목
function donutBefItemsInTop() {
	
}
function stickBefItemsInTop() {
	
}
// CHART 전월 출고 상위 품목
function donutBefItemsOutTop() {
	
}
function stickBefItemsOutTop() {
	
}
// 차트 퍼센테이지
function ChartPerCalc() {
	
}

// 최신 입고 내역
function InTopFive() {
	
}
// 최신 출고 내역
function OutTopFive() {
	
}
// 명세서?
function whatAreYouDoing() {
	
}
>>>>>>> item
</script>
</body>
</html>