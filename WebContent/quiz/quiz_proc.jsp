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

문제<%=c_num + 1%>. <%=q_dto.getQ_contents()%><br/>
(포인트 : <%=q_dto.getQ_point()%>점)<br/>
<br/>

① <%=q_dto.getQ_exam1()%><br/>
② <%=q_dto.getQ_exam2()%><br/>
③ <%=q_dto.getQ_exam3()%><br/>
④ <%=q_dto.getQ_exam4()%><br/>
<br/>
<!-- 
문제<%--=c_num + 1--%> 답 : <%--=q_dto.getQ_answer()--%><br/>
문제<%--=c_num + 1--%> user답 : <%--=q_dto.getQ_user_answer()--%><br/>
문제<%--=c_num + 1--%> 분류 : <%--=q_dto.getQ_cartegory()--%><br/>
문제<%--=c_num + 1--%> 번호 : <%--=q_dto.getQ_number()--%><br/>
-->
</body>
</html>