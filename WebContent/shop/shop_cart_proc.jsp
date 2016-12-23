<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="prjbean.MainProc"/>
<jsp:useBean id="dto" class="prjdata.QuizProductDTO"/>
<jsp:setProperty property="*" name="dto"/>  
getpro : <jsp:getProperty property="product_Name" name="dto"/>

안녕
<%
	request.setCharacterEncoding("UTF-8");
	String key1 = request.getParameter("delete");
	String key2 = request.getParameter("choiceBuy");
	String key3 = request.getParameter("allBuy");
	String key4 = request.getParameter("userId");
	String key5 = request.getParameter("test");
	String key6 = request.getParameter("test1");

	System.out.println(key1);
	System.out.println(key2);
	System.out.println(key3);
	System.out.println(key4);
	System.out.println(key5);
	System.out.println(key6);
	System.out.println(request.getParameter("test1"));
	
%>
<%=key4%>
</body>
</html>