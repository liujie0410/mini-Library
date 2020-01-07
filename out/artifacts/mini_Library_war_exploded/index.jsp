<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<script src="${pageContext.request.contextPath}/js/loginScript.js"></script>
<html>
<head>
  <title>登录页面</title>
    <style>
        img{
        <%--背景图透明度--%>
            opacity:0.84;
        }
    </style>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");    //对服务器相应重新编码
  if(session.getAttribute("adminname") != null && session.getAttribute("logout") == null){
      //当输入的用户名和登录非空时，响应main
    response.sendRedirect("main.jsp");
  }
%>
<!--欢迎界面-->
<div class="welcome">
  <img src="${pageContext.request.contextPath}/image/welcome.jpg" width="1420px" height="820px" >
</div>
<div class="Chineseword">
      <span>
          今天 你读书了吗？
      </span>
</div>
<div class="Englishword">
      <span>
          Books are the stepping stones <br>to human progress. -Gorky
      </span>
</div>
<!--登录输入框-->
<div class="loginform">
    <span id="labellogin">登录</span><br>
    <!--两个输入框，分别输入姓名和密码-->
    <input type="text" id="usernameinput" name="username" placeholder="用户名"/><br>
    <input type="password" id="passwordinput" name="password" placeholder="密码"/><br>
    <!--点击事件，响应loginScript.js中的logincheck函数-->
    <button id="loginbutton" onclick="logincheck()">登录</button>
    <!--当错误时返回文本的div-->
    <div class="errorsubmit" id="checkinfo"></div>
</div>
<div class="footer">Copyright  &nbsp;  mini-Library   @   刘婕</div>
</body>
</html>

