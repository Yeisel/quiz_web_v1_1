<%@page import="java.util.List"%>
<%@page import="prjdata.QuizProductDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function fnDelete(){
		
		alert("삭제하기")
	}
</script>
</head>
<jsp:useBean id="dao" class="prjbean.MainProc"/>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("logged");
	int pnum = Integer.parseInt(request.getParameter("product_Number"));
	Boolean bool = dao.compareCart(id, pnum);
	if(bool == false){dao.insertCart(id, pnum);}
	List list = dao.getCart(id);
%>
	<body>
		<div class="sTitwrap">
			<h3 class="cp_intit">장바구니</h3>
			<input type="text" name="userId" value="<%=id %>"/>
			<input type="text" name="pnum" value="<%=pnum %>"/>
		</div>
		<div style="display:flex; background-color:rgba(230, 235, 237, 0.25);border: solid 1px rgba(210, 215, 217, 0.75)">
					<div style="flex:1;">구분</div>
					<div style="flex:1;">상품이미지</div>
					<div style="flex:3">상품명 : </div>
					<div style="flex:1">수량 : </div>
					<div style="flex:1">상품금액 : </div>
					<div style="flex:1">할인금액 : </div>
					<div style="flex:1.5">할인적용금액 : </div>
					<div style="flex:1;">배송비 : </div>
				
		</div>
<%
		for(int i=0; i<list.size(); i++){
			QuizProductDTO dto = (QuizProductDTO)list.get(i);

%>
		<div style="display:flex; border: solid 1px rgba(210, 215, 217, 0.75)">
					<div align="center" style="flex:1; "><input type="checkbox" id="check<%=i%>" name="check<%=i%>"><label for="check<%=i%>"></label></input>
						<input type="hidden" name="pnum<%=i%>"/></div>
					<div style="flex:1; "><img src=<%=dto.getProduct_Image()%> style="width:90px;height:50px;"></img></div>
					<div style="flex:3"><%=dto.getProduct_Name()%></div>
					<div style="flex:1">수량</div>
					<div style="flex:1"><%=dto.getProduct_Price()%> P</div>
					<div style="flex:1"></div>
					<div style="flex:1.5"></div>
					<div style="flex:1"></div>
			
		</div>
<%
		}
%>
		<div style="margin-top:20px; display:flex;">
			<div style="flex:1"><a href="javascript:fnDelete()"><input type="button" value="삭제하기" /></a></div>
			<div style="flex:5"></div>
			<div style="flex:1"><input type="button" value="선택주문" ></input></div>
			<div style="flex:1"><input type="button" value="전체주문" ></input></div>
		</div>
		<br/>
		<h3 class="sTitwrap">구매 예정 내역</h3>
		<div>
			<div style="display:flex; border:1px solid #eaeaea; background-color:rgba(230, 235, 237, 0.25);">	
					<div style="flex:1">주문금액 : <%="주문금액"%></div>
					<div style="flex:1">할인사용금액 : <%="할인사용금액"%></div>
					<div style="flex:1">최종결제금액 : <%="최종결제금액"%></div>
			</div>
		</div>
		
		<div style="border:1px solid #eaeaea ;">
			<div style="display:flex">	
				<div style="flex:1">보유포인트 : </div><div style="flex:5"><%="보유포인트"%></div>
			</div>
			<div style="display:flex">	
				<div style="flex:1">사용예정포인트 : </div><div style="flex:5"><%="사용예정포인트"%></div>
			</div>
		</div>
		<br/><br/>
		<h3 class="sTitwrap">배송지 정보 입력</h3>
		<table class="alt">
			<tbody>
				<tr>
					<td style="width:200px;">배송지선택 </td>
					<td><input type="radio" id="r1" name="r1"/><label for="r1">가입자정보와 동일</label><input type="radio" id="r2" name="r1"/><label for="r2">새로 입력</label></td>
				
				</tr>
				<tr>
					<td>받으시는분 : </td>
					<td><input type="text" placeholder="받으시는분" required="required"/></td>
				</tr>
				<tr>
					<td>주 소 : </td>
					<td><input type="text" placeholder="주소" required="required"/></td>
				</tr>
				<tr>
					<td>휴대전화 : </td>
					<td><input type="text" placeholder="휴대전화" required="required"/></td>
				</tr>
				<tr>
					<td>자택전화 : </td>
					<td><input type="text" placeholder="자택전화" required="required"/></td>
				</tr>
				<tr>
					<td>주문자명 :</td>
					<td><input type="text" required="required"/></td>
				</tr>
				<tr>
					<td>배송요구사항 :</td>
					<td><input type="text" required="required"/></td>
				</tr>
			</tbody>
		</table>	
		<div style="margin-top:20px; display:flex">
			<div style="flex:1"><a href="index.jsp"><input type="button" value="처음으로" /></a></div>
			<div style="flex:1"><a href="javascript:fnPageMove('shop/shop_detail.jsp')"><input type="button" value="상품목록" /></a></div>
			<div style="flex:4"></div>
			<div style="flex:1"><input type="button" value="결제하기" style="float:right"/></div>
			<div style="flex:1"><input type="button" value="취소하기" style="float:right"/></div>
		</div>

			
		

	</body>
</html>