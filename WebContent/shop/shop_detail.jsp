<%@page import="prjdata.QuizProductDTO"%>
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
	int product_Number = Integer.parseInt(request.getParameter("product_Number"));
	System.out.println(product_Number);
	QuizProductDTO dto = dao.getProduct(product_Number);
	String userId = (String)session.getAttribute("logged");
%>	

		<h3>상품명<%=dto.getProduct_Name() %></h3>
		
<!-- 상품이미지 -->
 	<div style="display:flex; border-top:1px solid black;border-bottom:1px solid black;" >
		<div class="thumbBox" style="flex:1; padding:10px;" >
				<span ><img src=<%=dto.getProduct_Image() %> alt="상품이미지" style="width:350px; height:270px;"></span>
		</div>


		<div style="flex:2">
			<div style="height:50px; background:#eff1f2; "><strong>가격 : <%=dto.getProduct_Price() %> P</strong></div>
			<div style="height:50px;"><%=dto.getProduct_Contents() %></div>
			<div style="height:50px;">제조사 : <%=dto.getProduct_Company() %></div>
			<div style="height:50px;">상품번호 : <%=dto.getProduct_Number() %></div>
			<div style="height:50px;">참고사항 : </div>
		</div>
	</div>
	
	<div style="margin:30px;">
		<div style="float:left"><a href="index.jsp"><button>처음으로</button></a></div>
		<div style="float:left; margin-left:20px;"><a href="javascript:parent.fnPageMove('shop/shop_main.jsp')"><button>이전으로</button></a></div>
		<form action="javascript:fnCart()">		
			<div style="float:right;"><button>장바구니</button></div>
			<input type="hidden" id="session" value="<%=userId %>"></input>
			<input type="hidden" id="pnum" name="pnum" value="<%=dto.getProduct_Number()%>"><%=dto.getProduct_Number()%></input>
		<div style="float:right; margin-right:20px;"><button>구매하기</button></div>
		</form>			
	</div>
	
<script>
	function fnBack(){
		location.href="javascript:parent.fnPageMove('shop/shop_cart.jsp')";
	}
	function fnCart(){
		var id = document.getElementById("session").value;
		if(id == "null" || id == null){
			alert("로그인 후 사용해주세요.");
		}
		else{
			alert(id);
			parent.fnPageMove('shop/shop_cart.jsp?product_Number=<%=dto.getProduct_Number()%>');
		}
	}
</script>
		
</body>
</html>