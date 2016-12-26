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
	String key1 = request.getParameter("delete");
	String key2 = request.getParameter("choiceBuy");
	String key3 = request.getParameter("allBuy");
	String[] product_Number = request.getParameterValues("product_number");
	String userId = (String)session.getAttribute("logged");

	if(key1 != null){
		dao.deleteCart(product_Number, userId);
	}
	else if(key2 != null){
		System.out.println("선택구매");
	}
	else if(key3 != null){
		System.out.println("전체구매");
	}

	
	
%>

</body>
</html>