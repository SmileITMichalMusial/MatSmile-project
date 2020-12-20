<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>
<% request.getSession().getAttribute("listOfUsers"); %>
<% request.getSession().getAttribute("user"); %>


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

<div class="card card-primary">
  <div class="card-header">
    <h3 class="card-title">Edycja użytkownika ${user.getLogin()}</h3>
  </div>
  <!-- /.card-header -->
  <!-- form start -->
  <form role="form" method="post" action="UserEditServlet">
    <div class="card-body">
      <div class="form-group">
        <label for="login_edit">Login</label>
        <input type="text" class="form-control" name="login" id="login_edit" placeholder="Login"
               value="${user.getLogin()}" readonly>
      </div>
      <div class="form-group">
        <label for="name_edit">Imię</label>
        <input type="text" class="form-control" name="name" id="name_edit" placeholder="Imię" value="${user.getName()}">
      </div>
      <div class="form-group">
        <label for="surname_edit">Nazwisko</label>
        <input type="text" class="form-control" name="surname" id="surname_edit" placeholder="Nazwisko"
               value="${user.getSurname()}">
      </div>
      <div class="form-group">
        <label for="email_edit">Email</label>
        <input type="email" class="form-control" name="email" id="email_edit" placeholder="Email"
               value="${user.getEmail()}">
      </div>
      <div class="form-group">
        <label for="phone_edit">Telefon</label>
        <input type="text" class="form-control" name="phone" id="phone_edit" placeholder="Telefon"
               value="${user.getPhoneNumber()}">
      </div>
      <div class="form-group">
        <label>Typ użytkownika</label>
        <select required class="form-control" name="type" value="${user.getUserType()}">

          <c:if test="${user.getUserType() == 'user'}">
            <option selected>user</option>
            <option>admin</option>
          </c:if>

          <c:if test="${user.getUserType() == 'admin'}">
            <option selected>admin</option>
            <option>user</option>
          </c:if>

        </select>
      </div>

    </div>
    <!-- /.card-body -->

    <div class="card-footer">
      <button type="submit" class="btn btn-primary">Aktualizuj</button>
      <button type="reset" class="btn btn-primary">Reset</button>
      <a href="AdminMainPageServlet">
        <button type="button" class="btn btn-primary">Cofnij</button>
      </a>

    </div>
  </form>
</div>
