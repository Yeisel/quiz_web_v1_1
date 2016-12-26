<%@page import="prjdata.QuizBuyDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="prjbean.MainProc"/>

<%
	request.setCharacterEncoding("UTF-8");
	String buy_addressee = request.getParameter("buy_addressee");
	System.out.println(buy_addressee);
	String product = request.getParameter("productTmp");
	String id = (String)session.getAttribute("logged");
	dao.insertBuy(product, id);
%>

</body>
</html>