<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String) session.getAttribute("gm_id");
	String name = (String) session.getAttribute("gm_name");
	String level = (String) session.getAttribute("gm_level");
%>
<div>
	<div class="header">
		<div>(주) 부성</div>
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