<%@page import="com.travel.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
%>
<link rel="stylesheet" href="resources/assets/css/style.css"/>
<header class="top-area">
   <div class="header-area">
      <div class="container">
         <div class="row">
            <div class="col-sm-2">
               <div class="logo">
                  <a href="/"> tour<span>Nest</span>
                  </a>
               </div>
               <!-- /.logo-->
            </div>
            <!-- /.col-->
            <div class="col-sm-10">
               <div class="main-menu">

                  <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-header">
                     <button type="button" class="navbar-toggle"
                        data-toggle="collapse" data-target=".navbar-collapse">
                        <i class="fa fa-bars"></i>
                     </button>
                     <!-- / button-->
                  </div>
                  <!-- /.navbar-header-->
                  <div class="collapse navbar-collapse">
                     <ul class="nav navbar-nav navbar-right">
                        <li class="smooth-menu"><a href="#home">HOME</a></li>
                        <li class="smooth-menu"><a href="#pack">여행지 </a></li>
                        <li class="smooth-menu"><a href="#spo">특가 상품</a></li>
                        <li class="smooth-menu"><a onclick="location.href='/cs/list';" style="cursor:pointer">고객센터</a></li>
                        <li class="smooth-menu"><a onclick="location.href='/myPage';" style="cursor:pointer">My Page</a></li>
                        <%if(member==null){%> 
                        <li>
                           <button class="book-btn" onclick="document.getElementById('id01').style.display='block'">Login</button>
                        </li>
                         <%}else{%>
                         <li>
                           <button class="book-btn" onclick="location.href='/member/logout';">logout</button>
                        </li>
                         <%} %>
                        
                        <!--/.project-btn-->
                     </ul>
                  </div>
                  <!-- /.navbar-collapse -->
               </div>
               <!-- /.main-menu-->
            </div>
            <!-- /.col-->
         </div>
         <!-- /.row -->
         <div class="home-border"></div>
         <!-- /.home-border-->
      </div>
      <!-- /.container-->
   </div>
   <!-- /.header-area -->

</header>