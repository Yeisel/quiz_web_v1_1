<%@page import="prjdata.QuizUserDTO"%>
<%@page import="java.util.List"%>
<%@page import="prjdata.QuizProductDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function fnAll(){
		$("input:checkbox").attr("checked", true);
		
		fnChoice();
	}
	
	function fnClear(){
		$("input:checkbox").attr("checked", false);
		
	}
	

	function fnChoice(){
		var count;
		var price;
		var sum=0;
		var product = [];
		$("input:checked").each(
			function(i) {
			  pnum = $(this).val();
			  count = $(this).parent().next().next().next().children().val();
			  price = $(this).parent().next().next().next().next().children().text();
			  
			  sum += parseInt(count)*parseInt(price);
			  product += String(pnum) + "/" + String(count) + "/"  + String(price) + "/";
			  // alert(price);
			  
		});
		// alert(product);
		
		$("#buySum1").text(sum);
		$("#buySum2").text(sum);
		$("#productTmp").val(product);
		
		alert("화면 아래쪽에 포인트 확인해주시고, 배송지 입력후에 '결제하기' 버튼을 눌러주세요");
	}
</script>
</head>
<jsp:useBean id="dao" class="prjbean.MainProc"/>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	String id = (String)session.getAttribute("logged");
	System.out.println("userId = " + id);
	if(request.getParameter("product_Number")!=null){
		int pnum = Integer.parseInt(request.getParameter("product_Number"));
		Boolean bool = dao.compareCart(id, pnum);
		if(bool == false){dao.insertCart(id, pnum);}
	}
	else{
		System.out.println("구매후 넘어옴");
	}
	List list = dao.getCart(id);
	QuizUserDTO userdto = (QuizUserDTO)request.getAttribute("dto");
	int point = dao.getUserPoint(id);
%>
	<body>
		<div class="sTitwrap">
			<h3 class="cp_intit">장바구니</h3>
			<input type="text" name="userId" value="<%=id %>"/>
			
		</div>
		
		<div style="display:flex; background-color:rgba(230, 235, 237, 0.25);border: solid 1px rgba(210, 215, 217, 0.75)">
					<div style="flex:1;">선택</div>
					<div style="flex:1;">상품이미지</div>
					<div style="flex:3">상품명</div>
					<div style="flex:1">수량</div>
					<div style="flex:1">상품금액</div>
					<div style="flex:1">할인금액</div>
					<div style="flex:1.5">할인적용금액</div>
					<div style="flex:1;">배송비</div>
				
		</div>
		<form id="cart" action="javascript:fnPageMove('shop/shop_cart_proc.jsp', '#cart')">
		
<%
		for(int i=0; i<list.size(); i++){
			QuizProductDTO dto = (QuizProductDTO)list.get(i);

%>
		<div style="display:flex; border: solid 1px rgba(210, 215, 217, 0.75)">
					<input type="hidden" name="userId" value="<%=id%>"/>
					<div align="center" style="flex:1; "><input type="checkbox" name="product_number" id="check<%=i%>" value="<%=dto.getProduct_Number()%>"/><label for="check<%=i%>" ></label></div>
					<div style="flex:1; "><input type="hidden" name="product_image" value=<%=dto.getProduct_Image()%>/><img src=<%=dto.getProduct_Image()%> style="width:90px;height:50px;"></img></div>
					<div style="flex:3"><input type="hidden" name="product_name" value="<%=dto.getProduct_Name()%>"/><%=dto.getProduct_Name()%></div>
					<div style="flex:1" id="count1" name="count1" value="count"><input type="text" id="count" name="count" value="1" ></input></div>
					<div style="flex:1" ><intput type="hidden" ><%=dto.getProduct_Price()%></intput> </div>
					<div style="flex:1"></div>
					<div style="flex:1.5"></div>
					<div style="flex:1"></div>
		</div>
<%
		}
%>
			<input type="submit" name="delete" value="삭제하기"/>
			<a href="javascript:fnChoice()"><input type="button" name="choiceBuy" value="선택주문"/></a>
			<a href="javascript:fnAll()"><input type="button" name="allBuy" value="전체주문"/></a>
			<a href="javascript:fnClear()"><input type="button" name="allBuy" value="선택해제"/></a>
		</form>
		
		<br/>
		<h3 class="sTitwrap">구매 예정 내역</h3>
		<div>
			<div style="display:flex; border:1px solid #eaeaea; background-color:rgba(230, 235, 237, 0.25);">
					<div style="flex:1">주문금액 : <a href="#" id="buySum1"/></div>
					<div style="flex:1">할인사용금액 : </div>
					<div style="flex:1">최종결제금액 : </div>
			</div>
		</div>
		
		<div style="border:1px solid #eaeaea ;">
			<div style="display:flex">	
				<div style="flex:1">보유포인트 : </div><div style="flex:5"><%=point%></div>
			</div>
			<div style="display:flex">	
				<div style="flex:1">사용예정포인트 : </div><div style="flex:5" id="buySum2"></div>
			</div>
		</div>
		<br/><br/>
		<h3 class="sTitwrap">배송지 정보 입력</h3>
		<form id="cartpage" action="javascript:fnPageMove('shop/shop_buy_proc.jsp', '#cartpage')">
		<table class="alt">
			<tbody>
				<tr>
					<td style="width:200px;">배송지선택 </td>
					<td><input type="radio" id="r1" name="r1"/><label for="r1">가입자정보와 동일</label><input type="radio" id="r2" name="r1" /><label for="r2">새로 입력</label></td>
				
				</tr>
				<tr>
					<td>받으시는분 : </td>
					<td><input type="text" placeholder="받으시는분" required="required" name="buy_addressee"/></td>
				</tr>
				<tr>
					<td>주 소 : </td>
					<td><input type="text" placeholder="주소" required="required" name="buy_destination"/></td>
				</tr>
				<tr>
					<td>휴대전화 : </td>
					<td><input type="text" placeholder="휴대전화" required="required" name="buy_phone"/></td>
				</tr>
				<tr>
					<td>자택전화 : </td>
					<td><input type="text" placeholder="자택전화" required="required" name="buy_tel"/></td>
				</tr>
				<tr>
					<td>주문자명 :</td>
					<td><input type="text" required="required" name="buy_sender"/></td>
				</tr>
				<tr>
					<td>배송요구사항 :</td>
					<td><input type="text" required="required" name="buy_etc"/></td>
				</tr>
			</tbody>
		</table>
			
		<input type="text" id="productTmp" name="productTmp"></input>

		<div style="margin-top:20px; display:flex">
			<div style="flex:1"><a href="index.jsp"><input type="button" value="처음으로" /></a></div>
			<div style="flex:1"><a href="javascript:fnPageMove('shop/shop_detail.jsp')"><input type="button" value="상품목록"></a></div>
			<div style="flex:4"></div>
			<div style="flex:1"><input type="submit" value="결제하기" style="float:right"></a></div>
			<div style="flex:1"><input type="button" value="취소하기" style="float:right"></a></div>
		</div>
		</form>
	</body>
</html>