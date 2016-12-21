<%@page import="p_quiz.QuizDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="js/jquery-3.1.1.min.js"></script>
</head>
<body>

<jsp:useBean id="q_dao" class="p_quiz.QuizDao"></jsp:useBean>

<%
	request.setCharacterEncoding("euc-kr"); 	
	String category = (String)session.getAttribute("category");
	Integer q_numbers = (Integer)session.getAttribute("q_numbers");
	session.setAttribute("quiz_list", q_dao.getQuiz_p(category, q_numbers));
%>

<script>
	parent.fnPageMove("quiz/quiz_solve.jsp");
</script>

</body>
</html>