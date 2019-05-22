<%--
  Created by IntelliJ IDEA.
  User: yzlin
  Date: 2019/4/15
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../templates/base-lib.jsp"/>
    <link href="<c:url value="/static/css/article/article.css"/>" rel="stylesheet">
</head>
<body>
<jsp:include page="../templates/navbar.jsp"/>
<div class="container">
    <div class="page-header">
        <h1>${requestScope.article.title}</h1>
    </div>
    <nav aria-label="Page navigation" class="navbar-right">
        <ul class="pagination">
            <li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
        </ul>
    </nav>
</div>
<div class="container">
    <div class="row rounded-border">
        <div class="col-md-2 user-info">
            <img src="<c:url value="${requestScope.article.user.portrait}"/>" alt="tou"
                 class="img-thumbnail img-responsive">
            <div class="text-center">${requestScope.article.user.nickName}</div>
        </div>
        <div class="col-md-10 ck-content" style="padding: 35px">
            <div class="row " style="margin-bottom: 20px;padding: 20px">
                <div class="ck-content">${requestScope.article.content}</div>
            </div>
        </div>
    </div>

    <c:forEach items="${requestScope.commentList}" var="comment">
        <div class="row rounded-border">
            <div class="col-md-2 user-info">
                <img src="<c:url value="${comment.user.portrait}"/>" alt="tou"
                     class="img-thumbnail img-responsive">
                <div class="text-center">${comment.user.nickName}</div>
            </div>
            <div class="col-md-10 ck-content" style="padding: 35px">
                <div class="row " style="margin-bottom: 20px;padding: 20px">
                    <div class="ck-content">${comment.content}</div>
                </div>
            </div>
        </div>
    </c:forEach>

    <div class="row">
        <div class="col-md-12 page-header">
            <h2>这个评论不知道比楼主要高到哪里去</h2>
        </div>
        <div class="col-md-12 editor">
            <div id="content"></div>
        </div>
        <div class="col-md-12" style="margin-top: 20px">
            <button class="btn btn-success" onclick="commitComment(${requestScope.article.articleId})">提交</button>
        </div>
    </div>
</div>
<script src="<c:url value="/static/js/ckeditor.js"/>"></script>
<script src="<c:url value="/static/js/article/editor.js"/>"></script>
<script src="<c:url value="/static/js/article/commit.js"/>"></script>
<jsp:include page="../templates/footer.jsp"/>
</body>
</html>