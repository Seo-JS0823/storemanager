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
	height: 60rem;
	border-radius: 2rem;
	box-shadow: 0 0 10px rgba(33, 33, 33, 0.25);
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 2rem;
	padding-bottom: 2rem;
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
			<div>회 원 가 입</div>
			<div>
			<form id="join-form">
				<div>이 름</div>
				<input type="text" id="member-name">
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
			</div>
		</div>
	</div>
<script>
	const joinB = document.getElementById('join-btn');
	joinB.addEventListener('click', (event) => {
		const name = document.getElementById('member-name');
		const id = document.getElementById('member-id');
		const pwd = document.getElementById('member-pwd');
		const tel = document.getElementById('member-tel');
		const email = document.getElementById('member-email');
		
		name.name = 'gm_name';
		id.name = 'gm_id';
		pwd.name = 'gm_pwd';
		tel.name = 'gm_tel';
		email.name = 'gm_email';
		
		const validata = {
			name:name.value,
			id:id.value,
			pwd:pwd.value,
			tel:tel.value,
			email:email.value
		}
		/* 빈 값 + 정규식 검증 */
		if(joinValidation(validata)) {
			const formEl = document.getElementById('join-form');
			formEl.action = '/join';
			formEl.method = 'post';
			formEl.submit();
		}
	});
	
	function joinValidation(data) {
		const emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		const telReg = /^0\d{1,2}-\d{3,4}-\d{4}$/;
		if(data.name === '') {
			alert('이름을 입력하세요.')
			return false;
		}
		if(data.id === '') {
			alert('아이디를 입력하세요.');
			return false;
		}
		if(data.pwd === '') {
			alert('비밀번호를 입력하세요.');
			return false;
		}
		if(data.tel === '') {
			alert('전화번호를 입력하세요.')
			return false;
		}
		if(!telReg.test(data.tel)) {
			alert('올바른 형식의 전화번호를 입력하세요.');
			return false;
		}
		if(data.email === '') {
			alert('이메일을 입력하세요.')
			return false;
		}
		if(!emailReg.test(data.email)) {
			alert('올바른 형식의 이메일로 입력하세요.');
			return false;
		}
		return true;
	}
</script>
</body>
</html>

















