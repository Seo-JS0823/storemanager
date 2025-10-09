<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
  <title>Store Manager</title>
<style>
* {
	box-sizing: border-box;
}
html {
	font-size: 10px;
	font-family: sans-serif;
}
body {
	padding: 0;
	margin: 0;
	width: 100vw;
	height: 100vh;
	display: flex;
    justify-content: center;
    align-items: center;
}
form {
	display: contents;
}
a {
	text-decoration: none;
	color: black;
}
p {
	margin: 0;
	padding: 0;
	font-size: 1.3rem;
}
	.wrap{
        display: flex;
        width: 120rem; 
        height: 80rem;
        border-radius: 1rem; 
        box-shadow: 0.7rem 0.7rem 1rem #b3b3b3;
        overflow: hidden;
    }
    .wrap > div:first-child {
      width: 40%; height: 100%;
    }
    .wrap > div:last-child {
      width: 60%; height: 100%;
    }
    /* Left side wrap */
    .wrap > div:nth-child(1){
        padding: 0 1.5rem;
        background-color: #00A000;
        font-size: 1.3rem;
        color: white;
    }
    /* Right side wrap */
    .wrap > div:nth-child(2){
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        background-color: white;
    }
    /* ===== Left side 3x3 ===== */
    .left-container{
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        grid-template-rows: 1fr 1fr 1fr;
        height: 80%;
        margin: 0 2rem;
        gap: 1rem;
        align-items: center;
    }
    .left-container > div{text-align: center; font-size: 4rem; color: white;}
    .right-container {
        width: 90%;
        height: 60%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 1rem;
        padding-top: 2rem;
    }
    .right-container > div:nth-of-type(1) {
        width: 100%;
        height: auto;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .right-container > div:nth-of-type(2) {
        font-size: 1.3rem;
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 0.5rem;
    }
    .input-style {
        width: 30rem;
        height: 3.5rem;
        padding: 0 1rem;
        border: 0.1rem solid #a6a6a6;
        border-radius: 0.4rem;
    }
    .right-container > div:nth-of-type(2) > button:first-child { background-color: #99ff99; color:#00AA00; }
    .right-container > div:nth-of-type(2) > button:last-child { background-color: #00AA00; color:white; }
    button {
        width: 25rem;
        height: 3.5rem;
        margin: 0 1.3rem;
        border: none;
        border-radius: 0.4rem;
        color: white;
        font-size: 1.3rem;
        font-weight: 560;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
    }
    #join {text-decoration: none; text-decoration-color: #00AA00; cursor: pointer;}
    
    .right-container .validate {
    	width: 30rem;
    	height: auto;
    	display: flex;
    	justify-content: flex-start;
    	padding-left: 0.5rem;
    }
    .validate div:nth-of-type(1) {
    	width: 10rem;
    	height: auto;
    	font-size: 1.5rem;
    	font-weight: 600;
    }
    
    .right-container .reg {
    	width: 30rem;
    	height: 1.5rem;
    	text-align: left;
    	padding-left: 0.5rem;
    }
    
    .input-file {
    	position: absolute;
		width: 0;
		height: 0;
		padding: 0;
		overflow: hidden;
		border: 0;
    }
    
    .file-label {
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
    }
    
    .image-alflqhrl {
    	width: 15rem;
    	height: 15rem;
    	border: 2px solid rgba(33, 33, 33, 0.2);
    	border-radius: 50%;
    	display: flex;
    	align-items: center;
    	justify-content: center;
    }
    .image-alflqhrl img {
    	border-radius: 50%;
    	object-fit: cover;
    }
/* Join Modal */
#join-modal {
	
}
</style>
</head>
<body>
    <div class="wrap">
        <!--Left side -->
        <div>
            <div class="left-container">
                <div class="material-symbols">playlist_add</div>
                <div></div>
                <div></div>
                <div class="material-symbols">list_alt</div>
                <div></div>
                <div class="material-symbols">receipt_long</div>
                <div class="material-symbols">playlist_remove</div>
                <div></div>
                <div></div>
            </div><br><br>
            <div>Connect with every application.</div>
            <div>Everything you need in and easily customizable dashboard.</div>
        </div>
        <!--Right side -->
        <div>
            <div class="right-container">
                <div>
                   <div class="image-alflqhrl" id="thumb"></div>
                   <div class="validate"><div>사진 업로드</div></div>
                   <div><input class="input-file" id="member-image" type="file"><label for="member-image" class="file-label">이미지 선택</label></div>
                   <div class="reg" id="image-reg"></div>
                   
                   <div class="validate"><div>이름</div></div>
                   <div><input class="input-style" id="member-name" type="text"></div>
                   <div class="reg"></div>
                   
                   <div class="validate"><div>직급</div></div>
                   <div><input class="input-style" id="member-level" type="text"></div>
                   <div class="reg"></div>
                   
                   <div class="validate"><div>전화번호</div></div>
                   <div><input class="input-style" id="member-tel" type="text"></div>
                   <div class="reg" id="tel-reg"></div>
                   
                   <div class="validate"><div>이메일</div></div>
                   <div><input class="input-style" id="member-email" type="text"></div>
                   <div class="reg" id="email-reg"></div>
                   
                   <div class="validate"><div>아이디</div></div>
                   <div><input class="input-style" id="member-id" type="text"></div>
                   <div class="reg" id="id-reg"></div>
                   
                   <div class="validate"><div>패스워드</div></div>
                   <div><input class="input-style" id="member-pwd" type="password"></div>
                   <div class="reg" id="pwd-reg"></div>
                   
                </div>
                <div>
                    <button id="join-btn">회 원 가 입</button>
                    <button id="back-btn">뒤 로 가 기</button>
                </div>
            </div>
        </div>
    </div>
<script>
	const joinB = document.getElementById('join-btn');
	
	let idValidate = null;
	let levelValidate = null;
	let pwdValidate = null;
	let nameValidate = null;
	let telValidate = null;
	let emailValidate = null;
	let imageValidate = null;
	
	joinB.addEventListener('click', (event) => {
		if(idValidate && pwdValidate && nameValidate && telValidate && emailValidate && levelValidate && imageValidate) {
			
			const member = {
				gm_id : idValidate,
				gm_level : levelValidate,
				gm_pwd : pwdValidate,
				gm_name : nameValidate,
				gm_tel : telValidate,
				gm_email : emailValidate
			}
			
			const formData = new FormData();
			formData.append('gm_image', imageValidate);
			formData.append('member', JSON.stringify(member));
			
			fetch('/join', {
				method: 'post',
				body: formData
			})
			.then(response => response.json())
			.then(data => {
				alert(data.message);
				window.location.href = data.redirectUrl;
			})
			
		} else {
			event.preventDefault();
			alert('입력한 값이 올바르지 않습니다.');
			return;
		}
	});
	
	const memberimage = document.querySelector('[id=member-image]');
	memberimage.addEventListener('change', (e) => {
		const fileObject = e.target.files[0];
		
		const fileType = fileObject.type;
		if(!fileType.startsWith('image/')) {
			alert('이미지 파일만 업로드 가능합니다.');
			imageValidate = null;
			return;
		}
		
		if(fileObject) {
			const url = URL.createObjectURL(fileObject);
			const img = document.createElement('img');
			img.src = url;
			img.style.width = '100%';
			img.style.height = '100%';
			
			const thumb = document.getElementById('thumb');
			thumb.innerHTML = '';
			thumb.appendChild(img);
			
			img.onload = () => URL.revokeObjectURL(url);
			
			const reader = new FileReader();
			
			reader.onload = () => {
				imageValidate = fileObject;
				
				const image = document.getElementById('image-reg');
				image.textContent = fileObject.name;
			}
			
			reader.readAsArrayBuffer(fileObject);
		}
	})
	
	const membername = document.getElementById('member-name');
	membername.addEventListener('change', () => {
		if(membername.value === '') {
			nameValidate = null;
			return;
		}
		
		if(membername.value.length > 1) {
			nameValidate = membername.value;
			membername.name = 'gm_name';
		}
	});
	
	const memberlevel = document.getElementById('member-level');
	memberlevel.addEventListener('change', () => {
		if(memberlevel.value === '') {
			levelValidate = null;
			return;
		}
		
		if(memberlevel.value.length > 1) {
			levelValidate = memberlevel.value;
			memberlevel.name = 'gm_level';
		}
	})
	
	const memberemail = document.getElementById('member-email');
	memberemail.addEventListener('change', () => {
		const email = document.getElementById('email-reg');		
		const emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		
		if(memberemail.value === '') {
			email.textContent = '';
			emailValidate = null;
			return;
		}
		
		if(!emailReg.test(memberemail.value)) {
			email.style.color = '#DC3545';
			email.textContent = '올바른 이메일 형식으로 입력하세요.';
			emailValidate = null;
		} else {
			email.style.color = '#00AA00';
			email.textContent = '✔';
			emailValidate = memberemail.value;
			memberemail.name = 'gm_email';
		}
	});
	
	const membertel = document.getElementById('member-tel');
	membertel.addEventListener('change', () => {
		const tel = document.getElementById('tel-reg');
		const telReg = /^0\d{1,2}-\d{3,4}-\d{4}$/;
		
		if(membertel.value === '') {
			tel.textContent = '';
			telValidate = null;
			return;
		}
		
		if(!telReg.test(membertel.value)) {
			tel.style.color = '#DC3545';
			tel.textContent = '올바른 전화번호 형식이 아닙니다.';
			telValidate = null;
		} else {
			tel.style.color = '#00AA00';
			tel.textContent = '✔';
			telValidate = membertel.value;
			membertel.name = 'gm_tel';
		}
	});
	
	const memberpwd = document.getElementById('member-pwd');
	memberpwd.addEventListener('change', () => {
		const pwd = document.getElementById('pwd-reg');
		const pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		
		if(memberpwd.value === '') {
			pwd.textContent = '';
			pwdValidate = null;
			return;
		}
		
		if(!pwdReg.test(memberpwd.value)) {
			pwd.style.color = '#DC3545';
			pwd.textContent = '영문 소문자, 숫자, 특수기호를 하나씩 포함해야 합니다.';
			pwdValidate = null;
		} else {
			pwd.style.color = '#00AA00';
			pwd.textContent = '사용가능한 비밀번호 입니다.';
			pwdValidate = memberpwd.value;
			memberpwd.name = 'gm_pwd';
		}
	});
	
	const memberid = document.getElementById('member-id');
	memberid.addEventListener('change', () => {
		const idReg = /^[a-z0-9]{8,}$/;
		if(idReg.test(memberid.value)) {
			fetch('/api/member', {
				method: 'post',
				headers: {
					'Content-Type': 'application/json'
				},
				body: memberid.value
			})
			.catch(error => console.log(error))
			.then(response => response.text())
			.then(data => {
				if(data === 'false') {
					const idReg = document.getElementById('id-reg');
					idReg.style.color = '#DC3545';
					idReg.textContent = '이미 존재하는 아이디입니다.';
				} else if(data === 'true') {
					const idReg = document.getElementById('id-reg');
					idReg.style.color = '#00AA00';
					idReg.textContent = '사용가능한 아이디입니다.';
					idValidate = memberid.value;
					memberid.name = 'gm_id';
				}
			});
		} else if(memberid.value === '') {
			const idReg = document.getElementById('id-reg');
			idReg.textContent = '';
			idValidate = null;
		} else if(memberid.value.length < 8) {
			const idReg = document.getElementById('id-reg');
			idReg.style.color = '#DC3545';
			idReg.textContent = '아이디는 8글자 이상이어야 합니다.';
		} else {
			const idReg = document.getElementById('id-reg');
			idReg.style.color = '#DC3545';
			idReg.textContent = '아이디에 한글과 특수문자를 사용할 수 없습니다.';
		}
	});
	
	const backB = document.getElementById('back-btn');
	backB.addEventListener('click', () => {
		const formEl = document.createElement('form');
		formEl.action = '/';
		formEl.method = 'get';
		document.body.appendChild(formEl);
		formEl.submit();
	});
</script>
</body>
</html>

















=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
  <title>Store Manager</title>
<style>
* {
	box-sizing: border-box;
}
html {
	font-size: 10px;
	font-family: sans-serif;
}
body {
	padding: 0;
	margin: 0;
	width: 100vw;
	height: 100vh;
}
form {
	display: contents;
}
a {
	text-decoration: none;
	color: black;
}
.join-container {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}
.join-box {
	width: 50rem;
	height: auto;
	border-radius: 2rem;
	box-shadow: 0 0 10px rgba(33, 33, 33, 0.25);
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 2rem;
	gap: 2rem;
	user-select: none;
}
.join-box > div:nth-of-type(1) {
	width: 90%;
	height: auto;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 2.5rem;
	padding-bottom: 0.5rem;
	border-bottom: 2px solid rgba(33, 33, 33, 0.2);
}
.join-box > div:nth-of-type(2) {
	width: 90%;
	height: auto;
	padding-top: 1rem;
	padding-bottom: 1rem;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.join-box > div:nth-of-type(2) div {
	width: 100%;
	padding-left: 1rem;
	margin-right: auto;
	font-size: 1.5rem;
	font-weight: 600;
	font-family: sans-serif;
	color: black;
}
.join-box > div:nth-of-type(2) div span:nth-of-type(1) {
	display: inline-block;
	width: 8rem;
}
.join-box > div:nth-of-type(2) div span:nth-of-type(2) {
	display: inline-block;
	width: calc(100% - 10rem);
	font-size: 1.2rem;
}
.join-box > div:nth-of-type(2) input[type=text],
.join-box > div:nth-of-type(2) input[type=password],
.join-box > div:nth-of-type(2) > button {
	width: 100%;
	height: 4rem;
	font-size: 1.5rem;
	padding-left: 0.5rem;
	border: 1px solid rgba(33, 33, 33, 0.2);
	border-radius: 0.5rem;
	outline: none;
	margin-bottom: 2rem;
}
.join-box > div:nth-of-type(2) > button {
	border: none;
	background-color: #00AA00;
	color: white;
	font-size: 1.8rem;
	cursor: pointer;
}
.join-box > div:nth-of-type(2) > button:hover {
	transform: scale(1.03);
}
.join-box > div:nth-of-type(2) > button:active {
	transform: scale(1);	
}
</style>
</head>
<body>
	<div class="join-container">
		<div class="join-box">
			<div>회 원 가 입(직원)</div>
			<div>
			<form id="join-form">
				<div><span>이 름</span></div>
				<input type="text" id="member-name">
				<div><span>직급</span></div>
				<input type="text" id="member-level">
				<div><span>아이디</span><span id="id-reg"></span></div>
				<input type="text" id="member-id">
				<div><span>비밀번호</span><span id="pwd-reg"></span></div>
				<input type="password" id="member-pwd">
				<div><span>전화번호</span><span id="tel-reg"></span></div>
				<input type="text" id="member-tel">
				<div><span>이메일</span><span id="email-reg"></span></div>
				<input type="text" id="member-email">
			</form>
				<button id="join-btn">회 원 가 입</button>
				<button id="back-btn">뒤 로 가 기</button>
			</div>
		</div>
	</div>
<script>
	const joinB = document.getElementById('join-btn');
	
	let idValidate = false;
	let levelValidate = false;
	let pwdValidate = false;
	let nameValidate = false;
	let telValidate = false;
	let emailValidate = false;
	
	joinB.addEventListener('click', (event) => {
		if(idValidate && pwdValidate && nameValidate && telValidate && emailValidate) {
			const formEl = document.getElementById('join-form');
			formEl.action = '/join';
			formEl.method = 'post';
			formEl.submit();
		} else {
			event.preventDefault();
			alert('입력한 값이 올바르지 않습니다.');
			return;
		}
	});
	
	const membername = document.getElementById('member-name');
	membername.addEventListener('change', () => {
		if(membername.value === '') {
			nameValidate = false;
			return;
		}
		
		if(membername.value.length > 1) {
			nameValidate = true;
			membername.name = 'gm_name';
		}
	});
	
	const memberlevel = document.getElementById('member-level');
	memberlevel.addEventListener('click', () => {
		if(memberlevel.value === '') {
			levelValidate = false;
			return;
		}
		
		if(memberlevel.value.length > 1) {
			levelValidate = true;
			memberlevel.name = 'gm_level';
		}
	})
	
	const memberemail = document.getElementById('member-email');
	memberemail.addEventListener('change', () => {
		const email = document.getElementById('email-reg');		
		const emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		
		if(memberemail.value === '') {
			email.textContent = '';
			emailValidate = false;
			return;
		}
		
		if(!emailReg.test(memberemail.value)) {
			email.style.color = '#DC3545';
			email.textContent = '올바른 이메일 형식으로 입력하세요.';
		} else {
			email.style.color = '#00AA00';
			email.textContent = '✔';
			emailValidate = true;
			memberemail.name = 'gm_email';
		}
	});
	
	const membertel = document.getElementById('member-tel');
	membertel.addEventListener('change', () => {
		const tel = document.getElementById('tel-reg');
		const telReg = /^0\d{1,2}-\d{3,4}-\d{4}$/;
		
		if(membertel.value === '') {
			tel.textContent = '';
			telValidate = false;
			return;
		}
		
		if(!telReg.test(membertel.value)) {
			tel.style.color = '#DC3545';
			tel.textContent = '올바른 전화번호 형식이 아닙니다.';
		} else {
			tel.style.color = '#00AA00';
			tel.textContent = '✔';
			telValidate = true;
			membertel.name = 'gm_tel';
		}
	});
	
	const memberpwd = document.getElementById('member-pwd');
	memberpwd.addEventListener('change', () => {
		const pwd = document.getElementById('pwd-reg');
		const pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		
		if(memberpwd.value === '') {
			pwd.textContent = '';
			pwdValidate = false;
			return;
		}
		
		if(!pwdReg.test(memberpwd.value)) {
			pwd.style.color = '#DC3545';
			pwd.textContent = '영문 소문자, 숫자, 특수기호를 하나씩 포함해야 합니다.';
		} else {
			pwd.style.color = '#00AA00';
			pwd.textContent = '사용가능한 비밀번호 입니다.';
			pwdValidate = true;
			memberpwd.name = 'gm_pwd';
		}
	});
	
	const memberid = document.getElementById('member-id');
	memberid.addEventListener('change', () => {
		const idReg = /^[a-z0-9]{8,}$/;
		if(idReg.test(memberid.value)) {
			fetch('/api/member', {
				method: 'post',
				headers: {
					'Content-Type': 'application/json'
				},
				body: memberid.value
			})
			.catch(error => console.log(error))
			.then(response => response.text())
			.then(data => {
				if(data === 'false') {
					const idReg = document.getElementById('id-reg');
					idReg.style.color = '#DC3545';
					idReg.textContent = '이미 존재하는 아이디입니다.';
				} else if(data === 'true') {
					const idReg = document.getElementById('id-reg');
					idReg.style.color = '#00AA00';
					idReg.textContent = '사용가능한 아이디입니다.';
					idValidate = true;
					memberid.name = 'gm_id';
				}
			});
		} else if(memberid.value === '') {
			const idReg = document.getElementById('id-reg');
			idReg.textContent = '';
			idValidate = false;
		} else if(memberid.value.length < 8) {
			const idReg = document.getElementById('id-reg');
			idReg.style.color = '#DC3545';
			idReg.textContent = '아이디는 8글자 이상이어야 합니다.';
		} else {
			const idReg = document.getElementById('id-reg');
			idReg.style.color = '#DC3545';
			idReg.textContent = '아이디에 한글과 특수문자를 사용할 수 없습니다.';
		}
	});
	
	const backB = document.getElementById('back-btn');
	backB.addEventListener('click', () => {
		const formEl = document.getElementById('join-form');
		formEl.action = '/';
		formEl.method = 'get';
		formEl.submit();
	});
</script>
</body>
</html>

















>>>>>>> fe880323677131d19633a252e168557fc548128b
