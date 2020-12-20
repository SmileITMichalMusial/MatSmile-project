<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>
<% request.getSession().getAttribute("listOfUsers"); %>


<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | DataTables</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>


<section class="content">

  <div class="row">
    <div class="col-12">

      <!-- /.card -->

      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Użytkownicy portalu MateMania</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <table id="example1" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>Edycja</th>
              <th>ID</th>
              <th>Login</th>
              <th>Imię</th>
              <th>Nazwisko</th>
              <th>E-mail</th>
              <th>Telefon</th>
              <th>Typ</th>
              <th>Aktywny?</th>
              <th><em class="fa fa-cog"></em></th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${listOfUsers}" var="userLoop">


              <tr>
                <td>
                  <a href="UserEditServlet?id=${userLoop.getId()}"><em
                    class="fa fa-pencil-alt"></em></a>
                </td>
                <td>
                  <c:if test="${!userLoop.getActive()}">
                    <p class="text-muted">
                        ${userLoop.getId()}
                    </p>
                  </c:if>
                  <c:if test="${userLoop.getActive()}">
                    ${userLoop.getId()}
                  </c:if>
                </td>
                <td>
                  <c:if test="${!userLoop.getActive()}">
                    <p class="text-muted">
                        ${userLoop.getLogin()}
                    </p>
                  </c:if>
                  <c:if test="${userLoop.getActive()}">
                    ${userLoop.getLogin()}
                  </c:if>
                </td>
                <td>
                  <c:if test="${!userLoop.getActive()}">
                    <p class="text-muted">
                        ${userLoop.getName()}
                    </p>
                  </c:if>
                  <c:if test="${userLoop.getActive()}">
                    ${userLoop.getName()}
                  </c:if>
                </td>
                <td>
                  <c:if test="${!userLoop.getActive()}">
                    <p class="text-muted">
                        ${userLoop.getSurname()}
                    </p>
                  </c:if>
                  <c:if test="${userLoop.getActive()}">
                    ${userLoop.getSurname()}
                  </c:if>
                </td>
                <td>

                  <c:if test="${!userLoop.getActive()}">
                    <p class="text-muted">
                      <a href="mailto:${userLoop.getEmail()}">${userLoop.getEmail()}</a>
                    </p>
                  </c:if>
                  <c:if test="${userLoop.getActive()}">
                    <a href="mailto:${userLoop.getEmail()}">${userLoop.getEmail()}</a>
                  </c:if>
                </td>
                <td>
                  <c:if test="${!userLoop.getActive()}">
                    <p class="text-muted">
                        ${userLoop.getPhoneNumber()}
                    </p>
                  </c:if>
                  <c:if test="${userLoop.getActive()}">
                    ${userLoop.getPhoneNumber()}
                  </c:if>
                </td>
                <td>
                  <c:if test="${!userLoop.getActive()}">
                    <p class="text-muted">
                        ${userLoop.getUserType()}
                    </p>
                  </c:if>
                  <c:if test="${userLoop.getActive()}">
                    ${userLoop.getUserType()}
                  </c:if>

                </td>
                <td>

                  <c:if test="${userLoop.getActive()}">Tak</c:if>
                  <c:if test="${!userLoop.getActive()}">Nie</c:if>

                </td>
                <td>
                  <c:set var="active" scope="session"
                         value="${userLoop.getActive()}"/>
                  <c:if test="${active}">
                    <a href="UserDeleteServlet?id=${userLoop.getId()}"><em
                      class="fa fa-trash"></em></a>
                  </c:if>
                  <c:if test="${!active}">
                    <a href="UserDeleteServlet?id=${userLoop.getId()}"><em
                      class="fa fa-plus"></em></a>
                  </c:if>


                </td>
              </tr>
            </c:forEach>
            </tbody>

            <tfoot>
            <tr>
              <th>Edycja</th>
              <th>ID</th>
              <th>Login</th>
              <th>Imię</th>
              <th>Nazwisko</th>
              <th>E-mail</th>
              <th>Telefon</th>
              <th>Typ</th>
              <th>Aktywny?</th>
              <th><em class="fa fa-cog"></em></th>
            </tr>
            </tfoot>

          </table>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->

</section>

