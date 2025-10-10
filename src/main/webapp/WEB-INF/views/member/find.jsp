<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
<title>Store Manager</title>
<style>
* { box-sizing: border-box; }
    html, body{
        width: 100vw;
        height: 100vh;
        margin: 0;
        padding: 0;
        font-size: 10px; /* 삭제하면 안됨, 1rem 은 html태그의 폰트사이즈임 // 10px => 1rem , 0.1rem => 1px */
        font-family: sans-serif;
    }
    body { 
        min-width: 130rem;
        min-height: 75rem;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    form {
    	display: contents;
    }
    /* ===== wrap ===== */
    .wrap{
        display: flex;
        width: 120rem; 
        height: 60rem;
        border-radius: 1rem; 
        box-shadow: 0.7rem 0.7rem 1rem #b3b3b3;
        overflow: hidden;
    }
    .wrap > div{
      width: 50%; height: 100%;
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
        justify-content: flex-start;
        align-items: center;
        padding: 2rem;
    }
    .right-container > div {
    	width: 100%;
    	height: 4rem;
    	display: flex;
    	align-items: center;
    	justify-content: center;
    }
    .right-container > div:first-child {
    	width: 100%;
    	height: 3rem;
    	line-height: 3rem;
    	text-align: center;
    	font-size: 2rem;
    	font-weight: 600;
    	margin-bottom: 3rem;
    }
    .right-container > div:nth-of-type(5) {
    	width: 100%;
    	height: 10rem;
    	display: flex;
    	flex-direction: column;
    	align-items: center;
    	justify-content: center;
    	gap: 1rem;
    }
    .right-container > div:nth-of-type(5) > div {
    	width: 100%;
    	display: flex;
    	align-items: center;
    	justify-content: center;
    }
    .right-container > div > label,
    .right-container > div:nth-of-type(5) > div > label {
    	width: 12rem;
    	height: 3rem;
    	line-height: 3rem;
    	text-align: center;
    	font-size: 1.3rem;
    	background-color: #00AA00;
    	color: white;
    	border-top-left-radius: 0.5rem;
    	border-bottom-left-radius: 0.5rem;
    }
    .right-container > div > input,
    .right-container > div:nth-of-type(5) > div > input {
    	width: calc(80% - 12rem);
    	height: 3rem;
    	line-height: 3rem;
    	outline: none;
    	padding-left: 0.5rem;
    	border: 1px solid rgba(33, 33, 33, 0.2);
    	border-top-right-radius: 0.5rem;
    	border-bottom-right-radius: 0.5rem;
    }
    .right-container > #profile-find-redaybtn {
    	width: calc(100% - 12rem);
    	height: 5rem;
    	justify-content: end;
    }
    #profile-find-btn {
    	padding: 0.5rem 2rem;
    	border: none;
    	background-color: #00AA00;
    	color: white;
    	border-radius: 0.5rem;
    	cursor: pointer;
    	transition: transform 0.2s ease;
    }
    #profile-find-btn:hover,
    #profile-find-call:hover {
    	transform: scale(1.05);
    }
    #profile-find-btn:active,
    #profile-find-call:active {
    	transform: scale(1);
    }
    #profile-find-runbtn {
    	width: calc(80% - 12rem);
    	height: 5rem;
    	display: flex;
    	align-items: center;
    	justify-content: end;
    }
    #profile-find-call {
    	width: 100%;
    	color: white;
    	background-color: #00AA00;
    	border: none;
    	padding: 0.5rem;
    	border-radius: 0.5rem;
    	cursor: pointer;
    	transition: transform 0.2s ease;
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
        <div id="right-container-parent">
            <div class="right-container">
            	<div>비밀번호 찾기</div>
            	<div><label for="profile-find-id">아이디</label><input type="text" id="profile-find-id" placeholder="비밀번호를 찾을 아이디를 입력하세요."></div>
            	<div><label for="profile-find-email">이메일</label><input type="text" id="profile-find-email" placeholder="비밀번호를 찾을 이메일을 입력하세요."></div>
            	<div id="profile-find-redaybtn"><button id="profile-find-btn">확인</button></div>
            	
            	<!-- 추가 -->
            	<div id="profile-find-password"></div>
            </div>
           	<div id="profile-find-runbtn"></div>
        </div>
    </div>
