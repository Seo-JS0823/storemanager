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
		margin: 0 auto;
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
		height: 100%;
		border: 1px solid rgba(33, 33, 33, 0.2);
		border-radius: 1rem;
		overflow: hidden;
	}
	/* ID:ds-donut-header */
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) {
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
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) {
		width: 30%;
		display: flex;
		align-items: center;
	}
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(2) {
		width: 70%;
		display: flex;
		align-items: center;
		justify-content: flex-end;
		gap: 1rem;
	}
	#dash-container > div:nth-of-type(2) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(2) button {
		font-size: 1.2em;
		padding: 0.3rem 1rem;
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
	#ds-stick-content > div:first-child {
		font-size: 1.8rem;
	}
	#ds-stick-image {
		position: relative;
		width: 80%;
		height: 60%;
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
		width: 15%;
		border-top-left-radius: 1rem;
		border-top-right-radius: 1rem;
		display: flex;
		justify-content: center;
		font-size: 1.3rem;
		color: white;
		/* TEST
		&:nth-of-type(1) { background-color: #DC3545; height: 39%; }
		&:nth-of-type(2) { background-color: orange; height: 36%; }
		&:nth-of-type(3) { background-color: #FFD700; height: 12%; }
		&:nth-of-type(4) { background-color: #00AA00; height: 7%; }
		&:nth-of-type(5) { background-color: #1E90FF; height: 6%; }
		*/
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
		width: 15%;
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
		height: calc(100% - 4rem);
		padding: 1rem 2rem;
		display: flex;
		flex-direction: column;
		justify-content: center;
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
					<div>당월 매출 총이익</div>
					<div id="bef-sales"></div>
				</div>
			</div>
			
			<!-- dashboard main content flex row 40:60 -->
			<div>
				<!-- 첫 번째 레이아웃 : 컴포넌트 버전 -->
				<div>
					<!-- 막대 차트 -->
					<div id="ds-stick-box">
						<div id="ds-stick-header">
							<div id="ds-stick-headerText">
								<span style="margin-right: 0.5rem;" class="material-symbols-outlined">bar_chart</span>
								당월 입/출고 현황
							</div>
							<div id="ds-stick-headerBTNS">
								<button id="s-t-now-in">당월 총 입고</button>
								<button id="s-t-now-out">당월 총 출고</button>
							</div>
						</div>
						
						<!-- 막대 영역 -->
						<div id="ds-stick-content">
							<div id="ds-stick-innerHead"></div>
							<!-- 막대 그림 -->
							<div id="ds-stick-image"></div>
							<!-- 막대 그림 텍스트 -->
							<div id="ds-stick-text"></div>
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
							명세서?
						</div>
						<div id="bill-top5-box">
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
							<div> <div>입고 날짜</div><div>거래처</div><div>품목</div><div>수량</div><div>단가</div><div>총 입고액</div> </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/js/render.js"></script>
<script src="/js/member.js"></script>
<script>
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
// 당월 매출 총이익
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

