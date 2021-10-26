<%@page import="com.travel.domain.Product"%>
<%@page import="com.travel.domain.OrderSummary"%>
<%@page import="com.travel.domain.OrderDetail"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   List<OrderDetail> detailList=(List)request.getAttribute("detailList");

   OrderSummary orderSummary=(OrderSummary)request.getAttribute("orderSummary");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin.css"/>
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

#btnArea{
   margin-top:20px;
   text-align:center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function del(){
   $("form").attr({
      "action":"/admin/order/del",
      "method":"get"
   });
   $("form").submit();
}

</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>

<div id="productList">
   <h3>구매 상품 정보</h3>
   <table>
     <tr>
       <th>상품코드</th>
       <th>이미지</th>
       <th>상품명</th>
       <th>가격</th>
     </tr>
     <%for(int i=0;i<detailList.size();i++){%>
     <%
           OrderDetail orderDetail = detailList.get(i);
           Product product=orderDetail.getProduct();
     %>
     <form>
        <input type="hidden" name="order_summary_id" value="<%=orderSummary.getOrder_summary_id()%>">
     </form>
     <tr>
       <td><%=product.getProduct_id()%></td>
      <td><img src="/data/<%=product.getFilename()%>" width="45px"/></td>
      <td><%=product.getProduct_name()%></td>
      <td><%=product.getPrice()%></td>
     </tr>
     <%} %>
     <tr>
        <td colspan="7" style="text-align:center">
        합계 
        </td>
     </tr>
     
   </table>
</div>
<div id="payInfo">
   <h3>결제 내역</h3>
   <table>
     <tr>
       <th>주문자</th>
       <th>연락처</th>
       <th>이메일</th>
       <th>주소</th>
       <th>결제금액</th>
       <th>주문일시</th>
       <th>결제방법</th>
     </tr>
     <tr>
       <td><%=orderSummary.getMember().getName()%></td>
      <td><%=orderSummary.getMember().getPhone()%></td>
      <td><%=orderSummary.getMember().getEmail()%></td>
      <td><%=orderSummary.getMember().getAddr()%></td>
      <td><%=orderSummary.getTotal_pay()%></td>
      <td><%=orderSummary.getOrder_date()%></td>
      <td><%=orderSummary.getPay_method()%></td>
     </tr>
     <tr>
        <td colspan="7" style="text-align:center">
        합계 
        </td>
     </tr>
     
   </table>
</div>


<div id="btnArea">
        <button type="button" onClick="del()">주문 삭제</button>
      <button type="button" onClick="location.href='/admin/order/list';">주문 목록 이동</button>
</div>
</body>
</html>
















