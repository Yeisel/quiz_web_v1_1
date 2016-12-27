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

<%
	MainProc dao = new MainProc();
%>
	<script>
		var yn = confirm("정말 삭제 하시것슴?");
		if(yn == true){
	
<%
	dao.deleteUser(request.getParameter("user"));
	System.out.println("여기는 dao.deleteUser");
%>
			alert("정말 삭제 되었습니다.")
			location.href="javascript:parent.fnPageMove('mypage/fix_user.jsp', '#user_Id')"
		}
		else{
			location.href="javascript:parent.fnPageMove('mypage/fix_user.jsp', '#user_Id')"
		}
	</script>
</body>
</html>