// CHART 당월 총 입/출고
// 입고 : total-in (Array)
// 출고 : total-out (Array)
const chartData = {
	_totalIn: undefined,
	_totalInQty: undefined,
	_totalInSum: undefined,
	_totalInPer: undefined,
	_totalOut: undefined,
	_totalOut: undefined,
	_totalOutSum: undefined,
	_totalOutPer: undefined,
	
	set totalIn(totalIn) {
		this._totalIn = totalIn;
	},
	get totalIn() {
		return this._totalIn;
	},
	set totalInQty(totalInQty) {
		this._totalInQty = totalInQty;
	},
	get totalInQty() {
		return this._totalInQty;
	},
	set totalInSum(totalInSum) {
		this._totalInSum = totalInSum;
	},
	get totalInSum() {
		return this._totalInSum;
	},
	set totalInPer(totalInPer) {
		this._totalInPer = totalInPer;
	},
	get totalInPer() {
		return this._totalInPer;
	},
	
	set totalOut(totalOut) {
		this._totalOut = totalOut;
	},
	get totalOut() {
		return this._totalOut;
	},
	set totalOutQty(totalOutQty) {
		this._totalOutQty = totalOutQty;
	},
	get totalOutQty() {
		return this._totalOutQty;
	},
	set totalOutSum(totalOutSum) {
		this._totalOutSum = totalOutSum;
	},
	get totalOutSum() {
		return this._totalOutSum;
	},
	set totalOutPer(totalOutPer) {
		this._totalOutPer = totalOutPer;
	},
	get totalOutPer() {
		return this._totalOutPer;
	}
}
function stickChartRender(inout) {
	const stickImage = document.getElementById('ds-stick-image');
	stickImage.innerHTML = '';
	const stickText = document.getElementById('ds-stick-text');
	stickText.innerHTML = '';
	const stickHeader = document.getElementById('ds-stick-innerHead');
	stickHeader.innerHTML = '';
	const color = ['#DC3545', 'orange', '#FFD700', '#00AA00', '#1E90FF'];
	
	let i = 0;
	if(inout === 'IN') {
		stickHeader.textContent = '당월 총 입고';
		chartData.totalIn.forEach(data => {
			const topText = document.createElement('div');
			topText.style.top = '-20px';
			topText.style.position = 'absolute';
			topText.style.color = 'black';
			topText.textContent = chartData.totalInPer[i] + ' %';
			const image = document.createElement('div');
			image.style.height = chartData.totalInPer[i] + '%';
			image.style.position = 'relative';
			image.style.backgroundColor = color[i];
			image.appendChild(topText);
			stickImage.appendChild(image);
			
			const text = document.createElement('div');
			text.style.textAlign = 'center';
			text.innerHTML = `
			\${data.gi_name}
			<br>
			\${Math.abs(data.gih_qty)}EA
			<br>
			\${Math.abs(data.gih_qty * data.gih_price)} 원`;
			stickText.appendChild(text);
			i++;
		});
	} else if(inout === 'OUT') {
		stickHeader.textContent = '당월 총 출고';
		chartData.totalOut.forEach(data => {
			const topText = document.createElement('div');
			topText.style.top = '-20px';
			topText.style.position = 'absolute';
			topText.style.color = 'black';
			topText.textContent = chartData.totalOutPer[i] + ' %';
			const image = document.createElement('div');
			image.style.height = chartData.totalOutPer[i] + '%';
			image.style.position = 'relative';
			image.style.backgroundColor = color[i];
			image.appendChild(topText);
			stickImage.appendChild(image);
			
			const text = document.createElement('div');
			text.style.textAlign = 'center';
			text.innerHTML = `\${data.gi_name}
			<br>
			\${Math.abs(data.gih_qty)}EA
			<br>
			\${Math.abs(data.gih_qty * data.gih_price)} 원`;
			stickText.appendChild(text);
			i++;
		});
	}
}
function stickTotalNowIn() {
	fetch('/dash/stick-total-now')
	.catch(error => console.log(error))
	.then(response => response.json())
	.then(data => {
		chartData.totalIn = data.total_in;
		chartData.totalInQty = data.total_in_qty;
		chartData.totalInSum = data.total_in_sum;
		chartData.totalInPer = data.total_in_per;
		chartData.totalOut = data.total_out;
		chartData.totalOutQty = data.total_out_qty;
		chartData.totalOutSum = data.total_out_sum;
		chartData.totalOutPer = data.total_out_per;
		
		stickChartRender('IN');
	});
}
stickTotalNowIn();
document.getElementById('s-t-now-in').addEventListener('click', () => {
	stickChartRender('IN');
});
document.getElementById('s-t-now-out').addEventListener('click', () => {
	stickChartRender('OUT');
});
// 최신 입고 내역
function InTopFive() {
	
}
// 최신 출고 내역
function OutTopFive() {
	
}
// 명세서?
function whatAreYouDoing() {
	
}
</script>
</body>
</html>