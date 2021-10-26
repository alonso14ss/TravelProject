<%@page import="com.travel.domain.Member"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Member member=(Member)request.getAttribute("member");
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
      "action":"/admin/member/del",
      "method":"get"
   });
   $("form").submit();
}

</script>
</head>
<body>
<%@include file="/admin/inc/main_navi.jsp"%>


<div id="memberInfo">
   <h3>회원 정보</h3>
   <table>
  <tr>
  <form>
     <input type="hidden" name="member_id" value="<%=member.getMember_id()%>">
  </form>
    <th>아이디</th>
    <th>이름</th>
    <th>이메일</th>
    <th>전화번호</th>
    <th>주소</th>
  </tr>
     <tr>
    <td><%=member.getId() %></td>
    <td><%=member.getName()%></td>
    <td><%=member.getEmail() %></td>
    <td><%=member.getPhone() %></td>
    <td><%=member.getAddr() %></td>
  </tr>
     
   </table>
</div>


<div id="btnArea">
        <button type="button" onClick="del()">회원 삭제</button>
      <button type="button" onClick="location.href='/admin/member/list';">회원 목록 이동</button>
</div>
</body>
</html>
















