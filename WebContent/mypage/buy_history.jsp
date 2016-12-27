<%@page import="prjdata.QuizBuyDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>구매 히스토리</title>
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<%request.setCharacterEncoding("utf-8");%>
	<%response.setContentType("text/html;charset=UTF-8");%>
	
	<jsp:useBean id="dao" class="prjbean.MainProc"></jsp:useBean>
	<jsp:useBean id="dto" class="prjdata.QuizBuyDTO"></jsp:useBean>
<%
	List list = dao.getBuy((String)session.getAttribute("logged"));
%>
<strong style="font-size:50px; color:indianred; font-weight:1000;"> ** <%=session.getAttribute("logged")%>님의 구매 내역 ** </strong>
	<table class="table table-bordered">
		<tr style="background-color:pink;">
		  <td><strong style="font-size:17px; color:black;">구매일</strong></td>
		  <td><strong style="font-size:17px; color:black;">상품 번호</strong></td>
		  <td><strong style="font-size:17px; color:black;">구매 수량</strong></td>
		  <td><strong style="font-size:17px; color:black;">구매 가격</strong></td>
		  <td><strong style="font-size:17px; color:black;">배송 상태</strong></td>
		  <td><strong style="font-size:17px; color:black;">송장 번호</strong></td>
		</tr>
<%											
for(int i=0; i<list.size(); i++){
	QuizBuyDTO dto2 = (QuizBuyDTO)list.get(i);
%>
		<tr>
			<td><%=dto2.getBuy_Date()%></td>
			<td><%=dto2.getBuy_Product_Number()%></td>
			<td><%=dto2.getBuy_Amount()%></td>
			<td><%=dto2.getBuy_Price()%></td>
			<td><%=dto2.getBuy_Progress()%></td>
			<td><%=dto2.getBuy_Invoice()%></td>
		</tr>
<%
}
%>					
	</table>
</body>
</html>