const memberProfileData = {
	_profile: {},
	_fileByte: undefined,
	_fetchs: false,
	_password: undefined,
	
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
	},
	
	set fileByte(fileByte) {
		this._fileByte = fileByte;
	},
	get fileByte() {
		return this._fileByte;
	},
	
	set password(password) {
		this._password = password;
	},
	get password() {
		return this._password;
	}
}
Render.setComponent('Profile-Header', (text) => {
	const parent = document.createElement('div');
	
	const closeBtn = document.createElement('button');
	closeBtn.id = 'infomation-close';
	closeBtn.textContent = '닫 기';
	closeBtn.addEventListener('click', (event) => {
		// TODO: Close Modal
		event.preventDefault();
		event.stopPropagation();
		const modal = document.getElementById('gm_infomation');
		modal.style.transform = 'translateX(100%)';	
	});
	
	const span = document.createElement('span');
	span.style.fontWeight = 600;
	span.textContent = text;
	
	parent.appendChild(closeBtn);
	parent.appendChild(span);
	return parent;
});
Render.setComponent('Profile-Content', (json) => {
	const parent = document.createElement('div');
	
	const imageBox = document.createElement('div');
	imageBox.id = 'member-profile-image';
	const imgT = document.createElement('img');
	imgT.src = json.filepath;
	imageBox.appendChild(imgT);
	parent.appendChild(imageBox);
	
	const profile = document.createElement('div');
	const profilelb = document.createElement('label');
	const profiledv = document.createElement('div');
	profilelb.textContent = '아이디';
	profiledv.id = 'info-id';
	profiledv.textContent = json.member.gm_id;
	profile.appendChild(profilelb);
	profile.appendChild(profiledv);
	parent.appendChild(profile);
	
	const profile1 = document.createElement('div');
	const profile1lb = document.createElement('label');
	const profile1dv = document.createElement('div');
	profile1lb.textContent = '사용자';
	profile1dv.id = 'info-name';
	profile1dv.textContent = json.member.gm_name;
	profile1.appendChild(profile1lb);
	profile1.appendChild(profile1dv);
	parent.appendChild(profile1);

	const profile2 = document.createElement('div');
	const profile2lb = document.createElement('label');
	const profile2dv = document.createElement('div');
	profile2lb.textContent = '직급';
	profile2dv.id = 'info-level';
	profile2dv.textContent = json.member.gm_level;
	profile2.appendChild(profile2lb);
	profile2.appendChild(profile2dv);
	parent.appendChild(profile2);

	const profile3 = document.createElement('div');
	const profile3lb = document.createElement('label');
	const profile3dv = document.createElement('div');
	profile3lb.textContent = '이메일';
	profile3dv.id = 'info-email';
	profile3dv.textContent = json.member.gm_email;
	profile3.appendChild(profile3lb);
	profile3.appendChild(profile3dv);
	parent.appendChild(profile3);

	const profile4 = document.createElement('div');
	const profile4lb = document.createElement('label');
	const profile4dv = document.createElement('div');
	profile4lb.textContent = '입사일';
	profile4dv.id = 'info-regdate';
	profile4dv.textContent = json.member.gm_regdate;
	profile4.appendChild(profile4lb);
	profile4.appendChild(profile4dv);
	parent.appendChild(profile4);

	const profile5 = document.createElement('div');
	const profile5lb = document.createElement('label');
	const profile5dv = document.createElement('div');
	profile5lb.textContent = '전화번호';
	profile5dv.id = 'info-tel';
	profile5dv.textContent = json.member.gm_tel;
	profile5.appendChild(profile5lb);
	profile5.appendChild(profile5dv);
	parent.appendChild(profile5);
	
	const profile6 = document.createElement('button');
	profile6.textContent = '회원 정보 변경';
	profile6.addEventListener('click', (event) => {
		event.preventDefault();
		event.stopPropagation();
		
		const modal = document.getElementById('gm_infomation');
		modal.innerHTML = '';
		
		modal.appendChild(Render.getComponent('Profile-Header', '회원정보 변경'));
		modal.appendChild(Render.getComponent('Profile-Content-Update', memberProfileData.profile));
		
	});
	parent.appendChild(profile6);
	
	return parent;
});
Render.setComponent('Profile-Content-Update', (json) => {
	const parent = document.createElement('div');
	
	const imageBox = document.createElement('div');
	imageBox.id = 'member-profile-image';
	const imgT = document.createElement('img');
	imgT.id = 'profile-thumb';
	imgT.src = json.filepath;
	imageBox.appendChild(imgT);
	parent.appendChild(imageBox);
	
	/*
	display: inline-block;
	font-size: 1.5rem;
	width: 30rem;
	height: 3rem;
	line-height: 3rem;
	text-align: center;
	color: white;
	background-color: #00AA00;
	cursor: pointer;
	border-radius: 0.5rem;
	*/
	const profileUpdateBox = document.createElement('div');
	profileUpdateBox.setAttribute('style', `
	width: 30rem;
	margin: 0 auto;
	height: auto;
	display: flex;
	flex-direction: column;
	`);
	const profileUpdate = document.createElement('input');
	profileUpdate.type = 'file';
	profileUpdate.id = 'profile-update';
	profileUpdate.setAttribute('style', `
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	border: 0;
	overflow: hidden;
	`);
	profileUpdate.addEventListener('change', (event) => {
		const fileObject = event.target.files[0];
		
		const fileType = fileObject.type;
		if(!fileType.startsWith('image/')) {
			alert('이미지 파일만 업로드 가능합니다.');
			return;
		}
		
		if(fileObject) {
			const url = URL.createObjectURL(fileObject);
			const thumb = document.getElementById('profile-thumb');
			thumb.src = url;
			
			const reader = new FileReader();
			reader.onload = () => {
				const thumbText = document.getElementById('profile-update-text');
				thumbText.textContent = fileObject.name;
				
				memberProfileData.fileByte = fileObject;
			};
			reader.readAsArrayBuffer(fileObject);
		}
	});
	const profileUpdateLabel = document.createElement('label');
	profileUpdateLabel.textContent = '변경할 이미지 업로드';
	profileUpdateLabel.setAttribute('for', 'profile-update');
	profileUpdateLabel.setAttribute('style', `
	font-size: 1.5rem;
	width: 30rem;
	height: 3rem;
	line-height: 3rem;
	text-align: center;
	color: white;
	background-color: #00AA00;
	cursor: pointer;
	border-radius: 0.5rem;
	margin: 0 auto;`);
	const profileUpdateText = document.createElement('div');
	profileUpdateText.id = 'profile-update-text';
	profileUpdateText.setAttribute('style', `
	width: 30rem;
	padding-left: 0.5rem;
	border: none;
	font-size: 1.3rem;
	margin: 0 auto;
	height: 2rem;
	line-height: 2rem;
	`);
	profileUpdateBox.appendChild(profileUpdate);
	profileUpdateBox.appendChild(profileUpdateLabel);
	profileUpdateBox.appendChild(profileUpdateText);
	parent.appendChild(profileUpdateBox);
	
	const message1 = document.createElement('div');
	message1.textContent = '변경할 정보를 입력해주세요.';
	message1.style.fontSize = '2rem';
	message1.style.fontWeight = 600;
	message1.style.margin = '0 auto';
	parent.appendChild(message1);
	
	const profile = document.createElement('div');
	const profilelb = document.createElement('label');
	const profiledv = document.createElement('input');
	profilelb.textContent = '아이디';
	profiledv.id = 'info-id';
	profiledv.value = json.member.gm_id;
	profiledv.setAttribute('readonly', true);
	profile.appendChild(profilelb);
	profile.appendChild(profiledv);
	parent.appendChild(profile);
	
	const profile1 = document.createElement('div');
	const profile1lb = document.createElement('label');
	const profile1dv = document.createElement('input');
	profile1lb.textContent = '사용자';
	profile1dv.id = 'info-name';
	profile1dv.value = json.member.gm_name;
	profile1dv.setAttribute('readonly', true);
	profile1.appendChild(profile1lb);
	profile1.appendChild(profile1dv);
	parent.appendChild(profile1);

	const profile2 = document.createElement('div');
	const profile2lb = document.createElement('label');
	const profile2dv = document.createElement('input');
	profile2lb.textContent = '직급';
	profile2dv.id = 'info-level';
	profile2dv.value = json.member.gm_level;
	profile2.appendChild(profile2lb);
	profile2.appendChild(profile2dv);
	parent.appendChild(profile2);

	const profile3 = document.createElement('div');
	const profile3lb = document.createElement('label');
	const profile3dv = document.createElement('input');
	profile3lb.textContent = '이메일';
	profile3dv.id = 'info-email';
	profile3dv.value = json.member.gm_email;
	profile3.appendChild(profile3lb);
	profile3.appendChild(profile3dv);
	parent.appendChild(profile3);
	
	const profile4 = document.createElement('div');
	const profile4lb = document.createElement('label');
	const profile4dv = document.createElement('input');
	profile4lb.textContent = '전화번호';
	profile4dv.id = 'info-tel';
	profile4dv.value = json.member.gm_tel;
	profile4.appendChild(profile4lb);
	profile4.appendChild(profile4dv);
	parent.appendChild(profile4);
	
	const passwordSelector = document.createElement('div');
	passwordSelector.id = 'password-selector';
	passwordSelector.setAttribute('style', `
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	width: 100%;
	margin: 0 auto;
	gap: 1rem;
	`);
	const passwordSelectorText = document.createElement('div');
	passwordSelectorText.textContent = '비밀번호 변경하기';
	passwordSelectorText.style.border = 'none';
	passwordSelectorText.style.textAlign = 'center';
	passwordSelectorText.style.width = '30rem';
	passwordSelectorText.style.height = '3rem';
	passwordSelectorText.style.lineHeight = '3rem';	
	passwordSelectorText.style.textAlign = 'center';
	passwordSelectorText.style.color = 'white';
	passwordSelectorText.style.backgroundColor = '#00AA00';
	passwordSelectorText.style.borderRadius = '0.5rem';		
	passwordSelector.appendChild(passwordSelectorText);
	passwordSelector.addEventListener('click', () => {
		const profile5 = document.createElement('div');
		profile5.id = 'profile5';
		profile5.style.display = 'flex';
		profile5.style.width = '100%';
		profile5.style.border = 'none';
		const profile5lb = document.createElement('label');
		const profile5dv = document.createElement('input');
		profile5lb.textContent = '비밀번호';
		profile5dv.id = 'info-pwd';
		profile5dv.type = 'password';
		profile5dv.addEventListener('click', (event) => {
			event.preventDefault();
			event.stopPropagation();
		});
		profile5.appendChild(profile5lb);
		profile5.appendChild(profile5dv);
		
		const profile6 = document.createElement('div');
		profile6.id = 'profile6';
		profile6.style.display = 'flex';
		profile6.style.width = '100%';
		profile6.style.border = 'none';
		const profile6lb = document.createElement('label');
		const profile6dv = document.createElement('input');
		profile6lb.textContent = '비밀번호 확인';
		profile6dv.id = 'info-pwd-reg';
		profile6dv.type = 'password';
		profile6dv.setAttribute('data-ok', 'no');
		profile6dv.addEventListener('click', (event) => {
			event.preventDefault();
			event.stopPropagation();
		});
		profile6dv.addEventListener('change', () => {
			const pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
			if(pwdReg.test(document.getElementById('info-pwd').value)) {
				if(document.getElementById('info-pwd').value === document.getElementById('info-pwd-reg').value) {
					const pwdRegEl = document.getElementById('pwd-reg');
					pwdRegEl.style.color = '#00AA00';
					pwdRegEl.textContent = '비밀번호가 일치합니다.';
					
					const pwd = document.getElementById('info-pwd-reg');
					pwd.setAttribute('data-ok', 'ok');
					
					memberProfileData.password = document.getElementById('info-pwd-reg').value;
				} else {
					const pwdRegEl = document.getElementById('pwd-reg');
					pwdRegEl.style.color = '#DC3545';
					pwdRegEl.textContent = '비밀번호가 일치하지 않습니다.';
					
					const pwd = document.getElementById('info-pwd-reg');
					pwd.setAttribute('data-ok', 'no');
				}
			} else {
				const pwdRegEl = document.getElementById('pwd-reg');
				pwdRegEl.style.color = '#DC3545';
				pwdRegEl.textContent = '비밀번호는 영문 소문자, 숫자, 특수문자를 하나씩 포함해야 합니다.';
			}
		});
		profile6.appendChild(profile6lb);
		profile6.appendChild(profile6dv);
		
		if(memberProfileData.password === undefined) {
			passwordSelector.appendChild(profile5);
			passwordSelector.appendChild(profile6);
			memberProfileData.password = '';
		} else {
			passwordSelector.removeChild(document.getElementById('profile5'));
			passwordSelector.removeChild(document.getElementById('profile6'));
			memberProfileData.password = undefined;
		}
	});
	parent.appendChild(passwordSelector);
	
	
	
	const passwordOK = document.createElement('div');
	passwordOK.id = 'pwd-reg';
	passwordOK.style.width = '100%';
	passwordOK.style.height = '3rem';
	passwordOK.style.lineHeight = '3rem';
	passwordOK.style.paddingLeft = '0.5rem';
	passwordOK.style.fontSize = '1.3rem';
	parent.appendChild(passwordOK);
	
	
	const updateBtn = document.createElement('button');
	updateBtn.textContent = '회원정보 변경';
	updateBtn.addEventListener('click', (event) => {
		event.preventDefault();
		event.stopPropagation();
		
		let pwdServer;
		
		if(memberProfileData.password === undefined) {
			pwdServer = 'FALSE';
		} else {
			pwdServer = memberProfileData.password
		}
		
		const update = {
			gm_id:document.getElementById('info-id').value,
			gm_level:document.getElementById('info-level').value,
			gm_email:document.getElementById('info-email').value,
			gm_tel:document.getElementById('info-tel').value,
			gm_pwd:pwdServer
		}
		
		const emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		const telReg = /^0\d{1,2}-\d{3,4}-\d{4}$/;
		
		if(memberProfileData.password !== undefined) {
			if(document.getElementById('info-pwd-reg').getAttribute('data-ok') !== 'ok') {
				alert('비밀번호가 일치하지 않습니다.');
				return;
			}
		}
		
		if(update.gm_email === '') {
			alert('이메일을 입력하세요.');
			return;
		}
		
		if(update.gm_tel === '') {
			alert('전화번호를 입력하세요.');
			return;
		}
		
		if(!emailReg.test(update.gm_email)) {
			alert('올바른 이메일 형식으로 입력하세요.');
			return;
		}
		
		if(!telReg.test(update.gm_tel)) {
			alert('올바른 전화번호 형식으로 입력하세요.');
			return;
		}
		
		const formEl = new FormData();
		formEl.append('member', JSON.stringify(update));
		if(memberProfileData.fileByte !== undefined) {
			formEl.append('file', memberProfileData.fileByte);
		}
		
		fetch('/profile-update', {
			method: 'post',
			body: formEl
		})
		.catch(error => console.log(error))
		.then(response => response.json())
		.then(data => {
			alert(data.message);
			memberProfileData.fetchs = false;
		});
		
		
	})
	parent.appendChild(updateBtn);
	
	const backBtn = document.createElement('button');
	backBtn.textContent = '뒤로 가기';
	backBtn.addEventListener('click', (event) => {
		event.preventDefault();
		event.stopPropagation();
		
		if(!memberProfileData.fetchs) {
			fetch('/member-profile', {
					method: 'post',
					body: document.getElementById('profile-id').value
			})
			.then(response => response.json())
			.then(data => {
				memberProfileData.profile = data;
				memberProfileData.password = undefined;
				
				changeHTML([
					Render.getComponent('Profile-Header', '정보 관리'),
					Render.getComponent('Profile-Content', data)
				])
			})
		} else {
			changeHTML([
				Render.getComponent('Profile-Header', '정보 관리'),
				Render.getComponent('Profile-Content', memberProfileData._profile)
			]);
		}
	});
	parent.appendChild(backBtn);
	
	return parent;
});
Render.setComponent('Profile-Footer', () => {
	const parent = document.createElement('div');
	const updateBtn = document.createElement('button');
	updateBtn.id = 'profile-update';
	updateBtn.textContent = '회원 정보 변경';
	updateBtn.addEventListener('click', (event) => {
		event.preventDefault();
		event.stopPropagation();
		
		const modal = document.getElementById('gm_infomation');
		modal.innerHTML = '';
		
		modal.appendChild(Render.getComponent('Profile-Header', '회원정보 변경'));
		modal.appendChild(Render.getComponent('Profile-Content-Update', memberProfileData.profile));
		
	});
	parent.appendChild(updateBtn);
	
	return parent;
});

function changeHTML(component = []) {
	document.getElementById('gm_infomation').innerHTML = '';
	component.forEach(cp => {
		document.getElementById('gm_infomation').appendChild(cp);
	})
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
					memberProfileData.profile = data;
					memberProfileData.fetchs = true;
					changeHTML([
						infoModal.appendChild(Render.getComponent('Profile-Header', '정보 관리')),
						infoModal.appendChild(Render.getComponent('Profile-Content', memberProfileData.profile))
					])
					
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
const GMProfileUpdateEl = document.getElementById('profile-update');
if(GMProfileUpdateEl !== null) {
	GMProfileUpdateEl.addEventListener('click', (event) => {
		event.preventDefault();
		event.stopPropagation();
		
		changeHTML([Render.getComponent('Profile-Header', '회원정보 변경'),
		            Render.getComponent('Profile-Content-Update', memberProfileData.profile)]);
		
	});
}










