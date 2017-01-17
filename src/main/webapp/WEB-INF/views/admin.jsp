<%--
  Created by IntelliJ IDEA.
  User: Yuriy
  Date: 06.12.2016
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="resources/css/teshstyle.css">
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <script src="/resources/js/jquery-3.1.1.js"></script>
    <script src="/resources/js/bootstrap.js"></script>
    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 70%;
            margin: auto;
        }
    </style>

    <title>Admin</title>

</head>

<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="post" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Admin Page ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>
    </c:if>

</div>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

        <div class="item active">
            <img src="/resources/images/rock.jpg" alt="Chania" width="460" height="345">
            <div class="carousel-caption">
                <h3>Chania</h3>
                <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
            </div>
        </div>

        <div class="item">
            <img src="/resources/images/rock.jpg" alt="Chania" width="460" height="345">
            <div class="carousel-caption">
                <h3>Chania</h3>
                <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
            </div>
        </div>

        <div class="item">
            <img src="/resources/images/colony.jpg" alt="Flower" width="460" height="345">
            <div class="carousel-caption">
                <h3>Flowers</h3>
                <p>Beatiful flowers in Kolymbari, Crete.</p>
            </div>
        </div>

        <div class="item">
            <img src="/resources/images/nature.jpg" alt="Flower" width="460" height="345">
            <div class="carousel-caption">
                <h3>Flowers</h3>
                <p>Beatiful flowers in Kolymbari, Crete.</p>
            </div>
        </div>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


</body>
</html>