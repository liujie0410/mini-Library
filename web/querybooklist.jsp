<%@ page import="Entity.Book" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<html>
<head>
    <title>书籍查询</title>
</head>
<body>
<jsp:include page="main.jsp"/>
<%
    //解析json数据
    JSONArray querylist=(JSONArray)session.getAttribute("querylist");
%>
<div class="mianpart" onload="init(querylist);">
    <table class="table" id="mytable">

    </table>
    <script type="text/javascript">
        function init() {
                var query =<%=querylist%>;
                var str = "<tr><th>编号</th><th>书名</th><th>作者</th><th>出版社</th><th>价格</th><th>类目</th><th>柜号</th><th>库存数量</th>";
                for (var json in query) {
                    str += "<tr>";
                    var author = query[json].author;
                    var bookname = query[json].bookname;
                    var category = query[json].category;
                    var id = query[json].id;
                    var location = query[json].location;
                    var price = query[json].price;
                    var publisher = query[json].publisher;
                    var store = query[json].store;
                    str += "<td>" + id + "</td><td>" + bookname + "</td><td>" + author + "</td><td>" + publisher + "</td><td>" + price + "</td><td>" + category + "</td><td>" + location + "</td><td>" + store + "</td>";
                    str += "<td>";

                }
                var div = document.getElementById("mytable");
                div.innerHTML = str;
            }
        init();
    </script>
</div>
</body>
</html>
