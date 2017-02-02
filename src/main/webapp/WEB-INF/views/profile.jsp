<%--
  Created by IntelliJ IDEA.
  User: Yuriy
  Date: 20.01.2017
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="../../resources/css/teststyle.css">
    <link rel="stylesheet" href="../../resources/css/bootstrap.css">
    <script src="/resources/js/jquery-3.1.1.js"></script>
    <script src="/resources/js/bootstrap.js"></script>

    <title>ElariumOnline</title>

    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">Elarium Online</a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Mobile navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px">
            <ul class="nav navbar-nav">
                <li><a href="#">Раздел 1</a></li>
                <li><a href="#">Раздел 2</a></li>
                <li><a href="#">Раздел 3</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <!— Стандартная отрисовка —>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li><a href="/registration"><span class="glyphicon glyphicon-ok-sign"></span> Регистрация</a></li>
                    <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Войти</a></li>
                </c:if>
                <!— Отрисовка залогиненого юзера —>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <li><a href="/profile"><span class="glyphicon glyphicon-user"></span> ${pageContext.request.userPrincipal.name}</a></li>
                    <li><button class="btn btn-primary navbar-btn" data-toggle="modal" onclick="document.forms['logoutForm'].submit()">
                        <span class="glyphicon glyphicon-log-in"></span> Выйти</button></li>
                </c:if>
            </ul>
        </div>

    </div>
</nav>
<div>
    <h2 style="color: #761c19" >Это профиль пользователя ${user.username} </h2>
    <h3 style="color: #761c19" >${user.email}</h3>
    <h3 style="color: #761c19" >${user.id}</h3>
</div>

<footer class="footer">
    <div class="container">
        <center><p>Это футтер сайта</p></center>
    </div>
</footer>
</body>
</html>
