<%@ page contentType="text/html; charset=UTF-8"%>
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
$(function(){
	
	//등록
	$($("button")[0]).click(function(){
		regist();
	});
	
	//목록
	$($("button")[1]).click(function(){
		location.href="/admin/product/list";
	});
	
	
});



//파일 업로드 요청!! (동기방식)
function regist(){
	
	//var a= $("#departuredate").val().substring(6)+$("#departuredate").val().substring(0,2)+ $("#departuredate").val().substring(3,5);
	$("form").attr({
		"action":"/admin/product/regist",
		"enctype":"multipart/form-data",
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
      <input type="text" name="product_name" placeholder="상품명">
    <input type="text" name="departureplace" placeholder="출발지">
    <input type="text" name="arrivalplace" placeholder="도착지">
    <input type="text" name="personal" placeholder="인원">
    <input type="text" name="price" placeholder="가격(숫자로 입력)">
    <input type="file" 	name="myFile" placeholder="사진쳐넣어">
    <div class="single-tab-select-box">
     <h2>출발날짜</h2>
       <div class="travel-check-icon">
      <input type="text" id="departuredate" name="departuredateOri" class="form-control"
         data-toggle="datepicker" placeholder="12 -01 - 2017 ">
                                       </div>
                                       <!-- /.travel-check-icon -->
                                    </div>
                                    
                                    
                                    <div class="single-tab-select-box">
     <h2>도착날짜</h2>
       <div class="travel-check-icon">
      <input type="text" name="arrivaldateOri" class="form-control"
         data-toggle="datepicker" placeholder="12 -01 - 2017 ">
                                       </div>
                                       <!-- /.travel-check-icon -->
                                    </div>
                                    
    <p>
    <button>상품등록</button>
    <button>상품목록</button>
  </form>
</div>

</body>
</html>






