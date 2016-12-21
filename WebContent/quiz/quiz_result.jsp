<%@page import="p_quiz.QuizDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>도전 결과</h1>

<jsp:useBean id="q_dao" class="p_quiz.QuizDao"></jsp:useBean>
<%
	ArrayList<QuizDto> list = (ArrayList)session.getAttribute("quiz_list");
	int[] point = new int[10];
	int total_point = 0;
	String userID = (String)session.getAttribute("logged");

	for(int i = 0; i < 10; i++){
		if(list.get(i).getQ_user_answer() == list.get(i).getQ_answer()){
			point[i] = list.get(i).getQ_point();
			total_point += point[i];
		}
	}
	
	if(userID != null){
		q_dao.acquired_point_update(userID, total_point);
	}
%>
<h2>총 획득 포인트 : <%=total_point%></h2>
<h3>문제 별 획득 포인트</h3>
<table border = "1">
	<tr>
		<th>번호</th>
		<th>획득 포인트</th>
	</tr>
<%
	for(int i = 0; i < 10; i++){
%>	
	<tr>
		<td><%=i + 1%></td>
		<td><%=point[i]%></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>