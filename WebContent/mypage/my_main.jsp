<%@page import="prjdata.QuizUserDTO"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="prjbean.MainProc"></jsp:useBean>
<jsp:useBean id="dto" class="prjdata.QuizUserDTO"></jsp:useBean>

<%
	dto = dao.getUser(request, (String)request.getSession().getAttribute("logged"));
%>
	<strong style="font-size:100px; color:indianred; font-weight:1000;"> ** QUIZ BOOK ȸ�� ���� ** </strong>
	<br/><br/><br/><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:steelblue;">ID</strong></div>
		<div style="flex:1"></div>
		<div style="flex:4"><label style="color:darkcyan;"><%=session.getAttribute("logged")%></label></div>
		<div style="flex:4"></div>
	</div><br/>
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:steelblue;">NAME</strong></div>
		<div style="flex:1"></div>
		<div style="flex:4"><label style="color:darkcyan;"><%=dto.getUser_Name()%></label></div>
		<div style="flex:4"></div>
	</div><br/>
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:steelblue;">EMAIL</strong></div>
		<div style="flex:1"></div>
		<div style="flex:4"><label style="color:maroon;"><%=dto.getUser_Email()%></label></div>
		<div style="flex:4"></div>
	</div><br/>
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:steelblue;">PHONE</strong></div>
		<div style="flex:1"></div>
		<div style="flex:4"><label style="color:maroon;"><%=dto.getUser_Phone_Number()%></label></div>
		<div style="flex:4"></div>
	</div><br/>
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:steelblue;">ADDRESS</strong></div>
		<div style="flex:1"></div>
		<div style="flex:4"><label style="color:maroon;"><%=dto.getUser_Address()%></label></div>
		<div style="flex:4"></div>
	</div><br/>
	<form method="post" action="javascript:parent.fnPageMove('mypage/my_main_proc.jsp')">
		<div style="display:flex;">
			<div style="flex:1"><strong style="font-size:18px; color:darkblue;">�� ȹ�� ����Ʈ</strong></div>
			<div style="flex:1"></div>
			<div style="flex:4"><label style="color:midnightblue;"><%=dto.getUser_Total_Point()%></label></div>
			<div style="flex:4"><button type="submit"><strong style="font-size:13px; color:red;">���� ���� ����</strong></button></div>
		</div><br/>
	</form>
	<form method="post" action="javascript:parent.fnPageMove('mypage/my_main_proc.jsp')">
		<div style="display:flex;">
			<div style="flex:1"><strong style="font-size:18px; color:darkblue;">����� ����Ʈ</strong></div>
			<div style="flex:1"></div>
			<div style="flex:4"><label style="color:midnightblue;"><%=dto.getUser_Total_Point() - dto.getUser_Current_Point()%></label></div>
			<div style="flex:4"><button type="submit"><strong style="font-size:13px; color:red;">���� ���� �丮</strong></button></div>
		</div><br/>
	</form>
	<form method="post" action="javascript:parent.fnPageMove('mypage/my_main_proc.jsp')">
		<div style="display:flex;">
			<div style="flex:1"><strong style="font-size:18px; color:darkblue;">���� ����Ʈ</strong></div>
			<div style="flex:1"></div>
			<div style="flex:4"><label style="color:midnightblue;"><%=dto.getUser_Current_Point()%></label></div>
			<div style="flex:4"><button type="submit"><strong style="font-size:13px; color:red;">���� ���� ��ȸ</strong></button></div>
		</div><br/>
	</form>
</body>
</html>