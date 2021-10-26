<%@page import="com.travel.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
		List<Product> productList = (List)request.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 폼</title>
<!--datepicker.css-->
<!-- favicon img -->
<link rel="shortcut icon" type="image/icon"
   href="/resources/assets/logo/favicon.png" />

<!--font-awesome.min.css-->
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css" />

<!--animate.css-->
<link rel="stylesheet" href="/resources/assets/css/animate.css" />

<!--hover.css-->
<link rel="stylesheet" href="/resources/assets/css/hover-min.css">

<!--datepicker.css-->
<link rel="stylesheet" href="/resources/assets/css/datepicker.css">

<!--owl.carousel.css-->
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
   href="/resources/assets/css/owl.theme.default.min.css" />

<!-- range css-->
<link rel="stylesheet" href="/resources/assets/css/jquery-ui.min.css" />

<!--bootstrap.min.css-->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />

<!-- bootsnav -->
<link rel="stylesheet" href="/resources/assets/css/bootsnav.css" />

<!--style.css-->
<link rel="stylesheet" href="/resources/assets/css/style.css" />

<!--responsive.css-->
<link rel="stylesheet" href="/resources/assets/css/responsive.css" />

<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
 <script src="/resources/assets/js/jquery.js"></script>
   <!-- Include all compiled plugins (below), or include individual files as needed -->

   <!--modernizr.min.js-->
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>


   <!--bootstrap.min.js-->
   <script src="/resources/assets/js/bootstrap.min.js"></script>

   <!-- bootsnav js -->
   <script src="/resources/assets/js/bootsnav.js"></script>

   <!-- jquery.filterizr.min.js -->
   <script src="/resources/assets/js/jquery.filterizr.min.js"></script>

   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

   <!--jquery-ui.min.js-->
   <script src="/resources/assets/js/jquery-ui.min.js"></script>

   <!-- counter js -->
   <script src="/resources/assets/js/jquery.counterup.min.js"></script>
   <script src="/resources/assets/js/waypoints.min.js"></script>

   <!--owl.carousel.js-->
   <script src="/resources/assets/js/owl.carousel.min.js"></script>

   <!-- jquery.sticky.js -->
   <script src="/resources/assets/js/jquery.sticky.js"></script>

   <!--datepicker.js-->
   <script src="/resources/assets/js/datepicker.js"></script>

   <!--Custom JS-->
   <script src="/resources/assets/js/custom.js"></script>
<script>

//파일 업로드 요청!! (동기방식)
function sendToEvent(){
	if($("#eventSelect").val()=="0"){
		alert("등록하실 이벤트의 종류를 선택하세요");
		return;
	}
	$("form").attr({
		"action":"/admin/event/regist",
		"method":"post"
	});
	$("form").submit();
}
</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>

<div class="container">
  <form>
  	<select name="product_id" id="eventSelect">
			<option value="0">이벤트 상품 선택</option>
			<%for(int i=0;i<productList.size();i++){%>
			<%Product product=productList.get(i); %>
			<option value="<%=product.getProduct_id()%>"><%=product.getProduct_name() %></option>
			<%}%>
		</select>  
    <input type="text" name="discount" placeholder="할인율(숫자로 입력)">
    <div class="single-tab-select-box">
     <h2>이벤트 시작 시간</h2>
       <div class="travel-check-icon">
      <input type="text" id="departuredate" name="starttimeOri" class="form-control"
         data-toggle="datepicker" placeholder="12 -01 - 2017 ">
                                       </div>
                                       <!-- /.travel-check-icon -->
                                       <select name="start_time">
										<%for(int i=0;i<24;i++){%>
										<option value="<%=i%>"><%=i+"시"%></option>
											<%}%>
										</select> 
                                    </div>
                                    
                                    
                                    <div class="single-tab-select-box">
     <h2>이벤트 종료 시간</h2>
       <div class="travel-check-icon">
      <input type="text" name="endtimeOri" class="form-control"
         data-toggle="datepicker" placeholder="12 -01 - 2017 ">
                                       </div>
                                       <!-- /.travel-check-icon -->
                                       <select name="end_time">
										<%for(int i=0;i<24;i++){%>
										<option value="<%=i%>"><%=i+"시"%></option>
											<%}%>
										</select> 
                                    </div>
                                    
    <p>
  </form>
  		<button type="button" onClick="sendToEvent()">이벤트 상품으로 등록</button>
		<button type="button" onClick="location.href='/admin/event/list';">목록 이동</button>
</div>

</body>
</html>






