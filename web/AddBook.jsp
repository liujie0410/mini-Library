<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addbook.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<script src="${pageContext.request.contextPath}/mian.jsp"></script>
<script src="${pageContext.request.contextPath}/js/AddScript.js"></script>
<html>
<head>
    <title>书本添加</title>
</head>
<body>
<jsp:include page="main.jsp"/>

<div class="mianpart">
<form action="BookAction?action=addtemp" onsubmit="return errorsubmit()" method="post">
    <div class="bookinfo">
        <div class="title">
            <span>请输入书本信息</span>
        </div>
        <span class="infotitle">书本编号：</span><input name="bookid" class="required" id="bookid" onkeyup="bookcheck()"  ><span id="bookidcheck" class="error"></span><br>
        <span class="infotitle">书本名称：</span><input class="required" name="bookname"><span id="booknamecheck" class="error"></span><br>
        <span class="infotitle">书本作者：</span><input class="required" name="bookauthor"><span id="bookauthorcheck" class="error"></span><br>
        <span class="infotitle">出版单位：</span><input class="required" name="bookpublisher"><span id="bookpublishercheck" class="error"></span><br>
        <span class="infotitle">书本价格：</span><input class="required" name="bookprice"><span id="bookpricecheck" class="error"></span><br>
        <span class="infotitle">书本类目：</span><input class="required" name="bookcategory"><span id="bookcategorycheck" class="error"></span><br>
        <span class="infotitle">书本库存：</span><input class="required" name="bookstore" ><span id="bookstorecheck" class="error"></span><br>
        <span class="infotitle">所在位置：</span><input class="required" name="booklocation" ><span id="booklocationcheck" class="error"></span><br>
        <span class="infotitle">书本详情：</span><textarea name="bookdesc"></textarea><span id="bookdesccheck" class="error"></span><br>

        <div class="button">
            <button type="submit" class="btn btn-default" name="over" value="1">完成添加</button>
            <button type="submit" class="btn btn-default" name="over" value="0" id="send">继续添加</button>
        </div>
    </div>
</form>
</div>
</body>
</html>
    
