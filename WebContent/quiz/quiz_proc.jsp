<%@page import="java.util.ArrayList"%>
<%@page import="p_quiz.QuizDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	int c_num = Integer.parseInt(request.getParameter("c_num"));
	int p_num = Integer.parseInt(request.getParameter("p_num"));
	int u_answer = 0;
	if(request.getParameter("u_answer") != null){
		u_answer = Integer.parseInt(request.getParameter("u_answer"));
	}
	ArrayList<QuizDto> list = (ArrayList)session.getAttribute("quiz_list");
	QuizDto q_dto = list.get(p_num);
	q_dto.setQ_user_answer(u_answer);
	q_dto = list.get(c_num);
%>

����<%=c_num + 1%>. <%=q_dto.getQ_contents()%><br/>
(����Ʈ : <%=q_dto.getQ_point()%>��)<br/>
<br/>

�� <%=q_dto.getQ_exam1()%><br/>
�� <%=q_dto.getQ_exam2()%><br/>
�� <%=q_dto.getQ_exam3()%><br/>
�� <%=q_dto.getQ_exam4()%><br/>
<br/>
<!-- 
����<%--=c_num + 1--%> �� : <%--=q_dto.getQ_answer()--%><br/>
����<%--=c_num + 1--%> user�� : <%--=q_dto.getQ_user_answer()--%><br/>
����<%--=c_num + 1--%> �з� : <%--=q_dto.getQ_cartegory()--%><br/>
����<%--=c_num + 1--%> ��ȣ : <%--=q_dto.getQ_number()--%><br/>
-->
</body>
</html>