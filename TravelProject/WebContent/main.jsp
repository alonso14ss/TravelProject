<%@page import="com.travel.domain.Event"%>
<%@page import="java.util.List"%>
<%@page import="com.travel.domain.Product"%>
<%@ include file="include/popupLogin.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%List<Product> productList=(List)request.getAttribute("productList");
    List<Event> eventList = (List)request.getAttribute("eventList");
    Event event = new Event();
    if(eventList.size() > 1){
    event = eventList.get(1);
    }else{
       event.setDiscount(0);
       event.setEnd_time(2099010100);
       event.setStart_time(2000010100);
       event.setEvent_id(0);
       
       Product product = new Product();
       product.setArrivaldate(20990101);
       product.setArrivalplace("");
       product.setDeparturedate(20990101);
       product.setDepartureplace("");
       product.setPrice(0);
       product.setProduct_name("없음");
       product.setProduct_id(0);
       
       event.setProduct(product);
    }
    boolean eventFlag = false;
%>

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
<link rel="stylesheet" href="/resources/assets/css/style.css?ver=1" />

<!--responsive.css-->
<link rel="stylesheet" href="/resources/assets/css/responsive.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
<style>
#spo{
<%if(eventFlag){%>
    background: url(/data/<%=event.getProduct().getFilename()%>)no-repeat center;
    <%} else{%>
    background:black;
    <%}%>
}
</style>
      
