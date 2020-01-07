<%@ page import="Entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<html>
<head>
    <title>图书编辑</title>
</head>
<body>
<jsp:include page="main.jsp"/>

<%
    Book book = (Book)session.getAttribute("resultbook");
%>

<div class="mianpart">
<form action="BookAction?action=EditDone" method="post">
    <div class="detail">
        <div class="title">
            <span>编辑图书详情信息</span>
        </div>
        <span class="infotitle">书本编号：</span><input name="id" value="<%=book.getId()%>" readonly="readonly"><br>
        <span class="infotitle">书本名称：</span><input name="name" value="<%=book.getName()%>"><br>
        <span class="infotitle">书本作者：</span><input name="author" value="<%=book.getAuthor()%>"><br>
        <span class="infotitle">出版单位：</span><input name="publisher" value="<%=book.getPublisher()%>"><br>
        <span class="infotitle">书本价格：</span><input name="price" value="<%=book.getPrice()%>"><br>
        <span class="infotitle">书本类目：</span><input name="category" value="<%=book.getCategory()%>"><br>
        <span class="infotitle">书本库存：</span><input name="store" value="<%=book.getStore()%>"><br>
        <span class="infotitle">所在位置：</span><input name="location" value="<%=book.getLocation()%>"><br>
        <span class="infotitle">书本详情：</span><textarea name="desc"><%=book.getDesc()%></textarea><br>

        <div class="button">
            <button type="submit" class="btn btn-success">编辑完成</button>
            <a href="BookAction?action=DeleteById&id=<%=book.getId()%>"><button type="button" class="btn btn-danger">删除书本</button></a>
            <a href="BookAction?action=getall"><button type="button" class="btn btn-info">返回总表</button></a>
        </div>
    </div>
</form>
</div>
</body>
</html>
