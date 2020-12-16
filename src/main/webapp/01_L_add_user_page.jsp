<%@ page import="javax.swing.*" %>
<%@ page import="java.awt.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.getAttribute("topicsLayer1List"); %>
<% request.getAttribute("topicsLayer2List"); %>
<% request.getAttribute("topicsLayer3List"); %>
<% request.getAttribute("topicsLayer4List"); %>
<% request.getAttribute("userType"); %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Matemania</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed">

<%@include file="001_header.jsp" %>

<%@include file="002_left_menu.jsp" %>
<div class="row">
  <div class="col-md-1">
  </div>
  <div class="col-md-11">
    <div class="content-wrapper login-box">
      <div class="login-logo">
        <a href="index.jsp"><b>&nbsp;</b></a>
      </div>
      <!--/.login-logo -->
      <div class="card">
        <div class="card-body register-card-body">
          <p class="login-box-msg">Załóż konto</p>

          <form action="UserAddServletUser" method="post">
            <div class="input-group mb-3">
              <input type="text" class="form-control" name="name" placeholder="Imię (wymagane)" required>
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fas fa-user"></span>
                </div>
              </div>
            </div>
            <div class="input-group mb-3">
              <input type="text" class="form-control" name="surname" placeholder="Nazwisko (opcjonalnie)">
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fas fa-user"></span>
                </div>
              </div>
            </div>
            <div class="input-group mb-3">
              <input type="text" class="form-control" name="login" placeholder="Login lub email (wymagane)" required>
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fas fa-user"></span>
                </div>
              </div>
            </div>
            <div class="input-group mb-3">
              <input type="password" class="form-control" name="password" placeholder="Hasło (wymagane)" required>
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fas fa-lock"></span>
                </div>
              </div>
            </div>
            <div class="input-group mb-3">
              <input type="password" class="form-control" placeholder="Powtórz hasło (wymagane)" required>
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fas fa-lock"></span>
                </div>
              </div>
            </div>
            <div class="row">
              <!--
              Akceptacja regulaminu -- poprawic <div class="col-12"> na col-4 gdy dodamy regulamin przy zarejestruj
              <div class="col-8">
                <div class="icheck-primary">
                  <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                  <label for="agreeTerms">
                    Zgadzam się z <a href="#">regulaminem</a>
                  </label>
                </div>
              </div> -->
              <!-- /.col -->
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block">Zarejestruj</button>
              </div>
              <!-- /.col -->
            </div>
          </form>

         <!--
          Login via social media
          <div class="social-auth-links text-center">
            <p>- ALBO -</p>
            <a href="#" class="btn btn-block btn-primary">
              <i class="fab fa-facebook mr-2"></i>
              Zaloguj się za pomoc Facebook
            </a>
            <a href="#" class="btn btn-block btn-danger">
              <i class="fab fa-google-plus mr-2"></i>
              Zaloguj się za pomocą Google
            </a>
          </div> -->

          <a href="01_L_login_page.jsp" class="text-center">Mam już konto</a>
        </div>
        <!-- /.form-box -->
      </div><!-- /.card -->
    </div></div>
</div>


<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>

</body>
</html>
