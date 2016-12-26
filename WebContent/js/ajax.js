var httpRequest = null;

function sendRequest(method, url, callback, param){
	httpRequest = new XMLHttpRequest();
	
	// GET으로 넘어오면 GET, 입력을 안해도 GET, 아니면 아닌대로 값 들어 감.
	var httpMethod = method ? method : "GET";
	
	// 오타 방지용 if문.
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	
	var httpUrl = url;
	
	var httpParam = (param == null || param == "") ? null : param;
	
	if(httpMethod == "GET" && httpParam != null){
		httpUrl = httpUrl + "?" + httpParam;
	}
	
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.onreadystatechange = callback;
	// POST 일 때 param 값을 넘기려면 header 설정을 해 줘야 한다.
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
	httpRequest.send(httpMethod == "POST" ? httpParam : null);
}