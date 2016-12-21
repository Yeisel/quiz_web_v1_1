<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="prjbean.MainProc"></jsp:useBean>
<jsp:useBean id="dto" class="prjdata.QuizUserDTO"></jsp:useBean>

<jsp:setProperty property="*" name="dto"/>

<%
	if(request.getParameter("policy") != null){
		if(dto.getUser_Password().equals(request.getParameter("pass_confirm"))){
			dao.inputNewUser(dto);
%>
<script>
	alert("축하합니다~ QUIZ BOOK의 새로운 회원이 되셨습니다.");
	location.href="../index.jsp";
</script>
<%
		}
		else{
%>
			<script>
				alert("비밀번호를 다시 확인 해 주세요.");
				location.href="javascript:parent.fnPageMove('mypage/join_new.jsp')";
			</script>
<%
		}
	}
	else{
%>
		<script>
			alert("약관에 동의하지 않으면 회원 가입을 할 수 없습니다.");
			location.href="javascript:parent.fnPageMove('mypage/join_new.jsp')";
		</script>
<%
	}
		
%>
</body>
</html>