<%@page import="prjdata.QuizProductDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<jsp:useBean id="dao" class="prjbean.MainProc"/>
<%
	request.setCharacterEncoding("UTF-8");
	List list = dao.getProductList();
%>
	
  <!-- Page Content -->
    <div class="container">

        <!-- Page Header -->
        <div >
            <div >
                <h2 class="page-header">포인트몰
                </h2>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
<% 
	for(int i=0; i<list.size(); i++){
		QuizProductDTO dto = (QuizProductDTO)list.get(i);
%>
        <div >
        	<a href="javascript:parent.fnPageMove('shop/shop_detail.jsp?product_Number=<%=dto.getProduct_Number()%>')">
	
        	<div style="display:flex; border-bottom:1px dotted red; margin-bottom:5px;">

 
	            <div style="flex-basis:200px;">
	                <img src=<%=dto.getProduct_Image()%> style="width:200px; height:100px;">
	            </div>
	            <div align="center" style="flex-basis:600px; width:600px;">
	                <br/><h3><%=dto.getProduct_Name()%></h3>
	            </div>
	            <div style="flex-basis:200px; width:200px;">
	            	<br/><h3><%=dto.getProduct_Price()%> P</h3>

	            </div>    
	            <div style="flex-basis:100px;width:100px;">
	            	<br/><img vertical-align="middle" src="images/cart.png" style="width:60px; height:30px;"></img>
	            </div>
	            <div style="flex-basis:100px;width:100px; ">
	            	<br/><img align="bottom" src="images/buy.png" style="width:60px; height:30px;"></img>
	            </div>
          
            </div>
<%
	}
%>	  
            </a>
          </div>

	</body>
</html>