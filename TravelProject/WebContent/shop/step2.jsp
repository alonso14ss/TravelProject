<%@page import="com.travel.domain.Member"%>
<%@page import="com.travel.domain.OrderSummary"%>
<%@page import="com.travel.domain.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.travel.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   List<Cart> cartList=(List)session.getAttribute("cartList");

   if(session.getAttribute("cartOne")!=null){
      cartList = (List)session.getAttribute("cartOne");
   }
   
   Member obj=(Member)session.getAttribute("member");
   OrderSummary orderSummary=(OrderSummary)request.getAttribute("orderSummary");
   //out.print(orderSummary.getSame());
%>
<!DOCTYPE html>
<html>
<head>
<title>Travel Project</title>
<meta charset="utf-8">
<%@ page contentType="text/html; charset=UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
.pic{
   width:50%;
   height:250px;
   background:yellow;
   float:left;
   margin-top:50px;
}
.spec{
   width:50%;
   height:250px;
   background:green;
   float:left;
   margin-top:50px;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
  margin-top:50px;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
#buyer{
   width:95%;
   border:5px solid red;
   display:inline-block;
}

input[type='text']{
   border:0px;
   background:yellow;
}

#noWhere {
   height:120px;
}

</style>

<link rel="shortcut icon" type="image/icon"
   href="/resources/assets/logo/favicon.png" />

<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="/resources/assets/css/animate.css" />
<link rel="stylesheet" href="/resources/assets/css/hover-min.css">
<link rel="stylesheet" href="/resources/assets/css/datepicker.css">
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.min.css" />
<link rel="stylesheet" href="/resources/assets/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/css/bootsnav.css" />
<link rel="stylesheet" href="/resources/assets/css/style.css?ver=1" />
<link rel="stylesheet" href="/resources/assets/css/responsive.css" />

<script>
//결제 3단계 요청하기 (결제 완료 짓기!!)
function pay(){
   if(!confirm("입력하신 정보로 결제할까요?")){
      return;
   }
   $("form").attr({
      "action":"/shop/step3", 
      "method":"post"
   });
   $("form").submit();
}
</script>
</head>
<body>
   <%@ include file="/include/header.jsp" %>
   <div id="noWhere"></div>
<div>
  <div id="content">
      <!-- 장바구니 표 -->
      <h2>결제정보 확인</h2>
      
      <table width="100%">
        <tr>
          <th>이미지</th>
          <th>상품명</th>
          <th>출발장소</th>
          <th>도착장소</th>
          <th>출발시간</th>
          <th>복귀시간</th>
          <th>1인당 가격</th>
          <th>인원</th>
        </tr>
        <%int totalBuy=0; %>
      <%for(int i=0;i<cartList.size();i++){%>
      <%Cart cart = cartList.get(i); %>
      <%totalBuy+=(cart.getPrice()*cart.getEa()); %>        
        <tr>
          <td><img src="/data/<%=cart.getFilename() %>" width="45px"/></td>
          <td><%=cart.getProduct_name() %></td>
          <td><%=cart.getDepartureplace() %></td>
          <td><%=cart.getArrivalplace() %></td>
          <td><%=cart.getDeparturedate()/10000+"년"+(cart.getDeparturedate()%10000)/100+"월"+(cart.getDeparturedate()%10000)%100+"일"%></td>
          <td><%=cart.getArrivaldate()/10000+"년"+(cart.getArrivaldate()%10000)/100+"월"+(cart.getArrivaldate()%10000)%100+"일"%></td>
          <td><%=cart.getPrice() %></td>
          <td><%=cart.getEa() %> 명</td>
        </tr>
        <%}%>
        <tr>
           <td colspan="8" style="text-align:right">구매 총액 : <%=totalBuy %>원</td>
        </tr>
      </table>      
      
      
     <form>
        <div id="buyer">
          <input type="text" readonly name="cname" value="<%=obj.getName()%>">
          <input type="text" readonly name="cphone" value="<%=obj.getPhone()%>">
          <input type="text" readonly name="email" value="<%=obj.getEmail()%>">
          <input type="text" readonly name="pay_method" value="<%=orderSummary.getPay_method()%>">
          <input type="text" readonly name="total_pay" value="<%=totalBuy%>">
       </div>
       
     </form>
     
     <input type="button" value="결제하기" onClick="pay()"/>
     <input type="button" value="이전단계" onClick="history.back();"/>
     
  </div>
</div>
<%@ include file="/include/footer.jsp" %>

<script src="/resources/assets/js/jquery.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
   <script src="/resources/assets/js/bootstrap.min.js"></script>
   <script src="/resources/assets/js/bootsnav.js"></script>
   <script src="/resources/assets/js/jquery.filterizr.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
   <script src="/resources/assets/js/jquery-ui.min.js"></script>
   <script src="/resources/assets/js/jquery.counterup.min.js"></script>
   <script src="/resources/assets/js/waypoints.min.js"></script>
   <script src="/resources/assets/js/owl.carousel.min.js"></script>
   <script src="/resources/assets/js/jquery.sticky.js"></script>
   <script src="/resources/assets/js/datepicker.js"></script>
   <script src="/resources/assets/js/custom.js?v=<%=System.currentTimeMillis() %>">
   </script>
</body>
</html>



