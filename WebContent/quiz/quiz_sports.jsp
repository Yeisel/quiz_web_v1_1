<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<h1>������ ����</h1>

<%
	request.setCharacterEncoding("euc-kr");
	session.setAttribute("category", "������");
	session.setAttribute("q_numbers", 10);
%>

<div style = "width:500px; height:300px; border:1px solid black">
������ ���� �� 10������ �����Ǹ�<br/>
���� �ð��� 3���Դϴ�.<br/>
�����Ͻðڽ��ϱ�?<br/>
</div>

<form method="post" action="javascript:parent.fnPageMove('quiz/quiz_prepare.jsp')">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="category" value="������" />
	<input type="hidden" name="q_numbers" value="10" />
	<input type="submit" value="����">
</form>

</body>
</html>