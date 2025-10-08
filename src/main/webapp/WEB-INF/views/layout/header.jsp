<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String) session.getAttribute("gm_id");
	String name = (String) session.getAttribute("gm_name");
	String level = (String) session.getAttribute("gm_level");
%>
<div>
	<div class="header">
		<div>(주)싱싱유통</div>
		<div>
			<div id="gm_name"></div>
			<input id="profile-id" type="hidden" value="<%=id %>"/>
			<button id="infomation" class="material-symbols-outlined">settings</button>
			<button id="logout" class="material-symbols-outlined">logout</button>
		</div>
	</div>
</div>
<!-- member infomation modal -->
<div id="gm_infomation">
<!--
	<div>
		<button id="infomation-close">닫 기</button>
		<span style="font-weight: 600">정보 관리</span>
	</div>
	<div>
		<div id="member-profile-image"></div>
		<div><label>아이디</label><div id="info-id"></div></div>
		<div><label>사용자</label><div id="info-name"></div></div>
		<div><label>직급</label><div id="info-level"></div></div>
		<div><label>이메일</label><div id="info-email"></div></div>
		<div><label>입사일</label><div id="info-regdate"></div></div>
		<div><label>전화번호</label><div id="info-tel"></div></div>
		<button id="profile-update">회원 정보 변경</button>
	</div>
 -->
</div>















