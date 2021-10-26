<%@page import="com.travel.controller.common.Pager"%>
<%@page import="com.travel.domain.Cs"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Cs> csList = (List) request.getAttribute("csList");
Pager pager = (Pager) request.getAttribute("pager");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/icon"
	href="/resources/assets/logo/favicon.png" />

<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="/resources/assets/css/animate.css" />
<link rel="stylesheet" href="/resources/assets/css/hover-min.css">
<link rel="stylesheet" href="/resources/assets/css/datepicker.css">
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/assets/css/owl.theme.default.min.css" />
<link rel="stylesheet" href="/resources/assets/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/css/bootsnav.css" />
<link rel="stylesheet" href="/resources/assets/css/style.css?ver=1" />
<link rel="stylesheet" href="/resources/assets/css/responsive.css" />
<title>고객센터</title>
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 80%;
	border: 1px solid #ddd;
	margin-top: 20px;
	margin-left: 10%;
}

th, td {
	text-align: left;
	padding: 16px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

#noWhere {
	height: 100px;
}

#fullDiv {
	text-align: center;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>

	<div id="header">
		<%@ include file="/include/header.jsp"%>
	</div>

	<div id="noWhere"></div>


	<div id="fullDiv">
		<h2>고객센터</h2>

		<table>
			<tr>
				<th width="5%">No</th>
				<th width="60%">제목</th>
				<th width="15%">작성자</th>
				<th width="20%">작성일</th>
			</tr>
			<%
				int curPos = pager.getCurPos();
			%>
			<%
				int num = pager.getNum();
			%>
			<%
				for (int i = 1; i < pager.getPageSize(); i++) {
			%>
			<%
				if (num < 1)
				break;
			%>
			<%
				Cs cs = (Cs) csList.get(curPos++);
			%>
			<tr>
				<td><%=num--%></td>
				<td>
					<%
						if (cs.getDepth() > 0) { //답변일때만
					%> re: <%
						}
					%> <a
					href="/cs/detail?cs_id=<%=cs.getCs_id()%>"><%=cs.getTitle()%></a>
				</td>
				<td><%=cs.getWriter()%></td>
				<td><%=cs.getRegdate().substring(0, 10)%></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="4" align="right">
					<button onclick="location.href='/cs/regist'">글 작성</button>
				</td>
			</tr>
			<tr>
				<td colspan="6" style="text-align: center">
					<%
						for (int i = pager.getFirstPage(); i <= pager.getLastPage(); i++) {
					%> <%
 	if (i > pager.getTotalPage())
 	break;
 %>
					<a href="/cs/list?currentPage=<%=i%>">[<%=i%>]
				</a> <%}%>
				</td>
			</tr>

		</table>
	</div>

	<div id="noWhere"></div>
	<div id="noWhere"></div>
	<div id="noWhere"></div>

	<div id="footer">
		<%@ include file="/include/footer.jsp"%>
	</div>

	<script src="/resources/assets/js/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
	<script src="/resources/assets/js/bootstrap.min.js"></script>
	<script src="/resources/assets/js/bootsnav.js"></script>
	<script src="/resources/assets/js/jquery.filterizr.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<script src="/resources/assets/js/jquery-ui.min.js"></script>
	<script src="/resources/assets/js/jquery.counterup.min.js"></script>
	<script src="/resources/assets/js/waypoints.min.js"></script>
	<script src="/resources/assets/js/owl.carousel.min.js"></script>
	<script src="/resources/assets/js/jquery.sticky.js"></script>
	<script src="/resources/assets/js/datepicker.js"></script>
	<script
		src="/resources/assets/js/custom.js?v=<%=System.currentTimeMillis()%>">
		
	</script>

</body>
</html>

