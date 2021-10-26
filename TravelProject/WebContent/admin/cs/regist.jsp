<%@page import="com.travel.domain.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
   Admin obj = (Admin) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>1:1문의</title>

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

.registBox {
   border-radius: 5px;
   background-color: #f2f2f2;
   padding: 20px;
   width: 80%;
   margin-top: 10px;
   margin-left: 10%;
}

#noWhere {
   height: 100px;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<script>
   $(function() {
      CKEDITOR.replace("detail");
   });

   function insert() {
      $("form input[name='content']").val(CKEDITOR.instances["detail"].getData());
      if ($("#title").val() == "" || $("#content").val() == "") {
         alert("제목과 내용을 입력해 주세요");
      } else {
         $("form").attr({
            "action" : "/admin/cs/insert",
            "enctype" : "multipart/form-data",
            "method" : "post"
         });
         $("form").submit();
      }
   }
</script>
</head>
<body>

   <div id="header">
      <%@ include file="/include/header.jsp"%>
   </div>

   <div id="noWhere"></div>

   <h3 style="text-align: center;">1:1문의 등록</h3>

   <div class="registBox">
      <form>
         <label>제목</label> 
         <input type="text" id="title" name="title" placeholder="제목을 입력해 주세요"> 
         <label>작성자</label> 
         <input type="text" id="writer" name="writer" placeholder="<%=obj.getId()%>" disabled>
         <label>내용</label>
         <input type="hidden" id="content" name="content">
         <textarea id="detail" placeholder="내용을 작성해 주세요" style="height: 200px"></textarea>
         <button type="button" onclick="insert()">등록</button>
      </form>
   </div>

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