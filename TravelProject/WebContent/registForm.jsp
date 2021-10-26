<%@page import="com.travel.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
   Product product = (Product) request.getAttribute("product");
%>
<!doctype html>
<html class="no-js" lang="en">

<head>

<style>
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

input[type=email] {
   width: 100%;
   padding: 12px;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   margin-top: 6px;
   margin-bottom: 16px;
   resize: vertical;
}

button {
   background-color: #4CAF50;
   color: white;
   padding: 12px 20px;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

button:hover {
   background-color: #45a049;
}

#registForm {
   border-radius: 5px;
   background-color: #f2f2f2;
   padding: 20px;
   margin-top: 100px;
   float:left;
   width:100%;
}

#header {
   float:left;
   margin-top: 0px;
}
</style>


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

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function membership() {
   if($("#oripassword").val()!=$("#rePassword").val()){
      alert("비밀번호가 일치하지 않습니다");
   }else{
   $("form").attr({
      "action" : "/member/regist",
      "method" : "post"
   });
   $("form").submit();      
   }
}
</script>


</head>

<body>
   <div id="header">
      <%@ include file="/include/header.jsp"%>
      <%@ include file="/include/popupLogin.jsp"%>
   </div>
   <div id="registForm">
      <h3 style="text-align: center;">회원가입</h3>
      <form>
            <input type="text" name="id" placeholder="아이디 입력"> 
            <input type="password" id ="oripassword" name="password" placeholder="비밀번호 입력">
            <input type="password" id ="rePassword" name="rePassword" placeholder="비밀번호 재입력">
            <input type="text" name="name" placeholder="이름 입력"> 
            <input type="email" name="email" placeholder="이메일 입력"> 
            <input type="text" name="phone" placeholder="전화번호 입력">
            <input type="text" name="addr" placeholder="주소입력">
      </form>
      <button type="button" onclick="membership()">회원가입</button>
   </div>


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