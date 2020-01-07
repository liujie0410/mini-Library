<%@ page import="Dao.BookDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<%
   ArrayList<Book> booklist = (ArrayList<Book>)session.getAttribute("allbooklist");

%>

<html>
<head>
    <title>图书管理</title>
</head>
<body>

<div id="content">
    <jsp:include page="main.jsp"/>
 <span class="mianpart">
   <!-- <div id="content">-->
   <table class="table">
    <thead>
    <tr>
        <th>书本编号</th>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>价格</th>
        <th>类目</th>
        <th>库存总量</th>
        <th>借出数量</th>
        <th>剩余数量</th>
        <th>所在位置(柜号)</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%

       if(booklist!=null && booklist.size() > 0)
        {
            for(int i = 0; i < booklist.size(); i++)
            {
                Book b = booklist.get(i);
    %>
        <tr>
        <td><%=b.getId()%></td>
        <td><a href="BookAction?action=querybookbyid&id=<%=b.getId()%>&next=check"><%=b.getName()%></a> </td>
        <td><%=b.getAuthor()%></td>
        <td><%=b.getPublisher()%></td>
        <td><%=b.getPrice()%></td>
        <td><%=b.getCategory()%></td>
        <td><%=b.getStore()%></td>
        <td><%=b.getLend()%></td>
        <td><%=b.getRemain()%></td>
        <td><%=b.getLocation()%></td>
        <td><a href="BookAction?action=querybookbyid&id=<%=b.getId()%>&next=edit">编辑或删除</a></td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
    </table>

     <!--书籍查询框-->
     <div class="queryboox" id="query">
     <input type="text" class="sinputBox" id="text2" placeholder="请输入您想查询的书籍名称!">
     <button id="button2">确认查询</button></div>


   </span>
</div>
<div class="searchBox">
    <input type="text" class="sinputBox" id="text" placeholder="请输入您想高亮的关键字!">
    <input type="button" class="searchBtn" id="button" value="搜索"/>
</div>
<script>
    var content = document.getElementById("content");
    var contents = content.innerHTML;
    var text = document.getElementById("text");
    var button = document.getElementById("button");
    button.onclick = function() {
        var value = text.value;
        var values = contents.split(value);
        content.innerHTML = values.join('<span style="color:red;">' + value + '</span>');
    };
    var qname = document.getElementById("text2");
    var button2=document.getElementById("button2");
    button2.onclick=function(){
        var bookname=qname.value;
        window.location.href="BookAction?action=querybookbyname&name="+bookname;
    }
</script>
</body>
</html>
