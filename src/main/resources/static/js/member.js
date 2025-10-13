/**
 * 
 */
const GMinfomation = document.getElementById('infomation');
GMinfomation.addEventListener('click', (event) => {
	event.preventDefault();
	event.stopPropagation();
	const infoModal = document.getElementById('gm_infomation');
	infoModal.style.transform = 'translateX(0%)';
});

const GMinfomationClose = document.getElementById('infomation-close');
GMinfomationClose.addEventListener('click', (event) => {
	event.preventDefault();
	event.stopPropagation();
	const infoModal = document.getElementById('gm_infomation');
	infoModal.style.transform = 'translateX(100%)';
})

const GMlogoutEl = document.getElementById('logout');
GMlogoutEl.addEventListener('click', (event) => {
	event.preventDefault();
	event.stopPropagation();
	if(confirm('정말 로그아웃을 하시겠습니까?')) {
		const form = document.createElement('form');
		form.setAttribute('method', 'GET');
		form.setAttribute('action', '/logout')
		document.body.appendChild(form);
		form.submit();			
	} else {
		return;
	}
})