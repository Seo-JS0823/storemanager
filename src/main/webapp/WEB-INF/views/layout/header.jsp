<<<<<<< HEAD
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
<div id="gm_infomation"></div>















=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) session.getAttribute("name");
	String level = (String) session.getAttribute("level");
	String email = (String) session.getAttribute("email");
	String regDate = (String) session.getAttribute("regdate");
%>
<div>
	<div class="header">
		<div>(주)싱싱유통</div>
		<div>
			<div id="gm_name"><%=name %> <%=level %></div>
			<button id="infomation" class="material-symbols-outlined">settings</button>
			<button id="logout" class="material-symbols-outlined">logout</button>
		</div>
	</div>
</div>
<!-- member infomation modal -->
<div id="gm_infomation">
	<!-- 직원 정보 부분 -->
	<div>
		<button id="infomation-close">닫 기</button>
		<span style="font-weight: 600">정보 관리</span>
	</div>
	<!-- 사용자 프로필 -->
	<div>
		<div><img src="/img/test-image008.jpg"/></div>
		<div><label>사용자</label><div><%=name %></div></div>
		<div><label>직급</label><div><%=level %></div></div>
		<div><label>이메일</label><div id="info-email">이메일</div></div>
		<div><label>입사일</label><div id="info-regdate">입사일</div></div>
		<div><label>전화번호</label><div id="info-tel">010-0000-0000</div></div>
	</div>
</div>















>>>>>>> fe880323677131d19633a252e168557fc548128b
