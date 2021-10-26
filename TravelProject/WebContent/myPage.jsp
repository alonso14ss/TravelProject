<%@page import="com.travel.domain.OrderSummary"%>
<%@page import="com.travel.domain.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.travel.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member obj = (Member)session.getAttribute("member");
	List<OrderSummary> orderList=(List)request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Rufina:400,700"
   rel="stylesheet" />
<link
   href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
   rel="stylesheet" />
   
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
<title>My Page</title>
<meta charset="utf-8">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>
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
  width: 78%;
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

#cart {
margin-left: 20%;
}
#noWhere {
	height:100px;
}

body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.con {
  display: flex;
  flex-wrap: wrap;
  margin: 0 -16px;
  width:70%;
  margin-left: 17%;
}

.col-25 {
  flex: 25%;
}

.col-50 {
  flex: 50%;
}

.col-75 {
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.memberInfo {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

input[type=password] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-memberInfo {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

button:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function edit(){
	if($("#myPass").val()!=$("#password_ori").val()){
		alert("비밀번호가 올바르지 않습니다");
	}else if($("#chPassword").val()==""){
		alert("변경할 비밀번호를 입력해 주십시오");
	}else{
		$("form").attr({
			"action":"/member/edit",
			"enctype":"multipart/form-data",
			"method":"post"
		});
		$("form").submit();		
	}
}
</script>
</head>
<body>
<div id="header"> 
	<%@ include file="/include/header.jsp" %>
</div>
<div id="noWhere"></div>
<div id="boss">
<div class="con">
  <div class="col-75">
            <h3>나의 정보</h3>
    <div class="memberInfo">
      <form>
          <div class="col-50">
          	<input type="hidden" name="member_id" value="<%=member.getMember_id() %>">
          	<input type="hidden" id="myPass" value="<%=member.getPassword() %>">
            <label for="fname"><i class="fa fa-user"></i> 아이디</label>
            <input type="text" id="fname" name="firstname" placeholder="<%=member.getId() %>" disabled>
            <label for="fname">현재 비밀번호</label>
            <input type="password" id="password_ori" name="password_ori">
            <label for="fname">변경 할 비밀번호</label>
            <input type="password" id="password" name="password">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" value="<%=member.getEmail()%>">
            <label for="adr"><i class="fa fa-address-card-o"></i> 주소</label>
            <input type="text" id="addr" name="addr" value="<%=member.getAddr()%>">
          </div>
          <button onclick="edit()">수정</button>
      </form>
    </div>
    <div id="noWhere"></div>
    
    <h3>주문 내역</h3>
    
    <table>
  <tr>
    <th>주문금액</th>
    <th>주문일시</th>
    <th>결제방법</th>
  </tr>
  
 <%for(int i=0; i<orderList.size(); i++){ %>
  <%OrderSummary orderSummary= (OrderSummary)orderList.get(i); %>
  	<tr>
   		<td><%=orderSummary.getTotal_pay() %></td>
   		<td><%=orderSummary.getOrder_date() %></td>
   		<td><%=orderSummary.getPay_method() %></td>
  	</tr>
  <%} %>
  
</table>
    
  </div>
</div>
</div>
<div id="noWhere"></div>
<div id="noWhere"></div>
<div id="noWhere"></div>

<div id="footer"> 
	<%@ include file="/include/footer.jsp" %>
</div>

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
