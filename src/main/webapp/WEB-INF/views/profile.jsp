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

    <link rel="stylesheet" href="../../resources/css/teshstyle.css">
    <link rel="stylesheet" href="../../resources/css/bootstrap.css">
    <script src="/resources/js/jquery-3.1.1.js"></script>
    <script src="/resources/js/bootstrap.js"></script>

    <title>ElariumOnline</title>

    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</head>
<body>
<nav class="navbar navbar-default">
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
                    <button class="btn btn-info navbar-btn" data-toggle="modal" data-target="#log-in-model">
                        <span class="glyphicon glyphicon-log-in"></span> Войти</button>
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
<!-- Всплывающие окно авторизации -->
<div class="modal fade" id="log-in-model" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Вход</h4>
            </div>
            <!-- Форма входа -->
            <form method="POST" action="${contextPath}/login" class="form-horizontal" role="form">

                <div class="form-group">
                    <label for="inputLogin3" class="col-sm-2 control-label">Логин</label>
                    <div class="col-sm-6">
                        <input name="username" type="text" class="form-control" id="inputLogin3" placeholder="Username" autofocus="true"/>
                    </div>
                </div>

                <div class="form-group ">
                    <label for="inputPassword3" class="col-sm-2 control-label">Пароль</label>
                    <div class="col-sm-6">
                        <input name="password" type="password" class="form-control" id="inputPassword3" placeholder="Password">
                    </div>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button class="btn btn-default" type="submit">Войти</button>
                    </div>
                </div>
            </form>
            <!-- Конец Форма входа-->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Отмена</button>
            </div>
        </div>

    </div>
</div>

 <h2>Это профиль пользователя ${user.username} </h2>

<footer class="footer">
    <div class="container">
        <center><p>Это футтер сайта</p></center>
    </div>
</footer>
</body>
</html>
