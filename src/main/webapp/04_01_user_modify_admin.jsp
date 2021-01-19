<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>
<% request.getSession().getAttribute("listOfUsers"); %>
<% request.getSession().getAttribute("user"); %>




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
