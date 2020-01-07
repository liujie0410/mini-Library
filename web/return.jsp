<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/returnpage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<script src="${pageContext.request.contextPath}/js/return.js"></script>
<html>
<head>
    <title>图书归还</title>
</head>
<body>
<jsp:include page="main.jsp"/>
<div class="mianpart">
<div class="returninfo">
    <div class="title">
        请输入读者学号
    </div>
    <form action="ReaderAction?action=GetBorrowListById" onsubmit="return errorsubmit()" method="post">
        <div>
            <span class="infotitle">读者学号：</span><input type="text" onkeyup="readercheck()" name="readerid" id="readerid"><span id="readeridcheck" class="error"></span>
        </div>
        <div class="button">
            <button type="submit" class="btn btn-success">提交</button>
            <button type="reset" class="btn btn-default">重填</button>
        </div>
    </form>
</div>
</div>
</body>
</html>
