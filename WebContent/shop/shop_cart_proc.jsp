<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="prjbean.MainProc"/>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String key1 = request.getParameter("delete");
	String[] product_Number = request.getParameterValues("product_number");
	String userId = (String)session.getAttribute("logged");
	dao.deleteCart(product_Number, userId);
%>
<script>
	alert("상품 삭제 되었습니다.");
	location.href="javascript:parent.fnPageMove('shop/shop_cart.jsp')";
</script>

</body>
</html>