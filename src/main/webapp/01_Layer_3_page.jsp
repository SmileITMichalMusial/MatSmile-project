<%@ page import="javax.swing.*" %>
<%@ page import="java.awt.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.getAttribute("topicsLayer1List"); %>
<% request.getAttribute("topicsLayer2List"); %>
<% request.getAttribute("topicsLayer3List"); %>
<% request.getAttribute("topicsLayer4List"); %>
<% request.getAttribute("topicLayer3"); %>


<!DOCTYPE html>
<html lang="en">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>AdminLTE 3 | Dashboard</title>
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
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <%@include file="001_header.jsp" %>

  <%@include file="002_left_menu.jsp" %>

  <!-- Lewe menu -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <div class="card card-primary card-outline">
      <div class="card-header">
        <h3 class="card-title">
          <i class="fas fa-edit"></i>
          ${topicLayer3.getName()}
        </h3>
      </div>
      <div class="card-body">
        <h4>Left Sided</h4>
        <div class="row">
          <div class="col-5 col-sm-3">

            <div class="nav flex-column nav-tabs h-100" id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
              <c:forEach items="${topicsLayer4List}" var="topicLayer4Loop" varStatus="theCount">
                <c:if test="${topicLayer3.getIdLayer3() == topicLayer4Loop.getFkIdLayer3()}">
                  <c:if test="${theCount.count == 1}">
                    <a class="nav-link active" id="vert-tabs-home-tab-${theCount.count}" data-toggle="pill"
                       href="#vert-tabs-home-${theCount.count}"
                       role="tab" aria-controls="vert-tabs-home-${theCount.count}"
                       aria-selected="true">${theCount.count}. ${topicLayer4Loop.getName()}</a>
                  </c:if>
                  <c:if test="${theCount.count != 1}">
                    <a class="nav-link" id="vert-tabs-home-tab-${theCount.count}" data-toggle="pill"
                       href="#vert-tabs-home-${theCount.count}"
                       role="tab" aria-controls="vert-tabs-home-${theCount.count}"
                       aria-selected="false">${theCount.count}. ${topicLayer4Loop.getName()}</a>
                  </c:if>
                </c:if>

              </c:forEach>
            </div>
          </div>
          <div class="col-7 col-sm-9">
            <div class="tab-content" id="vert-tabs-tabContent">
              <c:forEach items="${topicsLayer4List}" var="topicLayer4Loop" varStatus="theCount2">
                <c:if test="${topicLayer3.getIdLayer3() == topicLayer4Loop.getFkIdLayer3()}">
                  <c:if test="${theCount2.count == 1}">
                    <div class="tab-pane text-left fade show active" id="vert-tabs-home-${theCount2.count}"
                         role="tabpanel"
                         aria-labelledby="vert-tabs-home-tab-${theCount2.count}"> ${topicLayer4Loop.getContent()}
                    </div>
                  </c:if>
                  <c:if test="${theCount2.count != 1}">
                    <div class="tab-pane fade" id="vert-tabs-home-${theCount2.count}" role="tabpanel"
                         aria-labelledby="vert-tabs-home-tab-${theCount2.count}"> ${topicLayer4Loop.getContent()}
                    </div>
                  </c:if>
                </c:if>
              </c:forEach>
            </div>
          </div>
        </div>

      </div>
      <!-- /.card -->
    </div>
  </div>
  <!-- /.card-body -->
  <div class="card-footer">
    Footer
  </div>
  <!-- /.card-footer-->
</div>
<!-- /.card -->

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