<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="js/jquery-3.1.1.min.js"></script>
<script>
$( function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#user_Id" ).autocomplete({
      source: availableTags
    });
  } );
</script>

<style>
h1, h2, h3, h4, h5, h6{
	color:#3d4449;
	font-family: "맑은 고딕";
	font-weight:800;
	line-height:1.5;
	margin:0 0 1em 0;
} 
strong, b{
	color:#3d4449;
	font-weight: 600;
	font-family: "맑은 고딕";
}
</style>
</head>
<body>
<strong style="font-size:100px; color:indianred; font-weight:1000;"> ** 신규 회원 가입 ** </strong>
<br/><br/><br/><br/>

<form method="post" action="javascript:parent.fnPageMove('mypage/join_new_proc.jsp')">
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">ID</strong></div>
		<div style="flex:4"><input type="text" name="user_Id" id="user_Id" placeholder="ID"/></div>
		<div style="flex:5" id="corrId"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">PASSWORD1</strong></div>
		<div style="flex:4"><input type="password" style="width:100;" name="user_Password" id="user_Password" placeholder="PASSWORD1"/></div>
		<div style="flex:5"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">PASSWORD2</strong></div>
		<div style="flex:4"><input type="password" style="width:100;" name="pass_confirm" id="pass_confirm" placeholder="PASSWORD2"/></div>
		<div style="flex:5"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">NAME</strong></div>
		<div style="flex:4"><input type="text" style="width:100;" name="user_Name" id="user_Name" placeholder="NAME"/></div>
		<div style="flex:5"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">E-MAIL</strong></div>
		<div style="flex:4"><input type="email" class="form-control" style="width:100;" name="user_Email" id="user_Email" placeholder="E-MAIL"/></div>
		<div style="flex:5"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">PHONE</strong></div>
		<div style="flex:4"><input type="text" style="width:100;" name="user_Phone_Number" id="user_Phone_Number" placeholder="PHONE NUMBER"/></div>
		<div style="flex:5"></div>
	</div><br/>
	
	<div style="display:flex;">
		<div style="flex:1"><strong style="font-size:18px; color:darkblue;">ADDRESS</strong></div>
		<div style="flex:8"><input type="text" style="width:100;" name="user_Address" id="user_Address" placeholder="ADDRESS"/></div>
		<div style="flex:1"></div>
	</div>
	
	<br/><br/><br/>
	<label>*. QUIZ BOOK POLICY for USER.</label>
	<select multiple class="form-control" style="width:1000px; height:600px;">
	  <option>1. 관리자는 왕이다.</option>
	  <option>2</option>
	  <option>3</option>
	  <option>4</option>
	  <option>5</option>
	</select>
	<div class="checkbox">
		<input type="checkbox" id="policy" name="policy" value="policy"/>
		<label for="policy">약관에 동의 함.</label>
	</div>
	<button type="submit"><strong style="font-size:18px; color:DarkMagenta;">회원 가입</strong></button>
</form>
</body>
</html>