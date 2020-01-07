<%@ page import="Entity.Book" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addbook.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<html>
<head>
    <title>书本添加确认</title>
</head>
<body>
<jsp:include page="main.jsp"/>
<%
//解析json数据
    JSONArray addbooklist=(JSONArray)session.getAttribute("addbooklist");
%>
<div class="mianpart" onload="init(addbooklist);">
    <table class="table" id="mytable">

    </table>
    <script type="text/javascript">
        function init() {
            var addbooklist =<%=addbooklist%>;
            var str="<tr><th>编号</th><th>书名</th><th>作者</th><th>出版社</th><th>价格</th><th>类目</th><th>柜号</th><th>库存数量</th>";
            for(var json in addbooklist){
                str+="<tr>";
                var author=addbooklist[json].author;
                var bookname=addbooklist[json].bookname;
                var category=addbooklist[json].category;
                var id=addbooklist[json].id;
                var location=addbooklist[json].location;
                var price=addbooklist[json].price;
                var publisher=addbooklist[json].publisher;
                var store=addbooklist[json].store;
                str+="<td>"+id +"</td><td>"+bookname+"</td><td>"+author+"</td><td>"+publisher+"</td><td>"+price+"</td><td>"+category +"</td><td>"+location+"</td><td>"+store+"</td>";
                str+="<td>";

            }
            var div=document.getElementById("mytable");
            div.innerHTML=str;
        }
        init();
    </script>

    <div class="button">
        <button onclick="location.href='BookAction?action=confirm'" class="btn btn-success">确认添加</button>
        <button onclick="location.href='BookAction?action=truncatetable'" class="btn btn-danger">清空列表</button>
    </div>
</div>
</body>
</html>
