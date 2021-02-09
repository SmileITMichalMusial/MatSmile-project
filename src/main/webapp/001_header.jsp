<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>
<% request.getAttribute("userType"); %>

<!-- Górne menu -->
<nav class="main-header navbar navbar-expand navbar-dark navbar-lightblue">
  <!-- Linki u góry po lewej -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
    <li class="nav-item d-none d-sm-inline-block">
      <a href="StartPageContent" class="nav-link">Główna</a>
    </li>
  </ul>

  <!-- Wyszukiwarka
  <form class="form-inline ml-3">
    <div class="input-group input-group-sm">
      <input class="form-control form-control-navbar" type="search" placeholder="Wyszukaj" aria-label="Search">
      <div class="input-group-append">
        <button class="btn btn-navbar" type="submit">
          <i class="fas fa-search"></i>
        </button>
      </div>
    </div>
  </form>-->

  <!-- Linki u góry po prawej -->
  <ul class="navbar-nav ml-auto">
    <!--
    <li class="nav-item">
      <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
        <i class="fas fa-wrench"></i>&nbspDostosuj widok strony
      </a>
    </li> -->


    <c:if test="${empty login}">
      <li class="nav-item d-none d-sm-inline-block">
        <a href="01_L_add_user_page.jsp" class="nav-link"><i class="fas fa-sign-in-alt"></i>&nbspZałóż konto</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="01_L_login_page.jsp" class="nav-link"><i class="fas fa-sign-in-alt"></i>&nbspZaloguj</a>
      </li>
    </c:if>

    <c:if test="${not empty login}">
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Witaj: ${login}</a>
      </li>

      <c:if test="${userType == 'admin'}">
      <li class="nav-item d-none d-sm-inline-block">
        <a href="AdminMainPageServlet" class="nav-link">Administracja</a>
      </li>
      </c:if>
      <li>
        <a href="LogoutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i>&nbspWyloguj</a>
      </li>
    </c:if>


  </ul>
</nav>
<!-- /.navbar -->


