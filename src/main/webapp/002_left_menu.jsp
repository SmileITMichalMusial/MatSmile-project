<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>


<aside class="main-sidebar sidebar-dark-blue bg-lightblue elevation-4">
  <!-- Brand Logo -->
  <a href="StartPage" class="brand-link">
    <img src="dist/img/MatSmile_logo.jpg" alt="Matsmile Logo" class="brand-image img-circle elevation-3"
         style="opacity: .8">
    <span class="brand-text font-weight-light ">MateMania</span>


  </a>


  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">

        <c:if test="${empty login}">

        <img src="dist/img/avatar5.png" class="img-circle elevation-2" alt="User Image">
      </div>
      <div class="info">
        <a href="01_L_login_page.jsp" class="d-block nav-item">Niezalogowany</a>

        </c:if>


        <c:if test="${not empty login}">

        <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
      </div>
      <div class="info">
        <a href="#" class="d-block">${login}</a>

        </c:if>

      </div>

    </div>


    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="true">
        <!-- Add icons to the links using the .nav-icon class
             with font-awesome or any other icon font library -->

        <c:forEach items="${topicsLayer1ListActive}" var="topicsLayer1ListActiveLoop">


          <li class="nav-header">${topicsLayer1ListActiveLoop.getName()}</li>
          <c:forEach items="${topicsLayer2ListActive}" var="topicsLayer2ListActiveLoop">
            <c:if test="${topicsLayer1ListActiveLoop.getIdLayer1() == topicsLayer2ListActiveLoop.getFkIdLayer1()}">
              <li class="nav-item has-treeview">
              <a href="#" class="nav-link">
                <i class="nav-icon fas fa-list"></i>
                <p>
                    ${topicsLayer2ListActiveLoop.getName()}
                  <i class="right fas fa-angle-right"></i>
                      <span
                        class="badge badge-info right">${topicsLayer3ListActive.stream().filter(l -> l.getFkIdLayer2().equals(topicsLayer2ListActiveLoop.getIdLayer2())).count()}</span>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <c:forEach
                  items="${topicsLayer3ListActive.stream().filter(l -> l.getFkIdLayer2().equals(topicsLayer2ListActiveLoop.getIdLayer2())).toList()}"
                  var="topicsLayer3ListActiveLoop" varStatus="loop">
                  <li class="nav-item">
                    <a href="TheoryViewServlet?idLayer3=${topicsLayer3ListActiveLoop.getIdLayer3()}"
                       class="nav-link">
                      <i class="far nav-icon"></i>
                      <p>${loop.count}. ${topicsLayer3ListActiveLoop.getName()}</p>
                    </a>
                  </li>
                </c:forEach>
              </ul>
            </c:if>
          </c:forEach>
          </li>

        </c:forEach>

      </ul>


    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>
