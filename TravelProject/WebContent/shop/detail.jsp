<%@page import="com.travel.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/include/popupLogin.jsp"%>
<%Product product = (Product)request.getAttribute("product"); %>
<!doctype html>
<html class="no-js" lang="en">

<head>
<!-- META DATA -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!--font-family-->
<link href="https://fonts.googleapis.com/css?family=Rufina:400,700"
	rel="stylesheet" />

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" />

<!-- TITLE OF SITE -->
<title>Travel</title>

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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	//장바구니 담기 
	$($("button")[0]).click(function(){
		goCart();
	});
	
	//바로 구매하기
	$($("button")[1]).click(function(){
		buy();
	});
	
});

//장바구니에 상품 1개 담기!
function goCart(){
	//장바구니 담기 요청 
	$("form").attr({
		"action":"/shop/cart/regist",
		"method":"post"
	});
	$("form").submit();	
}

function buy(){
	//장바구니 담기 요청 
	$("form").attr({
		"action":"/shop/buy",
		"method":"post"
	});
	$("form").submit();	
}
</script>


</head>

<body>
	<!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
			your browser</a> to improve your experience and security.</p>
		<![endif]-->

	<!-- main-menu Start -->
	<div>
		<%@ include file="/include/header.jsp"%>
	</div>
	<!-- /.top-area-->
	<!-- main-menu End -->			
				<section id="pack" class="packages">
      <div class="container">
         <!--/.gallery-header-->
         <div class="packages-content">
				
				<div class="row">
				<form>
				<input type="hidden" name="product_id" 					value="<%=product.getProduct_id()%>"/>
	  			<input type="hidden" name="product_name" 				value="<%=product.getProduct_name()%>"/>
	  			<input type="hidden" name="price" 								value="<%=product.getPrice()%>"/>
	  			<input type="hidden" name="filename" 						value="<%=product.getFilename()%>"/>
	  			<input type="hidden" name="departuredate" 						value="<%=product.getDeparturedate()%>"/>
	  			<input type="hidden" name="arrivaldate" 						value="<%=product.getArrivaldate()%>"/>
	  			<input type="hidden" name="departureplace" 						value="<%=product.getDepartureplace()%>"/>
	  			<input type="hidden" name="arrivalplace" 						value="<%=product.getArrivalplace()%>"/>
	  			<input type="hidden" name="personal" 						value="<%=product.getPersonal()%>"/>
	  			
					<div class="col-sm-15">
						<div class="single-package-item2">
							<img src="/data/<%=product.getFilename() %>"
                     		   alt="package-place">
							<div class="single-package-item2-txt">
								<h3>
									<%=product.getProduct_name() %> <span class="pull-right"><%=product.getPrice() %></span>
								</h3>
								<div class="packages-para">
									<p>
										<span> <i class="fa fa-angle-right"></i> <%=product.getDeparturedate() %>
										</span> <i class="fa fa-angle-right"></i> <%=product.getArrivaldate() %>
									</p>
									<p>
										<span> <i class="fa fa-angle-right"></i> <%=product.getDepartureplace() %>
										</span> <i class="fa fa-angle-right"></i> <%=product.getArrivalplace() %>
									</p>
								</div>
								<!--/.packages-para-->
								<div class="packages-review">
									<p>
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <span>254 reviews</span>
									</p>
								</div>
								</form> 
								<!--/.packages-review-->
								<div class="pay_btn" style="float: right;">
									<button  class="about-view packages-btn" onClick="goCart()">장바구니</button>
	  								<button  class="about-view packages-btn" onClick="buy()">바로구매</button>
									
								</div>
								<!--/.about-btn-->
							</div>
							<!--/.single-package-item-txt-->
						</div>
						<!--/.single-package-item-->

					</div>

				</div>
			</div>
			<!--/.packages-content-->
		</div>
		<!--/.container-->

	</section>
	<!--/.packages-->
	<!--packages end-->


	<div id="footer"> 
	<%@ include file="/include/footer.jsp" %>
	</div>




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


</body>

</html>