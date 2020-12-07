<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Logo -->
  <a href="index.jsp" class="brand-link">
    <img src="dist/img/MatSmile_logo.jpg" alt="Matsmile Logo" class="brand-image img-circle elevation-3"
         style="opacity: .8">
    <span class="brand-text font-weight-light">MateMania</span>


  </a>

  <!-- Menu rozwijalne -->
  <div class="sidebar">
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">

        <c:if test="${empty login}">

        <img src="dist/img/avatar5.png" class="img-circle elevation-2" alt="User Image">
      </div>
      <div class="info">
        <a href="#" class="d-block">Niezalogowany</a>

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

      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <!-- Add icons to the links using the .nav-icon class
             with font-awesome or any other icon font library -->

        <c:forEach items="${topicsLayer1List}" var="topicLayer1Loop">
          <li class="nav-header">${topicLayer1Loop.getName()}
          <c:forEach items="${topicsLayer2List}" var="topicLayer2Loop">
            <c:if test="${topicLayer1Loop.getIdLayer1() == topicLayer2Loop.getFkIdLayer1()}">
              <li class="nav-item has-treeview">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-list"></i>
                  <p>
                      ${topicLayer2Loop.getName()}
                    <i class="right fas fa-angle-right"></i>
                    <span
                      class="badge badge-info right">${topicsLayer3List.stream().filter(l -> l.getFkIdLayer2().equals(topicLayer2Loop.getIdLayer2())).count()}</span>
                  </p>
                </a>
                <c:forEach items="${topicsLayer3List}" var="topicLayer3Loop">
                  <c:if test="${topicLayer2Loop.getIdLayer2() == topicLayer3Loop.getFkIdLayer2()}">
                    <ul class="nav nav-treeview">
                      <li class="nav-item has-treeview">
                        <a href="TheoryViewServlet?idLayer3=${topicLayer3Loop.getIdLayer3()}" class="nav-link">
                          <i class="far fa-check-circle nav-icon"></i>
                          <p>
                              ${topicLayer3Loop.getName()}
                          </p>
                        </a>
                      </li>
                    </ul>
                  </c:if>
                </c:forEach>
              </li>
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
