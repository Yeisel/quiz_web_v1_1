<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dao" class="prjbean.MainProc"></jsp:useBean>
<jsp:useBean id="dto" class="prjdata.QuizUserDTO"></jsp:useBean>

<%
	dto = dao.getUser(request, (String)request.getSession().getAttribute("logged"));
%>

<strong style="font-size:80px; color:indianred; font-weight:1000;"> ** 개인 정보 변경 ** </strong>
<br/><br/><br/><br/>

<form method="post" action="replace_user_proc.jsp">
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">ID</strong></div>
		<div style="flex:4"><input type="text" style="background-color:plum;" name="user_Id" id="user_Id" readonly="readonly" value="<%=session.getAttribute("logged")%>"/></div>
		<div style="flex:5" id="corrId"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">PASSWORD1</strong></div>
		<div style="flex:4"><input type="password" style="width:100;" name="user_Password" id="user_Password" required="required" value="<%=dto.getUser_Password()%>"/></div>
		<div style="flex:5"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">PASSWORD2</strong></div>
		<div style="flex:4"><input type="password" style="width:100;" name="pass_confirm" id="pass_confirm" required="required" value="<%=dto.getUser_Password()%>"/></div>
		<div style="flex:5"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">NAME</strong></div>
		<div style="flex:4"><input type="text" style="background-color:plum; width:100px;" name="user_Name" id="user_Name" readonly="readonly" value="<%=dto.getUser_Name()%>"/></div>
		<div style="flex:5"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">E-MAIL</strong></div>
		<div style="flex:4"><input type="email" class="form-control" style="width:100;" name="user_Email" id="user_Email" required="required" value="<%=dto.getUser_Email()%>"/></div>
		<div style="flex:5"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">PHONE</strong></div>
		<div style="flex:4"><input type="text" style="width:100;" name="user_Phone_Number" id="user_Phone_Number" required="required" value="<%=dto.getUser_Phone_Number()%>"/></div>
		<div style="flex:5"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">ADDRESS</strong></div>
		<div style="flex:8"><input type="text" style="width:100;" name="user_Address" id="user_Address" required="required" value="<%=dto.getUser_Address()%>"/></div>
		<div style="flex:1"></div>
	</div>
	<br/><br/><br/>
	<button type="submit"><strong style="font-size:13px; color:red;">변경하기</strong></button>
</form>
</body>
</html>