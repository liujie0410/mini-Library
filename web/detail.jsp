<%@ page import="Entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<html>
<head>
    <title>图书详情</title>
</head>
<body>
<jsp:include page="main.jsp"/>

<%
    Book book = (Book)session.getAttribute("resultbook");
%>

<div class="mianpart">
<div class="detail">
    <div class="title">
        <span>图书详情信息</span>
    </div>
    <span class="infotitle">书本编号：</span><span class="info"><%=book.getId()%></span><br>
    <span class="infotitle">书本名称：</span><span class="info"><%=book.getName()%></span><br>
    <span class="infotitle">书本作者：</span><span class="info"><%=book.getAuthor()%></span><br>
    <span class="infotitle">出版单位：</span><span class="info"><%=book.getPublisher()%></span><br>
    <span class="infotitle">书本价格：</span><span class="info"><%=book.getPrice()%>元</span><br>
    <span class="infotitle">书本类目：</span><span class="info"><%=book.getCategory()%></span><br>
    <span class="infotitle">书本库存：</span><span class="info"><%=book.getStore()%>本</span><br>
    <span class="infotitle">书本所在位置：</span><span class="info"><%=book.getLocation()%>号柜</span><br>
    <span class="infotitle">书本详情：</span><span class="info"><%=book.getDesc()%></span><br>

    <div class="button">
        <a href="BookAction?action=querybookbyid&id=<%=book.getId()%>&next=edit"><button type="button" class="btn btn-default">编辑信息</button></a>
        <a href="BookAction?action=getall"><button type="button" class="btn btn-info">返回总表</button></a>
    </div>
</div>
   </div>
</body>
</html>
