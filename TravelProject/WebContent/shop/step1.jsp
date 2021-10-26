<%@page import="com.travel.domain.Member"%>
<%@page import="com.travel.domain.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.travel.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   List<Cart> cartList=null;//결정 짓지 말자

   //session cart 이름의 List 가 존재한다면 바로구매한것이다!
   if(session.getAttribute("cartOne")!=null){
      cartList=(List)session.getAttribute("cartOne");
      out.print("바로구매 존재함");
   }else{
      cartList=(List)session.getAttribute("cartList");
   }
   Member obj=(Member)session.getAttribute("member");
   
%>
<!DOCTYPE html>
<html>
<head>
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
<title>결제 진행-1</title>
<meta charset="utf-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
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
  width: 60%;
  border: 3px solid #dcedff;
  margin-top:50px;
  margin-left: 20%;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
#buyer{
   width:60%;
   border:2px solid #dcedff;
   margin-top: 10px;
   margin-left: 20%;
}

#noWhere {
   height:120px;
}

#btn_Area{
   margin-top : 10px;
   margin-left: 68%;
}
</style>
<script>
$(function(){
   $("input[type='checkbox']").click(function(){
      copy();
      $("input[name='raddr']").focus();
   });
});

//주문자 정보를 받을 사람 정보로 옮기기
function copy(){
   var cname=$("input[name='cname']").val();
   var cphone=$("input[name='cphone']").val();
   
   $("input[name='receiver.rname']").val(cname);      
   $("input[name='receiver.rphone']").val(cphone);      
}

//결제하기 단계 요청
function pay(){
   $("form").attr({
      "action":"/shop/step2",
      "method":"post"
   });
   $("form").submit();   
}
</script>
</head>
<body>
   <%@ include file="/include/header.jsp" %>
<div id="step1">
  <div id="pay1">
      <!-- 장바구니 표 -->
      <div id="noWhere"></div>
      <h2 align="center">결제정보 입력</h2>
      
      <table width="100%">
        <tr>
          <th>이미지</th>
          <th>상품명</th>
          <th>가격</th>
          <th>수량</th>
        </tr>
        <%int totalBuy=0; %>
      <%for(int i=0;i<cartList.size();i++){%>
      <%Cart cart = cartList.get(i); %>
      <%totalBuy+=(cart.getPrice()*cart.getEa()); %>        
        <tr>
          <td><img src="/data/<%=cart.getFilename() %>" width="45px"/></td>
          <td><%=cart.getProduct_name() %></td>
          <td><%=cart.getPrice() %></td>
          <td><%=cart.getEa() %> 개</td>
        </tr>
        <%}%>
        <tr>
           <td colspan="6" style="text-align:right">구매 총액 : <%=totalBuy %>원</td>
        </tr>
      </table>      
      
      
     <form>
        <input type="hidden" name="total_pay" value="<%=totalBuy %>"/>
        <div id="buyer">
          <input type="text" name="cname" value="<%=obj.getName()%>">
          <input type="text" name="cphone" value="<%=obj.getPhone()%>">
          <input type="text" name="email" value="<%=obj.getEmail()%>">
          <input type="text" name="addr" value="<%=obj.getAddr()%>">
          <select id="country" name="pay_method">
            <option value="0">결제방법</option>
            <option value="card">신용카드</option>
            <option value="online">온라인 입금</option>
            <option value="phone">핸드폰 결제</option>
          </select>
       </div>
     </form>
     <div id="btn_Area">
     <input type="button" value="쇼핑계속"/>
     <input type="button" value="결제하기" onClick="pay()"/>
     </div>
     
  </div>
</div>

<div id="noWhere"></div>


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



