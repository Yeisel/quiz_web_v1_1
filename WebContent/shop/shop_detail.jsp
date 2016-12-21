<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<h3>상품명 <%="상품명" %></h3>
<!-- 상품이미지 -->
 	<div style="display:flex; border-top:1px solid black;border-bottom:1px solid black;" >
		<div class="thumbBox" style="flex:1; padding:10px;" >
				<span ><img src="images/pic01.jpg" alt="상품이미지" style="width:350px; height:270px;"></span>
		</div>
		<div style="flex:2">
			<div style="height:50px; background:#eff1f2; "><strong>가격 : <%="가격" %></strong></div>
			<div style="height:50px;"><%="상품설명" %></div>
			<div style="height:50px;">제조사 : <%="제조사" %></div>
			<div style="height:50px;">상품번호 : <%="상품번호" %></div>
			<div style="height:50px;">참고사항 : <%="참고사항" %></div>
		</div>
	</div>
	<div style="margin:30px;">
		<div style="float:left"><a href="index.jsp"><button>처음으로</button></a></div>
		<div style="float:right;"><a href="javascript:parent.fnPageMove('shop/shop_cart.jsp')"><button>장바구니</button></a></div>
		<div style="float:right; margin-right:30px;"><a href="javascript:parent.fnPageMove('shop/shop_cart.jsp')"><button>구매하기</button></a></div>
		
	</div>


		
</body>
</html>