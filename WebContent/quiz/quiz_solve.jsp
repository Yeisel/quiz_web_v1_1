<%@page import="p_quiz.QuizDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("euc-kr"); 	
	String category = (String)session.getAttribute("category");
%>
<script src="js/jquery-3.1.1.min.js"></script>
<script>
	
	var cur_num = 0;
	var prev_num = 0;
	var user_answer = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	
	$(function(){
		CountDownTimer();
		$.post("quiz/quiz_proc.jsp", {c_num:cur_num, p_num:prev_num, u_answer:user_answer[0]}, function(data){display(data)});
	});
	
	$(function(){
		$("#back")
			.click(function(){
				prev_num = cur_num;
				cur_num--;
				$.post("quiz/quiz_proc.jsp", {c_num:cur_num, p_num:prev_num, u_answer:user_answer[prev_num]}, function(data){display(data)});
			});
	});

	$(function(){
		$("#next")
			.click(function(){
				prev_num = cur_num;
				cur_num++;
				$.post("quiz/quiz_proc.jsp", {c_num:cur_num, p_num:prev_num, u_answer:user_answer[prev_num]}, function(data){display(data)});
			});
	});

	$(function(){
		$("input[name='exam']")
			.click(function(){
				user_answer[cur_num] = $("input[name='exam']:checked").val();
			});
	});
	
	$(function(){
		$("#finish")
			.click(function(){
				var confirm_text = "���� Ǯ�̸� �Ϸ��Ͻðڽ��ϱ�?";
				for(var i = 0; i < 10; i++){
					if(user_answer[i] == 0){
						confirm_text = "Ǯ�� ���� ������ �ֽ��ϴ�. ���� Ǯ�̸� �����Ͻðڽ��ϱ�?"
						break;
					}
				}
				if(confirm(confirm_text)){
					$.post("quiz/quiz_proc.jsp", {c_num:cur_num, p_num:cur_num, u_answer:user_answer[cur_num]}, function(data){display(data)});
					parent.fnPageMove("quiz/quiz_result.jsp");
				}
			});
	});

	
	function display(data){
		var div = document.getElementById("display");
		div.innerHTML = data;
		
		if(cur_num === 0){
			$("#back").attr("disabled", true);
			$("#next").attr("disabled", false);
		}
		else if(cur_num === 9){
			$("#back").attr("disabled", false);
			$("#next").attr("disabled", true);
		}
		else{
			$("#back").attr("disabled", false);
			$("#next").attr("disabled", false);
		}
		
		$("input:radio[name='exam']").prop("checked", false);
		if(user_answer[cur_num] != 0){
			$("input:radio[name='exam']").eq(user_answer[cur_num] - 1).prop("checked", true);
		}
	}
	
	function CountDownTimer(){
		
		var c_second = 0;
		var	l_time = 180;
		var countdown = setInterval(showRemaining, 1000);
		function showRemaining() {
			
			c_second++;
			var minutes = Math.floor((l_time - c_second) / 60);
			var seconds = Math.floor((l_time - c_second) % 60);
			
			var timer = document.getElementById("timer");
			timer.innerHTML = "���� �ð� : ";
			timer.innerHTML += minutes + '�� ';
			timer.innerHTML += seconds + '��';
			
			if(l_time - c_second <= 0){
				clearInterval(countdown);
				alert("���� �ð��� ��� ����Ͽ����ϴ�.")
				location.href="quiz_result.jsp";
			}
		}
	}
</script>

</head>
<body>
<h1><%=category%> ���� ���� </h1>
<div id="timer"  style = "width:650px; height:50px; border:1px solid black"></div>
<br/>
<div id="display" style = "width:650px; height:300px; border:1px solid black"></div>
<br/>

<div style = "width:1000px; height:70px">
	<div style = "width:0px; height:50px; float:left"></div>
	<input type="button" value="����" id="back" disabled="disabled"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	���� : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="exam" id="exam1" value="1"><label for="exam1">1</label></input>&nbsp;&nbsp;&nbsp;
	<input type="radio" name="exam" id="exam2" value="2"><label for="exam2">2</label></input>&nbsp;&nbsp;&nbsp;
	<input type="radio" name="exam" id="exam3" value="3"><label for="exam3">3</label></input>&nbsp;&nbsp;&nbsp;
	<input type="radio" name="exam" id="exam4" value="4"><label for="exam4">4</label></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="����" id="next"/>
</div>
<br/><br/>

<div style = "width:1000px; height:70px">
<div style = "width:250px; height:50px; float:left"></div>
	<input type="button" value="�Ϸ�" id="finish"/>
</div>

</body>
</html>