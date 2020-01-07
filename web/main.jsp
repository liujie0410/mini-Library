<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<html>
<head>
    <title>登录成功</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") == null){
        response.sendRedirect("index.jsp");
    }
%>
    <!--顶部栏目-->
   <div class="topic">
       <img src="${pageContext.request.contextPath}/image/logo.png" >
   </div>

    <!--整体背景-->
    <div class="back">
        <div class="background"></div>
    </div>

    <!--左侧菜单栏-->
        <jsp:include page="nav.html"/>

    <!--底部版权栏-->
    <div class="footer">Copyright  &nbsp;  mini-Library   @   刘婕</div>


</body>
</html>
