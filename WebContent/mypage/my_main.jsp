<%@page import="prjdata.QuizUserDTO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script>
	function fnPopup(url, window_name){
		window.open(url, window_name, "width=800, height=600, left=500, top=200");
	}
</script>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dao" class="prjbean.MainProc"></jsp:useBean>
<jsp:useBean id="dto" class="prjdata.QuizUserDTO"></jsp:useBean>

<%
	dto = dao.getUser(request, (String)request.getSession().getAttribute("logged"));
%>
	<strong style="font-size:100px; color:indianred; font-weight:1000;"> ** QUIZ BOOK 회원 정보 ** </strong>
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
	<form method="post" action="javascript:parent.fnPageMove('mypage/my_main.jsp')">
		<div style="display:flex;">
			<input type="hidden" name="user_Id" value="<%=session.getAttribute("logged")%>"/>
			<div style="flex:1"><strong style="font-size:18px; color:darkblue;">총 획득 포인트</strong></div>
			<div style="flex:1"></div>
			<div style="flex:4"><label style="color:midnightblue;"><%=dto.getUser_Total_Point()%></label></div>
			<div style="flex:4"><button type="submit" onclick="fnPopup('mypage/replace_user_info.jsp', '개인 정보 변경')"><strong style="font-size:13px; color:red;">개인 정보 변경</strong></button></div>
		</div><br/>
	</form>
	<form method="post" action="javascript:parent.fnPageMove('mypage/my_main_proc.jsp')">
		<div style="display:flex;">
			<input type="hidden" name="user_Id" value="<%=session.getAttribute("logged")%>"/>
			<div style="flex:1"><strong style="font-size:18px; color:darkblue;">사용한 포인트</strong></div>
			<div style="flex:1"></div>
			<div style="flex:4"><label style="color:midnightblue;"><%=dto.getUser_Total_Point() - dto.getUser_Current_Point()%></label></div>
			<div style="flex:4"><button type="submit"><strong style="font-size:13px; color:red;">퀴즈 히스 토리</strong></button></div>
		</div><br/>
	</form>
	<form method="post" action="javascript:parent.fnPageMove('mypage/my_main_proc.jsp')">
		<div style="display:flex;">
			<input type="hidden" name="user_Id" value="<%=session.getAttribute("logged")%>"/>
			<div style="flex:1"><strong style="font-size:18px; color:darkblue;">보유 포인트</strong></div>
			<div style="flex:1"></div>
			<div style="flex:4"><label style="color:midnightblue;"><%=dto.getUser_Current_Point()%></label></div>
			<div style="flex:4"><button type="submit"><strong style="font-size:13px; color:red;">구매 내역 조회</strong></button></div>
		</div><br/>
	</form>
</body>
</html>