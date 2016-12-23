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
	if(request.getParameter("policy") != null){	
		if(dto.getUser_Password().equals(request.getParameter("pass_confirm"))){
			if(request.getParameter("user_Id").length() > 4){
				dao.inputNewUser(dto);
			}
			else{
%>
				<script>
					alert("아이디는 6자 이상이어야 합니다.");
					location.href="javascript:parent.fnPageMove('mypage/join_new.jsp')";
				</script>
<%
			}
%>
<script>
	alert("QUIZ BOOK의 회원으로 승급 된 것을 축하 드립니다~!!");
	location.href="../index.jsp";
</script>
<%
		}
		else{
%>
			<script>
				alert("패스워드를 다시 확인 해 주세요.");
				location.href="javascript:parent.fnPageMove('mypage/join_new.jsp')";
			</script>
<%
		}
	}
	else{
%>
		<script>
			alert("약관에 동의 하여야 회원 가입이 가능합니다.");
			location.href="javascript:parent.fnPageMove('mypage/join_new.jsp')";
		</script>
<%
	}
		
%>
</body>
</html>