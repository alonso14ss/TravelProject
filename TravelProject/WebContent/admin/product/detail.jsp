<%@page import="com.travel.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Product product = (Product)request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 폼</title>
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

function edit(){
	$("form").attr({
		"action":"/admin/product/edit",
		"enctype":"multipart/form-data",
		"method":"post"
	});
	$("form").submit();
}



//삭제 요청 product_id를 전송해야 한다!!
function del(){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			"url":"/admin/product/delete2?product_id=<%=product.getProduct_id()%>",
			"type":"get",
			success:function(res){
				if(res == "0"){
					$("form").attr({
						"action":"/admin/product/delete",
						"method":"post"
					});
					$("form").submit();
				}
				else if(res == "1"){
					if(confirm("이벤트에 등록된 상품입니다. 삭제시 이벤트도 삭제됩니다. 삭제하시겠습니까?")){
						$("form").attr({
							"action":"/admin/product/delete",
							"method":"post"
						});
						$("form").submit();
					}
					else{
						return;
					}
				}
			}
		});
	}
}
</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>

<div class="container">
  <form>
  	<input type="hidden" name="product_id" value="<%=product.getProduct_id()%>"/>
  	<input type="hidden" name="filename" value="<%=product.getFilename()%>"/>
 		 	
    <input type="text" name="product_name" value="<%=product.getProduct_name()%>">
    <input type="text" name="departureplace" value="<%=product.getDepartureplace()%>">
    <input type="text" name="arrivalplace" value="<%=product.getArrivalplace()%>">
    <input type="text" name="personal" value="<%=product.getPersonal()%>">
    <input type="text" name="price" value="<%=product.getPrice()%>">
    <input type="file" 	name="myFile" value="<%=product.getMyFile()%>" placeholder="상품명">
    <div class="single-tab-select-box">
     <h2>출발날짜</h2>
       <div class="travel-check-icon">
      <input type="text" id="departuredate" name="departuredateOri" class="form-control"
         data-toggle="datepicker" value="<%=product.getDeparturedateOri()%>">
                                       </div>
                                       <!-- /.travel-check-icon -->
                                    </div>
                                    
                                    
                                    <div class="single-tab-select-box">
     <h2>도착날짜</h2>
       <div class="travel-check-icon">
      <input type="text" name="arrivaldateOri" class="form-control"
         data-toggle="datepicker" value="<%=product.getArrivaldateOri()%>">
                                       </div>
                                       <!-- /.travel-check-icon -->
                                    </div>
    <p>
  </form>
  <button onClick="edit()">상품수정</button>
  <button onClick="del()">상품삭제</button>
  <button onClick="location.href='/admin/product/list';">상품 목록</button>

</div>

</body>
</html>






