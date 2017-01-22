<%--
  Created by IntelliJ IDEA.
  User: Yuriy
  Date: 10.12.2016
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>


</head>
<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>

        <jsp:useBean id="userAut" class="com.security.model.User"/>

        <<jsp:getProperty name="userAut" property="username"/>
        <<jsp:getProperty name="userAut" property="password"/>

        <h2><c:out value="${userAut}"/></h2>

    </c:if>
</div>

 <!-- <p><h3>${user.username}+${user.email}+${user.password}</h3></p> -->

</body>
</html>