<%@page import="prjdata.QuizUserDTO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="js/jquery-3.1.1.min.js"></script>
<script>
	function fnPageMove(page){
		$("#here").load(page);
	}
</script>
<link rel="stylesheet" href="assets/css/main.css" />
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
#header {
		display: -moz-flex;
		display: -webkit-flex;
		display: -ms-flex;
		display: flex;
		border-bottom: solid 5px #f56a6a;
		padding: 2em 0 0em 0;
		position: relative;
}
#main > .inner > section {
				padding: 2em 0 4em 0 ;
				border-top: solid 2px rgba(210, 215, 217, 0.75);
}
</style>
</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.jsp" class="logo"><strong style="font-size:60px;">QuizBook</strong></a>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="here" id="here">
									<header>
										<span class="image object" style="float:right;">
											<img src="images/pic10.jpg" alt="" />
										</span>	
										<h2>QuizBook에 오신 것을 환영합니다.<br />
										by FirstClass Team</h2>
	
										<!-- <p>다양한 퀴즈에 도전해보세요</p> -->
									</header>
																		
									<p>다양한 퀴즈에 도전하여, <br>명예의 전당에 이름을 올려보세요</p>
									
									<ul class="actions">
									<li><a href="javascript:fnPageMove('quiz/quiz_main.jsp')" class="button big">퀴즈도전</a></li>
									</ul>

									</div>
									
								</section>

							
							<!-- Section -->
								

						</div>	
					</div>

				<!-- Sidebar -->
				<div id="sidebar">
						<div class="inner">

							<!-- login -->

								<section id="login" class="alt">
<%         
			QuizUserDTO dto = (QuizUserDTO)request.getAttribute("dto");
			
			if(session.getAttribute("logged") == null){
%>	
									<form method="post" action="login.do">
										<input type="text" name="user_Id" id="user_Id" placeholder="Id" />
										<input type="password" name="user_Pw" id="user_Pw" placeholder="Password" /><br/>
										<button type="submit"><strong style="font-size:13px; color:red;">로그인</strong></button>
									</form>
									<a href="javascript:fnPageMove('mypage/join_new.jsp')" class="button"><strong style="font-size:13px; color:gray;">회원가입</strong></a>
<%			
			}
			else{
%>					
					<form method="post" action="login.do">
						<input type="hidden" name="logout" value="guest"/>
						<strong style="font-size:25px;font-weight:1000px"><%=session.getAttribute("logged")%></strong> 님 어서오세요!!
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
						<button type="submit"><strong style="font-size:13px; color:red;">로그아웃</strong></button>
						<a href="javascript:fnPageMove('mypage/my_main.jsp')" class="button"><strong style="font-size:13px; color:red;">마이페이지</strong></a><br/>
						<br/>
						보유포인트 : <%=dto.getUser_Current_Point()%>
						
					</form>
<%
			}
%>									
									
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									
									<form method="post" action="login.do">
										<input type="hidden" name="user_Id" value="<%=session.getAttribute("logged")%>"/>
										<input type="hidden" name="home" value="<%=session.getAttribute("logged")%>"/>
										<button type="submit"><strong style="font-size:18px; color:red;">집에가기</strong></button>
									</form>
									
									<ul>
										<li>
											<span class="opener"><a href="javascript:fnPageMove('quiz/quiz_main.jsp')"><strong style="font-size:18px;">퀴즈</strong></a></span>
											<ul>
												<li><a href="javascript:fnPageMove('quiz/quiz_sang.jsp')"><strong style="font-size:14px;">상식</strong></a></li>
												<li><a href="javascript:fnPageMove('quiz/quiz_nsense.jsp')"><strong style="font-size:14px;">넌센스</strong></a></li>
												<li><a href="javascript:fnPageMove('quiz/quiz_sports.jsp')"><strong style="font-size:14px;">스포츠</strong></a></li>
												<li><a href="javascript:fnPageMove('quiz/quiz_history.jsp')"><strong style="font-size:14px;">역사</strong></a></li>
											</ul>
										</li>
										<li>
											<span class="opener"><strong style="font-size:18px;">포인트몰</strong></span>
											<ul>
												<li><a href="javascript:fnPageMove('shop/shop_main.jsp')"><strong style="font-size:14px;">쇼핑몰</strong></a></li>
												<li><a href="javascript:fnPageMove('shop/shop_order.jsp')"><strong style="font-size:14px;">주문배송조회</strong></a></li>
												<li><a href="javascript:fnPageMove('shop/shop_cart.jsp')"><strong style="font-size:14px;">장바구니</strong></a></li>
												<li><a href="javascript:fnPageMove('shop/shop_point.jsp')"><strong style="font-size:14px;">포인트조회</strong></a></li>
											
											
											</ul>
										</li>
										<li>
											<span class="opener"><strong style="font-size:18px;">커뮤니티</strong></span>
											<ul>
												<li><a href="javascript:fnPageMove('f_board/free_board.jsp')"><strong style="font-size:14px;">자유게시판</strong></a></li>
												<li><a href="javascript:fnPageMove('n_board/notice_board.jsp')"><strong style="font-size:14px;">공지게시판</strong></a></li>
												<li><a href="javascript:fnPageMove('q_board/up_board.jsp')"><strong style="font-size:14px;">문제업로드</strong></a></li>
											</ul>
										</li>
										<li><a href="#"><strong style="font-size:18px;">놀이터</strong></a></li>
										
									</ul>
								</nav>
							
							


							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/ie/respond.min.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>