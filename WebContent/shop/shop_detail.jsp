<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<h3>��ǰ�� <%="��ǰ��" %></h3>
<!-- ��ǰ�̹��� -->
 	<div style="display:flex; border-top:1px solid black;border-bottom:1px solid black;" >
		<div class="thumbBox" style="flex:1; padding:10px;" >
				<span ><img src="images/pic01.jpg" alt="��ǰ�̹���" style="width:350px; height:270px;"></span>
		</div>
		<div style="flex:2">
			<div style="height:50px; background:#eff1f2; "><strong>���� : <%="����" %></strong></div>
			<div style="height:50px;"><%="��ǰ����" %></div>
			<div style="height:50px;">������ : <%="������" %></div>
			<div style="height:50px;">��ǰ��ȣ : <%="��ǰ��ȣ" %></div>
			<div style="height:50px;">������� : <%="�������" %></div>
		</div>
	</div>
	<div style="margin:30px;">
		<div style="float:left"><a href="index.jsp"><button>ó������</button></a></div>
		<div style="float:right;"><a href="javascript:parent.fnPageMove('shop/shop_cart.jsp')"><button>��ٱ���</button></a></div>
		<div style="float:right; margin-right:30px;"><a href="javascript:parent.fnPageMove('shop/shop_cart.jsp')"><button>�����ϱ�</button></a></div>
		
	</div>


		
</body>
</html>