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
	alert("�����մϴ�~ QUIZ BOOK�� ���ο� ȸ���� �Ǽ̽��ϴ�.");
	location.href="../index.jsp";
</script>
<%
		}
		else{
%>
			<script>
				alert("��й�ȣ�� �ٽ� Ȯ�� �� �ּ���.");
				location.href="javascript:parent.fnPageMove('mypage/join_new.jsp')";
			</script>
<%
		}
	}
	else{
%>
		<script>
			alert("����� �������� ������ ȸ�� ������ �� �� �����ϴ�.");
			location.href="javascript:parent.fnPageMove('mypage/join_new.jsp')";
		</script>
<%
	}
		
%>
</body>
</html>