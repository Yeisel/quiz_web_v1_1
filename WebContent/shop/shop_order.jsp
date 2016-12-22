<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
	<body>
		<div style="display:flex; border:1px solid #eaeaea">
			<div style="flex:1;">
				<div><br/>
					<h3 align="center">조회기간</h3>
				</div>
			</div>
			<div style="flex:8">
				<div class="QnADate" style="display:flex">			
					<select name="startYY" id="startYY" style="width:75px; height:25px">
						<option value='2016'  selected>2016</option>
						<option value='2015' >2015</option>
						<option value='2014' >2014</option>
						<option value='2013' >2013</option>
						<option value='2012' >2012</option>
						<option value='2011' >2011</option>
						<option value='2010' >2010</option>
						<option value='2009' >2009</option>
						<option value='2008' >2008</option>
						<option value='2007' >2007</option>
						<option value='2006' >2006</option>
					</select>
					<label for="startYY">년</label>
					<select name="startMM" id="startMM" style="width:60px; height:25px">
						<option value='01' >1</option>
						<option value='02' >2</option>
						<option value='03' >3</option>
						<option value='04' >4</option>
						<option value='05' >5</option>
						<option value='06' >6</option>
						<option value='07' >7</option>
						<option value='08' >8</option>
						<option value='09' >9</option>
						<option value='10'  selected>10</option>
						<option value='11' >11</option>
						<option value='12' >12</option>
				
				    </select>
				    <label for="startMM">월</label>
					<select name="startDD" id="startDD" style="width:60px; height:25px">
						<option value='01' >1</option>
						<option value='02' >2</option>
						<option value='03' >3</option>
						<option value='04' >4</option>
						<option value='05' >5</option>
						<option value='06' >6</option>
						<option value='07' >7</option>
						<option value='08' >8</option>
						<option value='09' >9</option>
						<option value='10' >10</option>
						<option value='11' >11</option>
						<option value='12' >12</option>
						<option value='13' >13</option>
						<option value='14' >14</option>
						<option value='15' >15</option>
						<option value='16' >16</option>
						<option value='17' >17</option>
						<option value='18' >18</option>
						<option value='19' >19</option>
						<option value='20' >20</option>
						<option value='21'  selected>21</option>
						<option value='22' >22</option>
						<option value='23' >23</option>
						<option value='24' >24</option>
						<option value='25' >25</option>
						<option value='26' >26</option>
						<option value='27' >27</option>
						<option value='28' >28</option>
						<option value='29' >29</option>
						<option value='30' >30</option>
						<option value='31' >31</option>
					</select>
					<label for="startDD">일</label>&nbsp;~&nbsp;
					<select name="endYY" id="endYY"  style="width:75px; height:25px">
						<option value='2016'  selected>2016</option>
						<option value='2015' >2015</option>
						<option value='2014' >2014</option>
						<option value='2013' >2013</option>
						<option value='2012' >2012</option>
						<option value='2011' >2011</option>
						<option value='2010' >2010</option>
						<option value='2009' >2009</option>
						<option value='2008' >2008</option>
						<option value='2007' >2007</option>
						<option value='2006' >2006</option>
				
					 </select>
					<label for="endYY">년</label>
					<select name="endMM" id="endMM" style="width:60px; height:25px">
						<option value='01' >1</option>
						<option value='02' >2</option>
						<option value='03' >3</option>
						<option value='04' >4</option>
						<option value='05' >5</option>
						<option value='06' >6</option>
						<option value='07' >7</option>
						<option value='08' >8</option>
						<option value='09' >9</option>
						<option value='10' >10</option>
						<option value='11' >11</option>
						<option value='12'  selected>12</option>
					</select>
					<label for="endMM">월</label>
					<select name="endDD" id="endDD" style="width:60px; height:25px" >
						<option value='01' >1</option>
						<option value='02' >2</option>
						<option value='03' >3</option>
						<option value='04' >4</option>
						<option value='05' >5</option>
						<option value='06' >6</option>
						<option value='07' >7</option>
						<option value='08' >8</option>
						<option value='09' >9</option>
						<option value='10' >10</option>
						<option value='11' >11</option>
						<option value='12' >12</option>
						<option value='13' >13</option>
						<option value='14' >14</option>
						<option value='15' >15</option>
						<option value='16' >16</option>
						<option value='17' >17</option>
						<option value='18' >18</option>
						<option value='19' >19</option>
						<option value='20'  selected>20</option>
						<option value='21' >21</option>
						<option value='22' >22</option>
						<option value='23' >23</option>
						<option value='24' >24</option>
						<option value='25' >25</option>
						<option value='26' >26</option>
						<option value='27' >27</option>
						<option value='28' >28</option>
						<option value='29' >29</option>
						<option value='30' >30</option>
						<option value='31' >31</option>
					</select>
					<label for="endDD">일&nbsp;</label>
				</div>
				<div class="QnAtxt" style="display:flex">
					<div style="flex:1" align="center"><h3>주문상품명</h3></div>
					<div style="flex:1; margin-right:10px;"><input type="text" id="searchBarPrdNm" name="searchBarPrdNm" placeholder="상품명입력"></div>
					<div style="flex:6"><input type="button" class="bt_srh" onClick="setReadList(1);" value="조회하기"></div>
				</div>
			</div>
		</div>
		
		<div class="sTitwrap">
			<h3 class="cp_intit">주문내역 조회</h3>
		</div>
		
		<div style="display:flex; background-color:rgba(230, 235, 237, 0.25);border: solid 1px rgba(210, 215, 217, 0.75)">
			<div style="flex:1.5; ">주문일자</div>
			<div style="flex:3">주문상품정보</div>
			<div style="flex:1">상품금액(수량)</div>
			<div style="flex:1">배송비</div>
			<div style="flex:1">주문상태</div>
		</div>
		<div style="display:flex; border: solid 1px rgba(210, 215, 217, 0.75)">
			<div style="flex:1.5; "><%="주문일자"%></div>
			<div style="flex:3"><%="주문상품정보"%></div>
			<div style="flex:1"><%="상품금액(수량)"%></div>
			<div style="flex:1"><%="배송비"%></div>
			<div style="flex:1"><%="주문상태"%></div>
		</div>
		<div style="margin-top:20px; display:flex">
			<div style="flex:1"><a href="index.jsp"><input type="button" value="처음으로" /></a></div>
			<div style="flex:1; float:right"><a href="javascript:fnPageMove('shop/shop_detail.jsp')"><input type="button" value="상품목록" /></a></div>
			
		</div>
	</body>
</html>