<script>
	document.getElementById('profile-find-btn').addEventListener('click', (e) => {
		const member = {
			gm_id:document.getElementById('profile-find-id').value,
			gm_email:document.getElementById('profile-find-email').value
		}
		
		if(member.gm_id === '') {
			alert('아이디를 입력하세요.');
			e.preventDefault();
			return;
		}
		if(member.gm_email === '') {
			alert('이메일을 입력하세요.');
			e.preventDefault();
			return;
		}
		
		fetch('/profile-find-call', {
			method:'post',
			headers: {
				'Content-Type':'application/json'
			},
			body:JSON.stringify(member)
		})
		.then(response => response.text())
		.then(data => {
			if(data === 'OK') {
				alert('변경할 비밀번호를 입력하세요.');
				profileFindCall();
			} else {
				alert('입력하신 아이디와 이메일이 일치하지 않습니다.');
			}
		});
	});
	
	function profileFindCall() {
		// 입력값 검증 이후 - 비밀번호 input
		const profileFindBox = document.getElementById('profile-find-password');
		profileFindBox.innerHTML = '';
		
		const div_1 = document.createElement('div');
		div_1.style.display = 'flex';
		div_1.style.alignItems = 'center';
		div_1.style.justifyContent = 'center';
		div_1.style.width = '100%';
		div_1.style.height = '4rem';
		div_1.style.alignItems = 'center';
		const div_1_lb = document.createElement('label');
		div_1_lb.setAttribute('for', 'profile-find-pwd');
		div_1_lb.style.width = '12rem';
		div_1_lb.style.height = '3rem';
		div_1_lb.style.lineHeight = '3rem';
		div_1_lb.style.color = 'white';
		div_1_lb.style.textAlign = 'center';
		div_1_lb.style.fontSize = '1.3rem';
		div_1_lb.style.backgroundColor = '#00AA00';
		div_1_lb.style.borderTopLeftRadius = '0.5rem';
		div_1_lb.style.borderBottomLeftRadius = '0.5rem';
		div_1_lb.textContent = '비밀번호';
		div_1.appendChild(div_1_lb);
		const div_1_in = document.createElement('input');
		div_1_in.setAttribute('style', `
		width: calc(80% - 12rem);
    	height: 3rem;
    	line-height: 3rem;
    	outline: none;
    	padding-left: 0.5rem;
    	border: 1px solid rgba(33, 33, 33, 0.2);
    	border-top-right-radius: 0.5rem;
    	border-bottom-right-radius: 0.5rem;
		`);
		div_1_in.type = 'password';
		div_1_in.id = 'profile-find-pwd';
		div_1_in.setAttribute('placeholder', '새로운 비밀번호를 입력하세요.');
		div_1.appendChild(div_1_in);
		profileFindBox.appendChild(div_1);
		
		const div_2 = document.createElement('div');
		div_2.style.display = 'flex';
		div_2.style.alignItems = 'center';
		div_2.style.justifyContent = 'center';
		div_2.style.width = '100%';
		div_2.style.height = '4rem';
		div_2.style.alignItems = 'center';
		const div_2_lb = document.createElement('label');
		div_2_lb.setAttribute('for', 'profile-find-pwdReg');
		div_2_lb.style.width = '12rem';
		div_2_lb.style.height = '3rem';
		div_2_lb.style.lineHeight = '3rem';
		div_2_lb.style.color = 'white';
		div_2_lb.style.textAlign = 'center';
		div_2_lb.style.fontSize = '1.3rem';
		div_2_lb.style.backgroundColor = '#00AA00';
		div_2_lb.style.borderTopLeftRadius = '0.5rem';
		div_2_lb.style.borderBottomLeftRadius = '0.5rem';
		div_2_lb.textContent = '비밀번호 확인';
		div_2.appendChild(div_2_lb);
		const div_2_in = document.createElement('input');
		div_2_in.setAttribute('style', `
		width: calc(80% - 12rem);
    	height: 3rem;
    	line-height: 3rem;
    	outline: none;
    	padding-left: 0.5rem;
    	border: 1px solid rgba(33, 33, 33, 0.2);
    	border-top-right-radius: 0.5rem;
    	border-bottom-right-radius: 0.5rem;
		`);
		div_2_in.type = 'password';
		div_2_in.id = 'profile-find-pwdReg';
		div_2.appendChild(div_2_in);
		profileFindBox.appendChild(div_2);
		
		// 입력값 검증 이후 - 비밀번호 변경 Button <div><button id="profile-find-call">비밀번호 변경</button></div>
		const profileContainer = document.getElementById('right-container-parent');
		const findBtnBox = document.getElementById('profile-find-call');
		
		if(findBtnBox === null || findBtnBox === undefined) {
			const rightContainer = document.getElementsByClassName('right-container')[0];
			const readyBtn = document.getElementById('profile-find-redaybtn');
			rightContainer.removeChild(readyBtn);
			
			profileFindBox.style.width = '100%';
			profileFindBox.style.height = 'auto';
			profileFindBox.style.display = 'flex';
			profileFindBox.style.flexDirection = 'column';
			
			const div_3 = document.getElementById('profile-find-runbtn');
			const findBtn = document.createElement('button');
			findBtn.textContent = '비밀번호 변경';
			findBtn.id = 'profile-find-call';
			findBtn.addEventListener('click', () => {
				const target = {
					gm_id:document.getElementById('profile-find-id').value,
					gm_email:document.getElementById('profile-find-email').value,
					gm_pwd:document.getElementById('profile-find-pwdReg').value
				}
				
				fetch('/profile-find', {
					method:'post',
					headers: {
						'Content-Type':'application/json'
					},
					body:JSON.stringify(target)
				})
				.then(response => response.text())
				.then(data => {
					if(data === 'OK') {
						alert('비밀번호가 변경되었습니다.');
						window.location.href = '/';
					} else {
						alert('알 수 없는 이유로 비밀번호 변경에 실패하였습니다.');
					}
				});
			});
			div_3.appendChild(findBtn);
			profileContainer.appendChild(div_3);
		} else {
			return;
		}	
	}
</script>
</body>
</html>