<script>
$(function(){
   makeTimer();
});

   function goSearch(){
      if($("#searchDepartureplace").val()=="0"){
        alert("출발지가 존재하지 않습니다.");
        return;
      }else if($("#searchArrivalplace").val()=="0"){
         alert("도착지가 존재하지 않습니다.");
           return;   
      }else{
         $("#searchPrice").val($("#amount").val());
         $("#search").attr({
            "action":"/searchDestination",
            "method":"post"
         });
         $("#search").submit();
      }
   }

    function goDetail(product_id){
    location.href="/shop/detail?product_id="+product_id;
   }
    
    function goDetailEvent(product_id){
        <%if(event.getProduct().getProduct_id() == 0){ %>
            alert("이벤트가 존재하지 않습니다");
            return;
        <%}else{%>
        location.href="/shop/detail?product_id="+product_id;
        <%}%>
       }
    
    function goSearchArrivalplace(){
       $.ajax({
            "url":"/product/search?departureplace="+$("#searchDepartureplace").val(),
            "type":"get",
            success:function(res){ //String의 리스트로온다
               $("#searchArrivalplace").empty();
               for(var count = 0; count < res.length; count++){                
                  $('#searchArrivalplace').append("<option value="+res[count]+">"+res[count]+"</option>");
                           }
            }
         });
    }
    
    
     function makeTimer() {
      
      var now = new Date();
      
        if(now.getMonth()<9){
           var nowMonth = "0" + String(now.getMonth()+1);
        }else{
           nowMonth = String(now.getMonth()+1);
        }
        if(now.getDate()<10){
           var nowDate = "0" + String(now.getDate());
        }else{
           nowDate = String(now.getDate());
        }
        if(now.getHours()<10){
           var nowHours = "0" + String(now.getHours());
        }else{
           nowHours = String(now.getHours());
        }
      var nowTime =parseInt(String(now.getFullYear()) +nowMonth + nowDate + nowHours) ;

   
      var eventYear = <%=event.getEnd_time()/1000000%>;
      var eventMonth =<%=(event.getEnd_time()/10000)%100%>;
      var eventDate =<%=(event.getEnd_time()/100)%100%>;
      var eventHours =<%=(event.getEnd_time())%100%>;
      
       var endTime = new Date(eventYear,eventMonth-1,eventDate,eventHours);    //이벤트종료시간이며 끝나고 다음이벤트가있을시 다음거로변경
        endTime = (Date.parse(endTime)) / 1000;
        now = (Date.parse(now) / 1000);
      
       if(eventMonth < 9){
          eventMonth = "0" + String(eventMonth);
           }else{
              eventMonth = String(eventMonth);
           }
           if(eventDate < 10){
              eventDate = "0" + String(eventDate);
           }else{
              eventDate = String(eventDate);
           }
           if(eventHours < 10){
              eventHours = "0" + String(eventHours);
           }else{
              eventHours = String(eventHours);
           }
      
      var eventTime =parseInt(String(eventYear) + String(eventMonth) + String(eventDate) + String(eventHours)); 
      
      //이벤트 종료시간 < 현재시간   ======> 이벤트 삭제
      <%if(event.getEvent_id() != 0){%>
      if(eventTime < nowTime){
         $.ajax({
            "url":"/admin/event/delete?event_id=<%=event.getEvent_id()%>",
            "type":"get",
            success:function(res){
               location.href="/";
               
            }
         });
      }
      <%}%>
      
      
      
      var eventStartYear = <%=event.getStart_time()/1000000%>;
      var eventStartMonth =<%=(event.getStart_time()/10000)%100%>;
      var eventStartDate =<%=(event.getStart_time()/100)%100%>;
      var eventStartHours =<%=(event.getStart_time())%100%>;
      
       if(eventStartMonth < 9){
          eventStartMonth = "0" + String(eventStartMonth);
           }else{
              eventStartMonth = String(eventStartMonth);
           }
           if(eventStartDate < 10){
              eventStartDate = "0" + String(eventStartDate);
           }else{
              eventStartDate = String(eventStartDate);
           }
           if(eventStartHours < 10){
             eventStartHours = "0" + String(eventStartHours);
           }else{
              eventStartHours = String(eventStartHours);
           }
      
      
      var eventStartTime =parseInt(String(eventYear) + String(eventMonth) + String(eventDate) + String(eventHours)); 
      
      
      //현재시간 < 이벤트시작시간   =====> 이벤트 없음
      if(nowTime < eventStartTime){ //이벤트중
         <%eventFlag = true;%>
      }else{ //이벤트종료
         <%eventFlag = false;%>
      }
      
        // var endTime = new Date(eventYear,eventMonth,eventDate,eventHours);    //이벤트종료시간이며 끝나고 다음이벤트가있을시 다음거로변경
         //var endTime = (Date.parse(endTime)) / 1000;
         //var now = (Date.parse(now) / 1000);

         var timeLeft = endTime - now;

         var days = Math.floor(timeLeft / 86400); 
         var hours = Math.floor((timeLeft - (days * 86400)) / 3600);
         var minutes = Math.floor((timeLeft - (days * 86400) - (hours * 3600 )) / 60);
         var seconds = Math.floor((timeLeft - (days * 86400) - (hours * 3600) - (minutes * 60)));

         if (hours < "10") { hours = "0" + hours; }
         if (minutes < "10") { minutes = "0" + minutes; }
         if (seconds < "10") { seconds = "0" + seconds; }

         $("#days").html(days + '<span class="camp">Days</span>');
         $("#hours").html(hours + '<span class="camp">Hour</span>');
         $("#minutes").html(minutes + '<span class="camp">Minute</span>');
         $("#seconds").html(seconds + '<span class="camp">Second</span>');
 }
 
 setInterval(function() { makeTimer(); }, 1000);
    
    
 
 
</script>
</head>

<body>

   <div>
      <%@ include file="/include/header.jsp"%>
   </div>
   
   <!--about-us start -->
   <section id="home" class="about-us">
      <div class="container">
         <div class="about-us-content">
            <div class="row">
               <div class="col-sm-12">
                  <div class="single-about-us">
                     <div class="about-us-txt">
                        <h2>전세계의 아름다움을 체험하세요</h2>
                        <div class="about-btn">
                           <button class="about-view" onclick="location.href='/destination';">체험하기</button>
                        </div>
                        <!--/.about-btn-->
                     </div>
                     <!--/.about-us-txt-->
                  </div>
                  <!--/.single-about-us-->
               </div>
               <!--/.col-->
               <div class="col-sm-0">
                  <div class="single-about-us"></div>
                  <!--/.single-about-us-->
               </div>
               <!--/.col-->
            </div>
            <!--/.row-->
         </div>
         <!--/.about-us-content-->
      </div>
      <!--/.container-->

   </section>
   <!--/.about-us-->
   <!--about-us end -->

