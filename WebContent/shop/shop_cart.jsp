<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
	<body>
		<div class="sTitwrap">
			<h3 class="cp_intit">�ֹ���ǰ Ȯ��</h3>
		</div>
		<div style="display:flex; background-color:rgba(230, 235, 237, 0.25);border: solid 1px rgba(210, 215, 217, 0.75)">
			
					<div style="flex:1.5; ">��ǰ�̹���</div>
					<div style="flex:3">��ǰ��</div>
					<div style="flex:1">����</div>
					<div style="flex:1">��ǰ�ݾ�</div>
					<div style="flex:1">���αݾ�</div>
					<div style="flex:1.5">��������ݾ�</div>
					<div style="flex:1;">��ۺ�</div>
				
		</div>
		<div style="display:flex; border: solid 1px rgba(210, 215, 217, 0.75)">
				
					<div style="flex:1.5"><img src=""><%="��ǰ�̹���"%></img></div>
					<div style="flex:3"><%="��ǰ��"%></div>
					<div style="flex:1"><%="����"%></div>
					<div style="flex:1"><%="��ǰ�ݾ�"%></div>
					<div style="flex:1"><%="���αݾ�"%></div>
					<div style="flex:1.5"><%="��������ݾ�"%></div>
					<div style="flex:1"><%="��ۺ�"%></div>
			
		</div>
		<div style="margin-top:20px; display:flex;">
			<div style="flex:1"><input type="button" value="�����ϱ�" ></input></div>
			<div style="flex:5"></div>
			<div style="flex:1"><input type="button" value="�����ֹ�" ></input></div>
			<div style="flex:1"><input type="button" value="��ü�ֹ�" ></input></div>
		</div>
		<br/>
		<h3 class="sTitwrap">���� ���� ����</h3>
		<div>
			<div style="display:flex; border:1px solid #eaeaea; background-color:rgba(230, 235, 237, 0.25);">	
					<div style="flex:1">�ֹ��ݾ� : <%="�ֹ��ݾ�"%></div>
					<div style="flex:1">���λ��ݾ� : <%="���λ��ݾ�"%></div>
					<div style="flex:1">���������ݾ� : <%="���������ݾ�"%></div>
			</div>
		</div>
		
		<div style="border:1px solid #eaeaea ;">
			<div style="display:flex">	
				<div style="flex:1">��������Ʈ : </div><div style="flex:5"><%="��������Ʈ"%></div>
			</div>
			<div style="display:flex">	
				<div style="flex:1">��뿹������Ʈ : </div><div style="flex:5"><%="���������ݾ�"%></div>
			</div>
		</div>
		<br/><br/>
		<h3 class="sTitwrap">����� ���� �Է�</h3>
		<table class="alt">
			<tbody>
				<tr>
					<td style="width:200px;">��������� </td>
					<td><input type="radio" id="r1" name="r1"/><label for="r1">������������ ����</label><input type="radio" id="r2" name="r1"/><label for="r2">���� �Է�</label></td>
				
				</tr>
				<tr>
					<td>�����ôº� : </td>
					<td><input type="text" placeholder="�����ôº�" required="required"/></td>
				</tr>
				<tr>
					<td>�� �� : </td>
					<td><input type="text" placeholder="�ּ�" required="required"/></td>
				</tr>
				<tr>
					<td>�޴���ȭ : </td>
					<td><input type="text" placeholder="�޴���ȭ" required="required"/></td>
				</tr>
				<tr>
					<td>������ȭ : </td>
					<td><input type="text" placeholder="������ȭ" required="required"/></td>
				</tr>
				<tr>
					<td>�ֹ��ڸ� :</td>
					<td><input type="text" required="required"/></td>
				</tr>
				<tr>
					<td>��ۿ䱸���� :</td>
					<td><input type="text" required="required"/></td>
				</tr>
			</tbody>
		</table>	
		<div style="margin-top:20px; display:flex">
			<div style="flex:1"><a href="index.jsp"><input type="button" value="ó������" /></a></div>
			<div style="flex:1"><a href="javascript:fnPageMove('shop/shop_detail.jsp')"><input type="button" value="��ǰ���" /></a></div>
			<div style="flex:4"></div>
			<div style="flex:1"><input type="button" value="�����ϱ�" style="float:right"/></div>
			<div style="flex:1"><input type="button" value="����ϱ�" style="float:right"/></div>
		</div>

			
		

	</body>
</html>