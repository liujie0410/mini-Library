<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/borrow.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<script src="${pageContext.request.contextPath}/js/InfoScript.js"></script>
<html>
<head>
    <title>书本借出记录登记表</title>
</head>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") == null){
        response.sendRedirect("index.jsp");
    }
%>
<body>
<!--顶部栏目-->
<div class="topic">
    <img src="${pageContext.request.contextPath}/image/logo.png" >
</div>

<!--整体背景-->
<div class="back">
    <div class="background"></div>
</div>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") == null){
        response.sendRedirect("index.jsp");
    }
%>
<!--左侧菜单栏-->
<jsp:include page="nav.html"/>

<!--底部版权栏-->
<div class="footer">Copyright  &nbsp;  mini-Library   @   刘婕</div>

<div class="mianpart">
<div class="borrowinfo">
    <div class="title">
        书本借出记录登记表
    </div>
    <form action="IOAction?action=borrow" onsubmit="return errorsubmit()" method="post">
        <span class="infotitle">读者学号：</span><input type="text" onkeyup="readercheck()" name="readerid" id="readerid"><span id="readeridcheck" class="error"></span><br>
        <span class="infotitle">读者姓名：</span><input type="text" name="readername" id="readername" disabled><br>
        <span class="infotitle">读者班级：</span><input type="text" name="readername" id="readerclass" disabled><br>
        <span class="infotitle">用户状态：</span><input type="text" name="readername" id="readerstatus" disabled><span id="readerstatuscheck" class="error"></span><br>
        <span class="infotitle">用户已借：</span><input type="text" name="readerborrow" id="readerborrow" disabled><span id="readerborrowcheck" class="error"></span><br>
        <span class="infotitle">书本编号：</span><input type="text" name="bookid" onkeyup="bookcheck()" id="bookid"><span id="bookidcheck" class="error"></span><br>
        <span class="infotitle">书本名称：</span><input type="text" name="bookname" id="bookname"disabled><br>
        <span class="infotitle">书本作者：</span><input type="text" name="bookauthor" id="bookauthor" disabled><br>
        <span class="infotitle">出版单位：</span><input type="text" name="bookpublisher" id="bookpublisher" disabled><br>
        <span class="infotitle">书本剩余：</span><input type="text" name="bookremain" id="bookremain" disabled><span id="booknumcheck" class="error"></span>
        <span class="infotitle">借阅时间：</span>
            <select name="borrowday">
                <option value="7">7天</option>
                <option value="14">14天</option>
            </select>
        <br>
        <div class="button">
            <button type="submit" class="btn btn-success">提交</button>
            <button type="reset" class="btn btn-default">重填</button>
        </div>
    </form>
</div>
</div>
</body>
</html> 
