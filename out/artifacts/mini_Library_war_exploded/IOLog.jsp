<%@ page import="java.util.ArrayList" %>
<%@ page import="Entity.Log" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<html>
<head>
    <title>图书借进归还日志</title>
</head>
<body>
<jsp:include page="main.jsp"/>

<div class="mianpart">
<table class="table">
    <thead>
    <tr>
        <th>书本编号(书名)</th>
        <th>读者学号</th>
        <th>借出/归还</th>
        <th>更新时间</th>
        <th>借阅时间(天)</th>
        <th>是否归还</th>
    </tr>
    </thead>
    <tbody>
    <%
        ArrayList<Log> loglist = (ArrayList<Log>)session.getAttribute("loglist");
        if(loglist!=null && loglist.size() > 0)
        {
            for(int i = loglist.size() - 1; i >= 0 ; i--)
            {
                Log log = loglist.get(i);
    %>
    <tr>
        <td><%=log.getBookid()%></td>
        <td><%=log.getReaderid()%></td>
        <td><%=log.getService()%></td>
        <td><%=log.getBorrowtime()%></td>
        <td><%=log.getBorrowday()%></td>
        <td><%=log.getComplete()%></td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
</div>
</body>
</html>
