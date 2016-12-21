<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<strong style="font-size:100px; color:indianred; font-weight:1000;"> ** QUIZ BOOK 회원 정보 ** </strong>
	<br/><br/><br/><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:steelblue;">ID</strong></div>
		<div style="flex:1"></div>
		<div style="flex:4"><label style="color:darkcyan;">banjang</label></div>
		<div style="flex:4"></div>
	</div><br/>
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:steelblue;">NAME</strong></div>
		<div style="flex:1"></div>
		<div style="flex:4"><label style="color:darkcyan;">banjang</label></div>
		<div style="flex:4"></div>
	</div><br/>
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:steelblue;">EMAIL</strong></div>
		<div style="flex:1"></div>
		<div style="flex:4"><label style="color:maroon;">banjang</label></div>
		<div style="flex:4"></div>
	</div><br/>
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:steelblue;">PHONE</strong></div>
		<div style="flex:1"></div>
		<div style="flex:4"><label style="color:maroon;">banjang</label></div>
		<div style="flex:4"></div>
	</div><br/>
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:steelblue;">ADDRESS</strong></div>
		<div style="flex:1"></div>
		<div style="flex:4"><label style="color:maroon;">banjang</label></div>
		<div style="flex:4"></div>
	</div><br/>
	<form method="post" action="javascript:parent.fnPageMove('mypage/my_main_proc.jsp')">
		<div style="display:flex;">
			<div style="flex:1"><strong style="font-size:18px; color:darkblue;">총 획득 포인트</strong></div>
			<div style="flex:1"></div>
			<div style="flex:4"><label style="color:midnightblue;">banjang</label></div>
			<div style="flex:4"><button type="submit"><strong style="font-size:13px; color:red;">개인 정보 변경</strong></button></div>
		</div><br/>
	</form>
	<form method="post" action="javascript:parent.fnPageMove('mypage/my_main_proc.jsp')">
		<div style="display:flex;">
			<div style="flex:1"><strong style="font-size:18px; color:darkblue;">사용한 포인트</strong></div>
			<div style="flex:1"></div>
			<div style="flex:4"><label style="color:midnightblue;">banjang</label></div>
			<div style="flex:4"><button type="submit"><strong style="font-size:13px; color:red;">퀴즈 히스 토리</strong></button></div>
		</div><br/>
	</form>
	<form method="post" action="javascript:parent.fnPageMove('mypage/my_main_proc.jsp')">
		<div style="display:flex;">
			<div style="flex:1"><strong style="font-size:18px; color:darkblue;">보유 포인트</strong></div>
			<div style="flex:1"></div>
			<div style="flex:4"><label style="color:midnightblue;">banjang</label></div>
			<div style="flex:4"><button type="submit"><strong style="font-size:13px; color:red;">구매 내역 조회</strong></button></div>
		</div><br/>
	</form>
</body>
</html>