<%@page import="prjdata.QuizBuyDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UFT-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");

%>
<jsp:useBean id="dao" class="prjbean.MainProc"/>
<jsp:useBean id="dto" class="prjdata.QuizBuyDTO" />
<jsp:setProperty property="*" name="dto" />

<%
	String buy_addressee = request.getParameter("buy_addressee");
	System.out.println(buy_addressee);
	String product = request.getParameter("productTmp");
	String id = (String)session.getAttribute("logged");
	dao.insertBuy(dto,product, id);
%>
<script>
	alert("주문 완료 되었습니다.");
	location.href="javascript:parent.fnPageMove('shop/shop_cart.jsp')";
</script>

</body>
</html>