<%@page import="com.travel.domain.Event"%>
<%@page import="com.travel.controller.common.Pager"%>
<%@page import="com.travel.controller.common.Pager"%>
<%@page import="com.travel.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Product> productList=(List)request.getAttribute("productList");
	
	Pager pager=(Pager)request.getAttribute("pager");
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getDetail(product_id){
	//상세보기 요청 
	location.href="/admin/product/detail?product_id="+product_id;
}
</script>
</head>
<body>

<%@include file="/admin/inc/main_navi.jsp"%>
<div class="container">
<table>
  <tr>
    <th>No</th>
    <th>이미지</th>
    <th>상품명</th>
    <th>가격</th>
    <th>출발시간</th>
    <th>도착시간</th>
    <th>출발지</th>
    <th>도착지</th>
  </tr>
  
 <%int curPos=pager.getCurPos(); %>	
 <%int num=pager.getNum(); %>	
  <%for(int i=1;i<pager.getPageSize();i++){%>
 <%if(num<1)break;%>	
  <%
  	Product product = productList.get(i-1);
  %>
  <tr>
    <td><%=num-- %></td>
    <td><img src="/data/<%=product.getFilename()%>" width="35px"/></td>
    <td onClick="getDetail(<%=product.getProduct_id()%>)"><%=product.getProduct_name() %></td>
    <td><%=product.getPrice() %></td>
    <td><%=product.getDeparturedate() %></td>
    <td><%=product.getArrivaldate() %></td>
    <td><%=product.getDepartureplace() %></td>
    <td><%=product.getArrivalplace() %></td>
  
  </tr>
  <%} %>
  <tr>
  	<td colspan="8" align="center">
  		<button type="button" onClick="location.href='/admin/product/registForm.jsp';">상품등록</button>
  	</td>
  </tr>
  <tr>
  	<td colspan="8" style="text-align:center">
  		<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
  		<%if(i>pager.getTotalPage())break; %>
		<a href="/admin/product/list?currentPage=<%=i%>">[<%=i%>]</a>  		
		<%}%>
  	</td>
  </tr>
  
</table>
</body>
</html>




