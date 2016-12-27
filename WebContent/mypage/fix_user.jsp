<%@page import="prjdata.QuizUserDTO"%>
<%@page import="prjbean.MainProc"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=UTF-8");%>

<%
	MainProc dao = new MainProc();
	QuizUserDTO dto = (QuizUserDTO)dao.getUser(request, request.getParameter("user_Id"));
%>
<strong style="font-size:100px; color:indianred; font-weight:1000;"> ** 회원 관리 ** </strong>
<br/><br/>
<form method="post" action="javascript:parent.fnPageMove('mypage/fix_user.jsp', '#user_Id')">
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">ID 검색</strong></div>
		<div style="flex:4"><input type="text" name="user_Id" id="user_Id" placeholder="ID"/></div>
		<div style="flex:5"><button type="submit">GO</button></div>
	</div><br/><br/>
</form>

<table class="table table-bordered">
	<tr style="background-color:crimson;">
	  	<td><strong style="font-size:15px; color:black;">ID</strong></td>
	  	<td><strong style="font-size:15px; color:black;">이름</strong></td>
	  	<td><strong style="font-size:15px; color:black;">주소</strong></td>
	  	<td><strong style="font-size:15px; color:black;">총 포인트</strong></td>
	</tr>
	<tr>
<%
	if(dto != null){
%>
		<td><strong style="font-size:15px; color:black;"><%=dto.getUser_Id()%></strong></td>
		<td><strong style="font-size:15px; color:black;"><%=dto.getUser_Name()%></strong></td>
		<td><strong style="font-size:15px; color:black;"><%=dto.getUser_Address()%></strong></td>
		<td><strong style="font-size:15px; color:black;"><%=dto.getUser_Total_Point()%></strong></td>
<%
	}
	else{
%>
		<td><strong style="font-size:15px; color:black;"></strong></td>
		<td><strong style="font-size:15px; color:black;"></strong></td>
		<td><strong style="font-size:15px; color:black;"></strong></td>
		<td><strong style="font-size:15px; color:black;"></strong></td>
<%
	}
%>
	</tr>
</table>
<form method="post" action="javascript:parent.fnPageMove('mypage/fix_user.jsp', '#user_Id')">
	<input type="hidden" name="user_Id" id="user_Id" value="<%=dto.getUser_Id()%>"/>
	<div style="display:flex;">
		<div style="flex:5"></div>
		<div style="flex:4"></div>
		<div style="flex:1"><button type="submit">회원 삭제</button></div>
	</div><br/><br/>
</form>
</body>
</html>