<%@page import="com.travel.domain.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.travel.domain.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Cart> cartList=(List)session.getAttribute("cartList");
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
<title>장바구니</title>
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){

});
function del(product_id){
	if(confirm("상품코드 "+product_id+" 를 삭제하시겠어요?")){
		location.href="/shop/cart/del?product_id="+product_id;		
	}
}
function removeAll(){
	if(confirm("장바구니를 비우시겠어요?")){
		location.href="/shop/cart/remove";		
	}
}
function edit(product_id, id){
	var n=id.split("_")[1];
	var ea = document.getElementById("t_"+n).value;
	if(confirm(product_id+"상품의 갯수를 "+ea+"개로 수정할래요?")){
		location.href="/shop/cart/edit?product_id="+product_id+"&ea="+ea;
	}
}

function buy(){
	//결제 1단계 페이지 요청 
	location.href="/shop/step1";
}
</script>
</head>
<body>
<div id="header"> 
	<%@ include file="/include/header.jsp" %>
</div>
<div id="body">
  <div id="cart">
  		<div id="noWhere"></div>
		<!-- 장바구니 표 -->
		<h2>장바구니</h2>
		<table>
		  <tr>
		    <th><input type="checkbox"/></th>
		    <th>이미지</th>
		    <th>상세정보</th>
		    <th>수량</th>
		    <th>변경</th>
		  </tr>
		  <%int totalBuy=0;//총 구매금액 %>
		  <%if(cartList!=null){%>
		  <%for(int i=0;i<cartList.size();i++){%>
		  <%Cart cart=cartList.get(i); %>
		  <%
		  	//가격*갯수 
		  	totalBuy+=(cart.getPrice()*cart.getEa());
		  %>
		  <tr>
		    <td><input type="checkbox"/></td>
		    <td><img src="/data/<%=cart.getFilename()%>" width="45px"/></td>
		    <td>
		    	<ul>
		    		<li>상품명:<%=cart.getProduct_name() %></li>
		    		<li>가격:<%=cart.getPrice() %></li>
		    	</ul>
		    </td>
		    <td>
		    	<input type="text" id="t_<%=i%>" value="<%=cart.getEa()%>"/>
		    </td>
		    <td>
		    	<button id="bt_<%=i%>" onClick="edit(<%=cart.getProduct_id()%>, this.id)">수정</button>
		    	<button onClick="del(<%=cart.getProduct_id()%>)">삭제</button>
		    </td>
		  </tr>
		  <%} %>
		  <%}else{%>
		    <td style="text-align:center" colspan="5">
		    	장바구니가 비어있습니다.
		    </td>
		  <%} %>
		  
		  <tr>
		  	<td colspan="4" style="text-align:right">총 <%=totalBuy %>원</td>
		  	<td colspan="1">
		  		<button onClick="removeAll()">장바구니 비우기</button>
		  		<button onClick="buy()">구매하기</button>
		  	</td>
		  </tr>
		</table>		
	  
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