<form id="search">
   <!--travel-box start-->
   <section class="travel-box">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="single-travel-boxes">
                  <div id="desc-tabs" class="desc-tabs">

                     <ul class="nav nav-tabs" role="tablist">

                        <li role="presentation" class="active"><a href="#tours"
                           aria-controls="tours" role="tab" data-toggle="tab"> <i
                              class="fa fa-tree"></i> tours
                        </a></li>
                     </ul>

                     <!-- Tab panes -->
                     <div class="tab-content">

                        <div role="tabpanel" class="tab-pane active fade in" id="tours">
                           <div class="tab-para">

                              <div class="row">
                                 <div class="col-lg-4 col-md-4 col-sm-12">
                                    <div class="single-tab-select-box">

                                       <h2>destination</h2>

                                       <div class="travel-select-icon">
                                          <select class="form-control " id="searchDepartureplace" onchange="goSearchArrivalplace()" name="departureplace">

                                             <option value="0">출발 지역 선택</option>
                              <%for(int i=0;i<productList.size();i++){%>
                              <%Product product=productList.get(i); 
                                  boolean flag = true;
                                 for(int j = 0 ; j < i ; j++){
                                    Product objP = productList.get(j);
                                    if(objP.getDepartureplace().equals(product.getDepartureplace())){
                                       flag=false;
                                       break;
                                    }
                                 }
                                 if(flag){
                              %>
                              <option value="<%=product.getDepartureplace() %>"><%=product.getDepartureplace()%></option>
                              <%}}%>

                                          </select>
                                          <!-- /.select-->
                                       </div>
                                       <!-- /.travel-select-icon -->

                                       <div class="travel-select-icon">
                                          <select class="form-control " id="searchArrivalplace" name="arrivalplace">

                                             <option value="0">도착 지역 선택</option>

                                          </select>
                                          <!-- /.select-->
                                       </div>
                                       <!-- /.travel-select-icon -->

                                    </div>
                                    <!--/.single-tab-select-box-->
                                 </div>
                                 <!--/.col-->

                                 <div class="col-lg-2 col-md-3 col-sm-4">
                                    <div class="single-tab-select-box">
                                       <h2>check in</h2>
                                       <div class="travel-check-icon">
                                             <input type="text" name="departuredateOri" class="form-control"
                                                data-toggle="datepicker" value="08/14/2020">
                                       </div>
                                       <!-- /.travel-check-icon -->
                                    </div>
                                    <!--/.single-tab-select-box-->
                                 </div>
                                 <!--/.col-->

                                 <div class="col-lg-2 col-md-3 col-sm-4">
                                    <div class="single-tab-select-box">
                                       <h2>check out</h2>
                                       <div class="travel-check-icon">
                                             <input type="text" name="arrivaldateOri" class="form-control"
                                                data-toggle="datepicker" value="08/31/2020">
                                       </div>
                                       <!-- /.travel-check-icon -->
                                    </div>
                                    <!--/.single-tab-select-box-->
                                 </div>
                                 <!--/.col-->

                                 

                                 <div class="col-lg-2 col-md-1 col-sm-4">
                                    <div class="single-tab-select-box">
                                       <h2>members</h2>
                                       <div class="travel-select-icon">
                                          <select class="form-control " name="personal">

                                             <option value="1">1</option>
                                             <!-- /.option-->

                                             <option value="2">2</option>
                                             <!-- /.option-->

                                             <option value="3">3</option>
                                             <!-- /.option-->
                                             <option value="4">4</option>
                                             <option value="5">5</option>
                                             <!-- /.option-->

                                          </select>
                                          <!-- /.select-->
                                       </div>
                                       <!-- /.travel-select-icon -->
                                    </div>
                                    <!--/.single-tab-select-box-->
                                 </div>
                                 <!--/.col-->

                              </div>
                              <!--/.row-->

                              <div class="row">
                                 <div class="col-sm-5">
                                    <div class="travel-budget">
                                       <div class="row">
                                          <div class="col-md-3 col-sm-4">
                                             <h3>budget :</h3>
                                          </div>
                                          <!--/.col-->
                                          <div class="co-md-9 col-sm-8">
                                             <div class="travel-filter">
                                                <div class="info_widget">
                                                   <div class="price_filter">

                                                      <div id="slider-range"></div>
                                                      <!--/.slider-range-->

                                                      <div class="price_slider_amount">
                                                         <input type="text" id="amount" 
                                                            placeholder="Add Your Price" />
                                                          <input type="hidden" name="searchPrice" id="searchPrice"/>
                                                      </div>
                                                      <!--/.price_slider_amount-->
                                                   </div>
                                                   <!--/.price-filter-->
                                                </div>
                                                <!--/.info_widget-->
                                             </div>
                                             <!--/.travel-filter-->
                                          </div>
                                          <!--/.col-->
                                       </div>
                                       <!--/.row-->
                                    </div>
                                    <!--/.travel-budget-->
                                 </div>
                                
                                 <!--/.col-->
                                 <div class="clo-sm-7">
                                    <div class="about-btn travel-mrt-0 pull-right">
                                       <button type="button" class="about-view travel-btn" onclick="goSearch()">검색 하기</button>
                                       <!--/.travel-btn-->
                                    </div>
                                    <!--/.about-btn-->
                                 </div>
                                 <!--/.col-->

                              </div>
                              <!--/.row-->

                           </div>
                           <!--/.tab-para-->

                        </div>
                        <!--/.tabpannel-->
                  
                     </div>
                     <!--/.tab content-->
                  </div>
                  <!--/.desc-tabs-->
               </div>
               <!--/.single-travel-box-->
            </div>
            <!--/.col-->
         </div>
         <!--/.row-->
      </div>
      <!--/.container-->

   </section>
   </form>
   <!--/.travel-box-->
   <!--travel-box end-->

   <!--packages start-->
   <section id="pack" class="packages">
      <div class="container">
         <div class="gallary-header text-center">
            <h2>여행 패키지</h2>
            <p></p>
         </div>
         <!--/.gallery-header-->
         <div class="packages-content">
            <div class="row">
            <!-- 반복문 돌리면 그만큼 자동 줄바꿈되서 나타남  -->
               <%for(int i=0;i<productList.size();i++){%>
               <%if(i>5) break; %>
                  <%Product product =(Product)productList.get(i); %>
                  
               <div class="col-md-4 col-sm-6">
                  <div class="single-package-item">
                     <img src="/data/<%=product.getFilename() %>"
                        alt="package-place">
                     <div class="single-package-item-txt">
                        <h3>
                           <%=product.getProduct_name() %> <span class="pull-right"><%="가격 : "+product.getPrice()+"원" %></span>
                        </h3>
                        <div class="packages-para">
                           <p>
                              <span> <i class="fa fa-angle-right"></i> <%="출발장소 : "+product.getDepartureplace() %>
                              </span> <i class="fa fa-angle-right"></i><%="여행장소 : "+product.getArrivalplace() %>
                           </p>
                           <p>
                              <span> <i class="fa fa-angle-right"></i><%="출발 : "+product.getDeparturedate()/10000+"년"+(product.getDeparturedate()%10000)/100+"월"+(product.getDeparturedate()%10000)%100+"일" %>
                              </span> <i class="fa fa-angle-right"></i><%="복귀 : "+product.getArrivaldate()/10000+"년"+(product.getArrivaldate()%10000)/100+"월"+(product.getArrivaldate()%10000)%100+"일"  %>
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
            </div>
            <div class="moreDesti">
               <button class="about-view packages-btn" onclick="location.href='/destination';">더 보기</button>
            </div>
            <!--/.row-->
         </div>
         <!--/.packages-content-->
      </div>
      <!--/.container-->

   </section>
   <!--/.packages-->
   <!--packages end-->





   <!--special-offer start-->
   <section id="spo" class="special-offer">
      <div class="container">
         <div class="special-offer-content">
            <div class="row">
               <div class="col-sm-8">
                  <div class="single-special-offer">
                     <div class="single-special-offer-txt">
                        <h2><%=event.getProduct().getProduct_name()%></h2>
                        <div class="packages-review special-offer-review">
                           <p>
                              <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                 class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                 class="fa fa-star"></i> <span>2544 review</span>
                           </p>
                        </div>
                        <!--/.packages-review-->
                        <div class="packages-para special-offer-para">
                           <p>
                              <span> <i class="fa fa-angle-right"></i> <%="출발장소 : "+event.getProduct().getDepartureplace() %>
                              </span> <i class="fa fa-angle-right"></i><%="여행장소 : "+event.getProduct().getArrivalplace() %>
                           </p>
                           <p>
                              <span> <i class="fa fa-angle-right"></i><%="출발 : "+event.getProduct().getDeparturedate()/10000+"년"+(event.getProduct().getDeparturedate()%10000)/100+"월"+(event.getProduct().getDeparturedate()%10000)%100+"일" %>
                              </span> <i class="fa fa-angle-right"></i><%="복귀 : "+event.getProduct().getArrivaldate()/10000+"년"+(event.getProduct().getArrivaldate()%10000)/100+"월"+(event.getProduct().getArrivaldate()%10000)%100+"일"  %>
                           </p>
                        </div>
                        <!--/.packages-para-->
                        <div class="offer-btn-group">
                           <div class="about-btn">
                           <button class="about-view packages-btn" onclick="goDetailEvent(<%=event.getProduct().getProduct_id()%>)">상품 보기</button>
                        </div>
                           <!--/.about-btn-->
                           
                        </div>
                        <!--/.offer-btn-group-->
                        
                     </div>
                     <!--/.single-special-offer-txt-->
                     
                     

    <!--discount-offer start-->                  
                     <div class="campaign-timer">
                        <div id="timer">
                           <div class="time time-after" id="days">
                              <span></span>
                           </div><!--/.time-->
                           <div class="time time-after" id="hours">

                           </div><!--/.time-->
                           <div class="time time-after" id="minutes">

                           </div><!--/.time-->
                           <div class="time" id="seconds">

                           </div><!--/.time-->
                        </div><!--/.timer-->
                     </div><!--/.campaign-timer-->


                     
                     
                  </div>
                  <!--/.single-special-offer-->
               </div>
               <!--/.col-->
               <div class="col-sm-4">
                  <div class="single-special-offer">
                     <div class="single-special-offer-bg">
                        <img src="/resources/assets/images/offer/offer-shape.png"
                           alt="offer-shape">
                     </div>
                     <!--/.single-special-offer-bg-->
                     <div class="single-special-shape-txt">
                        <h3>special offer</h3>
                        <h4>
                           <span><%=event.getDiscount() %>%</span><br>off
                        </h4>
                        <p>
                           <span><%=(int)((event.getProduct().getPrice_ori()) * (100-(event.getDiscount())) / 100) %></span><br>reguler <%=event.getProduct().getPrice_ori() %>
                        </p>
                     </div>
                     <!--/.single-special-shape-txt-->
                  </div>
                  <!--/.single-special-offer-->
               </div>
               <!--/.col-->
            </div>
            <!--/.row-->
         </div>
         <!--/.special-offer-content-->
      </div>
      <!--/.container-->

   </section>
   <!--/.special-offer end-->
   <!--special-offer end-->

   <div id="footer"> 
   <%@ include file="/include/footer.jsp" %>
   </div>



   <script src="resources/assets/js/jquery.js"></script>
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
   <script src="/resources/assets/js/custom.js?v=<%=System.currentTimeMillis() %>">
   </script>

   

</body>

</html>