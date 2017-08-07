<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" type="text/css" href="../../css/bets-style.css">
    <link rel="stylesheet" href="../../css/font-awesome.css">
    <link rel="stylesheet" href="../../css/pagination.css"/>
    <link href="https://fonts.googleapis.com/css?family=Fira+Mono:400,500&amp;subset=cyrillic" rel="stylesheet">

    <script type="text/javascript" src="../../js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../js/pagination.js"></script>
    <script type="text/javascript" src="../../js/moment.js"></script>
    <script type="text/javascript" src="../../js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="../../js/index.js"></script>
    <c:choose>
        <c:when test="${role == 'ADMIN'}">
            <script type="text/javascript" src="../../js/newsSettingHelper.js"></script>
        </c:when>
        <c:otherwise>
            <script type="text/javascript" src="../../js/newsHelper.js"></script>
        </c:otherwise>
    </c:choose>

</head>
<body>
<div class="full-container">
    <header class="header-wrap row clearfix">

        <div class="logo-wrap colored-block col-lg-3">
            <a href="${pageContext.servletContext.contextPath}/pages/common/main.jsp"><img class="logo-img"
                                                                                           src="../../images/logo-1.png"
                                                                                           alt="coefficients"></a>
        </div>
        <div class="menu-wrap colored-block ">
            <ul class="main-menu clearfix">
                <li class="item-main"><a href="${pageContext.servletContext.contextPath}/pages/common/news.jsp"
                                         class="main-link">Новости</a>
                </li>
                <li class="item-main"><a href="games.html" class="main-link">Игры</a>
                </li>
                <li class="item-main">
                    <a href="${pageContext.servletContext.contextPath}/controller?command=show_faq" class="main-link">FAQ</a>
                </li>
                <li class="item-main">
                    <a href="${pageContext.request.contextPath}/controller?command=show_profile" class="main-link">Профиль</a>
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
            <c:when test="${role == 'ADMIN'}">
                <%@include file="../admin/newsSetting.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file="../user/news.jsp" %>
            </c:otherwise>
        </c:choose>

    </section>

    <%@ include file="jspf/footer.jspf" %>

    <div class="popup-wrap" id="logout-popup">
        <div class="popup-holder" id="logout-check" style="display: none">
            <form class="logout-form clearfix" id="logout" method="GET" action="/controller">
                <h3>Вы действительно хотите выйти?</h3>
                <div class="btn-group">
                    <input type="hidden" name="command" value="log_out"/>
                    <input class="button-logout" id="btn-logout" type="submit" value='Выйти'>
                    <input class="button-logout" type="button" value='Отмена' onclick="closeLogoutPopup()">
                </div>
            </form>
            <div class="popup-close logout-close"><a href="javascript:closeLogoutPopup()">x</a></div>
        </div>
    </div>
</div>
</body>
</html>
