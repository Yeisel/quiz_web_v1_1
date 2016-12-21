<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<h1>스포츠 문제</h1>

<%
	request.setCharacterEncoding("euc-kr");
	session.setAttribute("category", "스포츠");
	session.setAttribute("q_numbers", 10);
%>

<div style = "width:500px; height:300px; border:1px solid black">
스포츠 관련 총 10문제가 출제되며<br/>
제한 시간은 3분입니다.<br/>
도전하시겠습니까?<br/>
</div>

<form method="post" action="javascript:parent.fnPageMove('quiz/quiz_prepare.jsp')">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="hidden" name="category" value="스포츠" />
	<input type="hidden" name="q_numbers" value="10" />
	<input type="submit" value="도전">
</form>

</body>
</html>