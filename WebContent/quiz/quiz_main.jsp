<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function fnIndex(page){
		top.frames['index.jsp'].fnPageMove(page);
	};
</script>
</head>
	<body>
		<div>
			<ul>
				<li><a href="javascript:parent.fnPageMove('quiz/quiz_sang.jsp')">���</a></li>
				<li><a href="javascript:parent.fnPageMove('quiz/quiz_nsense.jsp')">�ͼ���</a></li>
				<li><a href="javascript:parent.fnPageMove('quiz/quiz_sports.jsp')">������</a></li>
				<li><a href="javascript:parent.fnPageMove('quiz/quiz_history.jsp')">����</a></li>
				<!-- <li><a href="javascript:fnPageMove('quiz_nsense.jsp')"><strong style="font-size:14px;">�ͼ���</strong></a></li>
				<li><a href="javascript:fnPageMove('quiz_sports.jsp')"><strong style="font-size:14px;">������</strong></a></li>
				<li><a href="javascript:fnPageMove('quiz_history.jsp')"><strong style="font-size:14px;">����</strong></a></li> -->
			</ul>
		</div>
	</body>
</html>