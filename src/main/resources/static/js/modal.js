const inCreateEl = document.querySelector('#in-create');

inCreateEl.addEventListener('click', (e) => {
	const overlay = document.createElement('div');
	const companySelectModalEl = document.createElement('div');
	const message = document.createElement('p');
	
	overlay.className = "overlay"; 
	companySelectModalEl.className = "company-modal";
	message.className = "message";
	message.innerHTML = "입고할 거래처 선택";
	
	let select = '';
	select = `<label for="company">거래처 선택: </label>
						<select id="company-select">
							<c:forEach var="lis" items="${list}">
							<option>${lis.gi_name}</option>
							</c:forEach>
						</select>`
	
	document.body.appendChild(overlay);
	overlay.appendChild(companySelectModalEl);
	companySelectModalEl.appendChild(message);
	companySelectModalEl.appendChild(select);
	
})



const modalContainerEl = document.querySelector('#modal-container');
 // modalContainerEl.style.transform = 'translateX(0%)';