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
			${data.gi_name}
			<br>
			${Math.abs(data.gih_qty)}EA
			<br>
			${Math.abs(data.gih_qty * data.gih_price)} 원`;
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
			text.innerHTML = `
			${data.gi_name}
			<br>
			${Math.abs(data.gih_qty)}EA
			<br>
			${Math.abs(data.gih_qty * data.gih_price)} 원`;
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
document.getElementById('s-t-now-in').addEventListener('click', () => {
	stickChartRender('IN');
});
document.getElementById('s-t-now-out').addEventListener('click', () => {
	stickChartRender('OUT');
});
// 최신 입고 내역
function inTopFive() {
	fetch('/dash/in-top-five')
	.catch(error => console.log(error))
	.then(response => response.json())
	.then(json => {
		const inTop = document.getElementById('in-top5-box');
		inTop.innerHTML = `
		<div>
			<div>입고 날짜</div>
			<div>거래처</div>
			<div>품목</div>
			<div>수량</div>
			<div>단가</div>
			<div>총 입고액</div>
		</div>
		`;
		json.forEach(data => {
			const box = document.createElement('div');
			const regdate = document.createElement('div');
			regdate.textContent = data.gih_regdate;
			const gcmName = document.createElement('div');
			gcmName.textContent = data.gcm_name;
			const giName = document.createElement('div');
			giName.textContent = data.gi_name;
			const gihQty = document.createElement('div');
			gihQty.textContent = data.str_gih_qty + 'EA';
			const gihPrice = document.createElement('div');
			gihPrice.textContent = data.str_gih_price + ' 원';
			const amount = document.createElement('div');
			amount.textContent = data.str_amount + ' 원';
			
			box.appendChild(regdate);
			box.appendChild(gcmName);
			box.appendChild(giName);
			box.appendChild(gihQty);
			box.appendChild(gihPrice);
			box.appendChild(amount);
			inTop.appendChild(box);
		});
	});
}
// 최신 출고 내역
function outTopFive() {
	fetch('/dash/out-top-five')
	.catch(error => console.log(error))
	.then(response => response.json())
	.then(json => {
		const outTop = document.getElementById('out-top5-box');
		outTop.innerHTML = `
		<div>
			<div>출고 날짜</div>
			<div>거래처</div>
			<div>품목</div>
			<div>수량</div>
			<div>단가</div>
			<div>총 출고액</div>
		</div>
		`;
		json.forEach(data => {
			const box = document.createElement('div');
			const regdate = document.createElement('div');
			regdate.textContent = data.gih_regdate;
			const gcmName = document.createElement('div');
			gcmName.textContent = data.gcm_name;
			const giName = document.createElement('div');
			giName.textContent = data.gi_name;
			const gihQty = document.createElement('div');
			gihQty.textContent = data.str_gih_qty + 'EA';
			const gihPrice = document.createElement('div');
			gihPrice.textContent = data.str_gih_price + ' 원';
			const amount = document.createElement('div');
			amount.textContent = data.str_amount + ' 원';
			
			box.appendChild(regdate);
			box.appendChild(gcmName);
			box.appendChild(giName);
			box.appendChild(gihQty);
			box.appendChild(gihPrice);
			box.appendChild(amount);
			outTop.appendChild(box);
		});
	});
}
// 명세서?
function billTopFive() {
	fetch('/dash/bill-top-five')
	.catch(error => console.log(error))
	.then(response => response.json())
	.then(json => {
		const billTop = document.getElementById('bill-top5-box');
		billTop.innerHTML = `
		<div>
			<div>명세서 번호</div>
			<div>상품명</div>
			<div>거래처명</div>
			<div>명세종류</div>
			<div>생성일자</div>
			<div>총 금액</div>
		</div>
		`;
		json.forEach(data => {
			const box = document.createElement('div');
			const gbcNum = document.createElement('div');
			gbcNum.textContent = data.gbc_number;
			const gbcGiName = document.createElement('div');
			gbcGiName.textContent = data.gbc_gi_name;
			const gbcGcmName = document.createElement('div');
			gbcGcmName.textContent = data.gbc_gcm_name;
			const gbcInOut = document.createElement('div');
			gbcInOut.textContent = data.gbc_inout + '명세서';
			const gbcRegdate = document.createElement('div');
			gbcRegdate.textContent = data.gbc_regdate;
			const gbcAmount = document.createElement('div');
			gbcAmount.textContent = data.gbc_amount + ' 원';
			
			box.appendChild(gbcNum);
			box.appendChild(gbcGiName);
			box.appendChild(gbcGcmName);
			box.appendChild(gbcInOut);
			box.appendChild(gbcRegdate);
			box.appendChild(gbcAmount);
			billTop.appendChild(box);
		});
	});
}