<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="mtag" prefix="f" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="../../css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Fira+Mono:400,500&amp;subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/bets-style.css">
    <script type="text/javascript" src="../../js/index.js"></script>
    <script type="text/javascript" src="../../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../js/moment.js"></script>
    <script type="text/javascript" src="../../js/bootstrap-datetimepicker.js"></script>
    <c:choose>
        <c:when test="${role == 'BOOKMAKER'}">
            <script type="text/javascript" src="../../js/matchSettingHelper.js"></script>
        </c:when>
        <c:otherwise>
            <script type="text/javascript" src="../../js/matchHelper.js"></script>
        </c:otherwise>
    </c:choose>
</head>
<body>
<div class="full-container">
    <header class="header-wrap row clearfix">

        <div class="logo-wrap colored-block col-lg-3">
            <a href="index.html"><img class="logo-img" src="../images/logo-1.png" alt="coefficients"></a>
        </div>
        <div class="menu-wrap colored-block ">
            <ul class="main-menu clearfix">
                <li class="item-main"><a href="news.html" class="main-link">Новости</a>
                </li>
                <li class="item-main"><a href="games.html" class="main-link">Игры</a>
                </li>
                <li class="item-main">
                    <a href="faq.html" class="main-link">FAQ</a>
                </li>
                <li class="item-main">
                    <a href="profile.html" class="main-link">Профиль</a>
                </li>
            </ul>
        </div>
        <div class="lang-wrap colored-block ">
            <a href="@" class="lang">RU</a>

        </div>
        <div class="user-action colored-block col-lg-3">
            <div class="authorization">
                <a href="javascript:showLogoutPopup()" class="btn-enter">Выход</a>
            </div>
        </div>
    </header>

    <section class="content clearfix">
        <c:choose>
            <c:when test="${role == 'BOOKMAKER'}">
                <%@include file="../bookmaker/matchSetting.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file="../user/match.jsp" %>
            </c:otherwise>
        </c:choose>
    </section>

    <%@ include file="jspf/footer.jspf" %>
    <div class="popup-wrap" id="logout-popup">
        <div class="popup-holder" id="logout-check" style="display: none">
            <form class="logout-form clearfix" id="logout">
                <h3>Вы действительно хотите выйти?</h3>
                <div class="btn-group">
                    <input class="button-logout" id="btn-logout" type="button" value='Выйти'>
                    <input class="button-logout" type="button" value='Отмена' onclick="closeLogoutPopup()">
                </div>
            </form>
            <div class="popup-close logout-close"><a href="javascript:closeLogoutPopup()">x</a></div>
        </div>
    </div>
</div>
</body>
</html>
