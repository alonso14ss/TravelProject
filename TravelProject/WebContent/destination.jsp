<%@page import="java.util.List"%>
<%@page import="com.travel.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="include/popupLogin.jsp" %>
<%List<Product> productList=(List)request.getAttribute("productList"); %>
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
   href="resources/assets/logo/favicon.png" />

<!--font-awesome.min.css-->
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css" />

<!--animate.css-->
<link rel="stylesheet" href="resources/assets/css/animate.css" />

<!--hover.css-->
<link rel="stylesheet" href="resources/assets/css/hover-min.css">

<!--datepicker.css-->
<link rel="stylesheet" href="resources/assets/css/datepicker.css">

<!--owl.carousel.css-->
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
   href="resources/assets/css/owl.theme.default.min.css" />

<!-- range css-->
<link rel="stylesheet" href="resources/assets/css/jquery-ui.min.css" />

<!--bootstrap.min.css-->
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css" />

<!-- bootsnav -->
<link rel="stylesheet" href="resources/assets/css/bootsnav.css" />

<!--style.css-->
<link rel="stylesheet" href="resources/assets/css/style.css" />

<!--responsive.css-->
<link rel="stylesheet" href="resources/assets/css/responsive.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
<script>
function goDetail(product_id){
	location.href="/shop/detail?product_id="+product_id;
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
         <div class="gallary-header text-center">
            <h2>여행지 목록</h2>
            <p>여행지를 선택하세요</p>
         </div>
         <!--/.gallery-header-->
         <div class="packages-content">
            <div class="row">

               <!-- 반복문 돌리면 그만큼 자동 줄바꿈되서 나타남  -->
               <%for(int i=0;i<productList.size();i++){%>
                  <%Product product =(Product)productList.get(i); %>
               <div class="col-md-4 col-sm-6">
                  <div class="single-package-item">
                     <img src="/data/<%=product.getFilename() %>"
                        alt="package-place">
                     <div class="single-package-item-txt">
                        <h3>
                           <%=product.getProduct_name() %> <span class="pull-right"><%=product.getPrice() %></span>
                        </h3>
                        <div class="packages-para">
                           <p>
                              <span> <i class="fa fa-angle-right"></i><%=product.getDepartureplace() %>
                              </span> <i class="fa fa-angle-right"></i><%=product.getArrivalplace() %>
                           </p>
                           <p>
                              <span> <i class="fa fa-angle-right"></i><%=product.getDeparturedate() %>
                              </span> <i class="fa fa-angle-right"></i><%=product.getArrivaldate() %>
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
                        <!--/.packages-review-->
                        <div class="about-btn">
                           <button class="about-view packages-btn" onclick="goDetail(<%=product.getProduct_id()%>)">상품 보기</button>
                        </div>
                        <!--/.about-btn-->
                     </div>
                     <!--/.single-package-item-txt-->
                  </div>
                  <!--/.single-package-item-->
               </div>
               <%
                  }
               %>
               <!-- 반복문 돌리면 그만큼 자동 줄바꿈되서 나타남  -->

            </div>
            <!--/.row-->
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




   <script src="resources/assets/js/jquery.js"></script>
   <!-- Include all compiled plugins (below), or include individual files as needed -->

   <!--modernizr.min.js-->
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>


   <!--bootstrap.min.js-->
   <script src="resources/assets/js/bootstrap.min.js"></script>

   <!-- bootsnav js -->
   <script src="resources/assets/js/bootsnav.js"></script>

   <!-- jquery.filterizr.min.js -->
   <script src="resources/assets/js/jquery.filterizr.min.js"></script>

   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

   <!--jquery-ui.min.js-->
   <script src="resources/assets/js/jquery-ui.min.js"></script>

   <!-- counter js -->
   <script src="resources/assets/js/jquery.counterup.min.js"></script>
   <script src="resources/assets/js/waypoints.min.js"></script>

   <!--owl.carousel.js-->
   <script src="resources/assets/js/owl.carousel.min.js"></script>

   <!-- jquery.sticky.js -->
   <script src="resources/assets/js/jquery.sticky.js"></script>

   <!--datepicker.js-->
   <script src="resources/assets/js/datepicker.js"></script>

   <!--Custom JS-->
   <script src="resources/assets/js/custom.js"></script>


</body>

</html>