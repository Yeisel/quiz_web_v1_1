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
<jsp:setProperty property="*" name="dto"/>
<%
	if(dto.getUser_Password().equals(request.getParameter("pass_confirm"))){
		dao.replaceUser(dto);
%>
<script>
	alert("정상 수정 되었습니다.");
	window.close();
</script>
<%
	}
	else{
%>
<script>
	alert("패스워드를 확인 해 주세요.");
</script>
<%
	}
%>
</body>
</html>