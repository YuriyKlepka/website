<%--
  Created by IntelliJ IDEA.
  User: Yuriy
  Date: 20.01.2017
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <title>Profile</title>
</head>
<body>
 <h2>Это профиль пользователя ${user.username} </h2>
 <!--<h3>Hello, ${user.username} <a href="/">Главная</a></h3> -->

</body>
</html>
