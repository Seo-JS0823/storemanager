const memberProfileData = {
	_profile: {},
	_fetchs: false,
	set profile(profile) {
		this._profile = profile;
	},
	get profile() {
		return this._profile;
	},
	
	set fetchs(fetchs) {
		this._fetchs = fetchs;
	},
	get fetchs() {
		return this._fetchs;
	}
}

const GMinfomation = document.getElementById('infomation');
if(GMinfomation !== null) {
	GMinfomation.addEventListener('click', (event) => {
		event.preventDefault();
		event.stopPropagation();
		const infoModal = document.getElementById('gm_infomation');
		infoModal.style.transform = 'translateX(0%)';
		
		let id = document.getElementById('profile-id').value;
		if(memberProfileData.fetchs === false) {
			if(memberProfileData.id !== '') {
				fetch('/member-profile', {
					method: 'post',
					body: id
				})
				.then(response => response.json())
				.then(data => {
					memberProfileData.fetchs = true;
					document.getElementById('info-name').textContent = data.member.gm_id;
					document.getElementById('info-level').textContent = data.member.gm_level;
					document.getElementById('info-email').textContent = data.member.gm_email;
					document.getElementById('info-regdate').textContent = data.member.gm_regdate;
					document.getElementById('info-tel').textContent = data.member.gm_tel;
					
					const img = document.createElement('img');
					img.src = data.filepath
					document.getElementById('member-profile-image').appendChild(img);
				})
			}
		}
	});
}
const GMinfomationClose = document.getElementById('infomation-close');
if(GMinfomationClose !== null) {
	GMinfomationClose.addEventListener('click', (event) => {
		event.preventDefault();
		event.stopPropagation();
		const infoModal = document.getElementById('gm_infomation');
		infoModal.style.transform = 'translateX(100%)';
	})
}
const GMlogoutEl = document.getElementById('logout');
if(GMlogoutEl !== null) {
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
}