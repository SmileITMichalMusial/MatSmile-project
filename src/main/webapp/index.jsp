<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.getSession().getAttribute("topicsLayer1ListActive"); %>
<% request.getSession().getAttribute("topicsLayer2ListActive"); %>
<% request.getSession().getAttribute("topicsLayer3ListActive"); %>
<% request.getSession().getAttribute("topicsLayer4ListActive"); %>
<% request.getSession().getAttribute("userType"); %>
<c:set var="login" scope="session" value="${login}"/>

<% request.getSession().getAttribute("topicsLayer4ListActive"); %>
<% request.getSession().getAttribute("topicLayer1"); %>
<% request.getSession().getAttribute("topicLayer2"); %>
<% request.getSession().getAttribute("topicLayer3"); %>
<% request.getSession().getAttribute("nextTopicLayer3"); %>
<% request.getSession().getAttribute("previousTopicLayer3"); %>
<% request.getSession().getAttribute("id_layer_2_to_display"); %>
<% request.getSession().getAttribute("topicsLayer3ToDisplay"); %>




<!DOCTYPE html>
<html lang="en">
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
  <link rel="stylesheet" href="dist/css/styles_my.css">

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
<div class="wrapper">

  <%@include file="001_header.jsp" %>

  <%@include file="002_left_menu.jsp" %>

  <!-- Lewe menu -->


  <!-- Content Wrapper. Contains page content -->

  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-2 col-lg-2 col-md-2">
            <c:if
              test="${id_layer_2_to_display != null}">
              <a href="StartPageContent"> <button type="button" href="09_admin_main_page.jsp" class="btn btn-block btn-default btn-outline-light bg-gradient-lightblue"><i
                class="fas fa-chevron-circle-left"></i>&nbsp;Menu główne
              </button></a>
            </c:if>

          </div>

          <div class="col-sm-10 col-lg-10 col-md-10">
            <h3 class="m-0">Matemania - Twój matematyczny przewodnik</h3>


          </div>

          <!-- /.col -->

        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->

        <!-- Wyświetl wszystkie warstwy jeśli parametr layer_2_to_display jest null (użytkownik nie wybrał nic na stronie głównej -->
        <c:if
          test="${id_layer_2_to_display == '' or id_layer_2_to_display == null or id_layer_2_to_display.equals('') or id_layer_2_to_display.equals(null)}">

          <c:forEach items="${topicsLayer1ListActive}" var="topicsLayer1ListActiveLoop">
            ${topicsLayer1ListActiveLoop.getName()}

            <div class="row">


              <c:forEach items="${topicsLayer2ListActive}" var="topicsLayer2ListActiveLoop" varStatus="myIndex">


                <c:if test="${topicsLayer1ListActiveLoop.getIdLayer1() == topicsLayer2ListActiveLoop.getFkIdLayer1()}">


                  <div class="col-lg-2 col-6">
                    <!-- small box -->
                    <div class="small-box ${topicsLayer2ListActiveLoop.getFe_menu_color()}">
                      <div class="inner">
                        <h6>${topicsLayer2ListActiveLoop.getName()}</h6>

                        <h3>${topicsLayer2ListActiveLoop.getCounter_layer_4()}</h3>
                      </div>
                      <div class="icon">
                        <i class="ion ${topicsLayer2ListActiveLoop.getFe_menu_icon()}"></i>
                      </div>
                      <a href="StartPageContent?id_layer_2_to_display=${topicsLayer2ListActiveLoop.getIdLayer2()}"
                         class="small-box-footer">Więcej <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                  </div>

                  <!-- ./col -->

                </c:if>
              </c:forEach>


              <!-- ./col -->
            </div>
          </c:forEach>
        </c:if>
        <!-- Wyświetl rekordy tylko z warstwy 3 (dla wybranej warstwy drugiej -->
        <c:if
          test="${id_layer_2_to_display != null}">

          <div class="row">
            <div class="col-2 col-sm-2 float-left">

            </div>
            <div class="col-10 col-sm-10">
            </div>
          </div>

          <div class="row">


            <c:forEach items="${topicsLayer3ListActive}" var="topicsLayer3ListActiveLoop" varStatus="myIndex">
              <c:if test="${topicsLayer3ListActiveLoop.getFkIdLayer2() == id_layer_2_to_display}">


                <div class="col-lg-2 col-6">
                  <!-- small box -->
                  <div class="small-box ${topicsLayer3ListActiveLoop.getFe_menu_color()}">
                    <div class="inner">
                      <h6>${topicsLayer3ListActiveLoop.getName()}</h6>

                      <h3>${topicsLayer4ListActive.stream().filter(l -> l.getFkIdLayer3().equals(topicsLayer3ListActiveLoop.getIdLayer3())).count()}</h3>


                    </div>
                    <div class="icon">

                      <i class="ion ${topicsLayer3ListActiveLoop.getFe_menu_icon()}"></i>
                    </div>
                    <a href="TheoryViewServlet?idLayer3=${topicsLayer3ListActiveLoop.getIdLayer3()}"
                       class="small-box-footer">Więcej <i class="fas fa-arrow-circle-right"></i></a>
                  </div>
                </div>


              </c:if>
            </c:forEach>
          </div>
        </c:if>

      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <!-- Footer -->
  <%@include file="003_footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>
