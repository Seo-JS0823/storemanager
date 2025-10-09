<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
    <title>Welcome</title>
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
        width: 90rem; 
        height: 45rem;
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
        justify-content: center;
        align-items: center;
        gap: 3rem;
        padding-top: 2rem;
    }
    .right-container > div:first-child {
        width: 100%;
        height: auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 1rem;
    }
    .right-container > div:last-child {
        font-size: 1.3rem;
    }
    .input-style {
        width: 30rem;
        height: 3.5rem;
        padding: 0 1rem;
        border: 0.1rem solid #a6a6a6;
        border-radius: 0.4rem;
    }
    .right-container > div:nth-child(2) > button:first-child { background-color: #99ff99; color:#00AA00; }
    .right-container > div:nth-child(2) > button:last-child { background-color: #00AA00; color:white; }
    button{
        display: inline-block;
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
                <form id="login-form">
                   <div><input class="input-style" id="id" name="gm_id" type="text" placeholder="ID"></div>
                   <div><input class="input-style" id="pwd" name="gm_pwd" type="password" placeholder="Password"></div>
                </form>
                </div>
                <div>
                    <button id="member-login">로 그 인</button>
                </div>
                <div>회원 가입 전이신가요?&nbsp;&nbsp;<a href="/joinV">회원가입</a></div>
            </div>
        </div>
    </div>
<script>
	const login = document.getElementById('member-login');
	login.addEventListener('click', (event) => {
		const id = document.getElementById('id').value;
		const pwd = document.getElementById('pwd').value;
		if(id === '') {
			event.preventDefault();
			alert('아이디를 입력하세요.');
			return;
		}
		if(pwd === '') {
			event.preventDefault();
			alert('비밀번호를 입력하세요.');
			return;
		}
		
		const formEl = document.getElementById('login-form');
		formEl.action = '/login';
		formEl.method = 'POST';
		formEl.submit();
	});
</script>
</body>
</html>