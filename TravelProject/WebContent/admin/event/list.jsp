<%@page import="com.travel.domain.Event"%>
<%@page import="com.travel.controller.common.Pager"%>
<%@page import="com.travel.controller.common.Pager"%>
<%@page import="com.travel.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Event> eventList=(List)request.getAttribute("eventList");
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
function getDetail(event_id){
	//상세보기 요청 
	location.href="/admin/event/detail?event_id="+event_id;
}
</script>
</head>
<body>

<%@include file="/admin/inc/main_navi.jsp"%>
<div class="container">
<table>
  <tr>
    <th>No</th>
    <th>상품 사진</th>
    <th>상품명</th>
    <th>기존 가격</th>
    <th>할인율</th>
    <th>적용 가격</th>
    <th>시작시간</th>
    <th>종료시간</th>
  </tr>
  
 <%int curPos=pager.getCurPos(); %>	
 <%int num=pager.getNum(); %>	
  <%for(int i=1;i<pager.getPageSize();i++){%>
 <%if(num<1)break;%>	
  <%
  		Event event = eventList.get(i-1);
  		Product product = event.getProduct();
  %>
  <tr>
    <td><%=num-- %></td>
    <td><img src="/data/<%=product.getFilename()%>" width="35px"/></td>
    <td onClick="getDetail(<%=event.getEvent_id()%>)"><%=product.getProduct_name() %></td>
    <td><%=product.getPrice() %></td>
    <td><%=event.getDiscount() %></td>
    <td><%=(int)((product.getPrice() * (100-event.getDiscount())) / 100) %></td>
    <td><%=event.getStart_time() %></td>
    <td><%=event.getEnd_time() %></td>
  </tr>
  <%} %>
  <tr>
  	<td colspan="8" align="center">
  			<button type="button" onClick="location.href='/admin/event/registForm';">이벤트 등록</button>
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




