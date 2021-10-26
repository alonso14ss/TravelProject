<%@page import="com.travel.domain.Member"%>
<%@page import="com.travel.controller.common.Pager"%>
<%@page import="com.travel.controller.common.Pager"%>
<%@page import="com.travel.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   List<Member> memberList=(List)request.getAttribute("memberList");
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
function getDetail(member_id){
   //상세보기 요청 
   location.href="/admin/member/detail?member_id="+member_id;
}
</script>
</head>
<body>

<%@include file="/admin/inc/main_navi.jsp"%>
<div class="container">
<table>
  <tr>
    <th>No</th>
    <th>아이디</th>
    <th>이름</th>
    <th>이메일</th>
    <th>전화번호</th>
    <th>주소</th>
  </tr>
  
 <%int curPos=pager.getCurPos(); %>   
 <%int num=pager.getNum(); %>   
  <%for(int i=1;i<pager.getPageSize();i++){%>
 <%if(num<1)break;%>   
  <%
        Member member = memberList.get(i-1);
  %>
  <tr>
    <td><%=num-- %></td>
    <td onClick="getDetail(<%=member.getMember_id()%>)"><%=member.getId() %></td>
    <td><%=member.getName()%></td>
    <td><%=member.getEmail() %></td>
    <td><%=member.getPhone() %></td>
    <td><%=member.getAddr() %></td>
  </tr>
  <%} %>
  <tr>
     <td colspan="6" style="text-align:center">
        <%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){%>
        <%if(i>pager.getTotalPage())break; %>
      <a href="/admin/member/list?currentPage=<%=i%>">[<%=i%>]</a>        
      <%}%>
     </td>
  </tr>
  
</table>
</body>
</html>



