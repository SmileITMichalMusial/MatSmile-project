<%@ page import="javax.swing.*" %>
<%@ page import="java.awt.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.getSession().getAttribute("userType"); %>
<% request.getAttribute("topic_modification_action"); %>
<% request.getAttribute("user_modification_action"); %>
<% request.getSession().getAttribute("topicsLayer1List"); %>
<% request.getSession().getAttribute("topicsLayer2List"); %>
<% request.getSession().getAttribute("topicsLayer3List"); %>
<% request.getSession().getAttribute("topicsLayer4List"); %>
<% request.getSession().getAttribute("topicsLayer4ListActive"); %>
<c:set var="login" scope="session" value="${login}"/>


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


  <!-- Content Wrapper. Contains page content

   tutaj wklej tresc strony
   -->
  <div class="content-wrapper">
    <div class="card card-primary card-outline">
      <div class="card-header">
        <h3 class="card-title">
          <!--<i class="fas fa-edit"></i> -->
          Panel Administracyjny
        </h3>
      </div>
      <div class="card-body">

        <div class="row">

          <!-- Menu Madministratora po lewej -->
          <div class="col-4 col-sm-3">
            <div class="nav flex-column nav-tabs h-100" id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
              <a class="nav-link active" id="vert-tabs-messages-tab" data-toggle="pill" href="#vert-tabs-messages"
                 role="tab"
                 aria-controls="vert-tabs-messages" aria-selected="true">Edycja menu strony</a>
              <a class="nav-link" id="vert-tabs-profile-tab" data-toggle="pill" href="#vert-tabs-profile"
                 role="tab"
                 aria-controls="vert-tabs-profile" aria-selected="false">Zarządzanie użytkownikami</a>
              <a class="nav-link" id="vert-tabs-home-tab" data-toggle="pill" href="#vert-tabs-home" role="tab"
                 aria-controls="vert-tabs-home" aria-selected="false">Edytuj wpis</a>
            </div>
          </div>

          <!-- Zawartość strony menu administratora -->
          <div class="col-8 col-sm-9">
            <div class="tab-content" id="vert-tabs-tabContent">
              <div class="tab-pane text-left fade show active" id="vert-tabs-messages" role="tabpanel"
                   aria-labelledby="vert-tabs-messages-tab">

                <c:if
                  test="${topic_modification_action == 'modify_topic_layer_1' || topic_modification_action == 'modify_topic_layer_2' || topic_modification_action == 'modify_topic_layer_3' || topic_modification_action == 'modify_topic_layer_4'}">
                  <%@include file="05_01_topics_modify_admin.jsp" %>
                </c:if>

                <c:if
                  test="${topic_modification_action == 'add_topic_layer_1' || topic_modification_action == 'add_topic_layer_2' || topic_modification_action == 'add_topic_layer_3' || topic_modification_action == 'add_topic_layer_4'}">
                  <%@include file="05_02_topics_add_admin.jsp" %>
                </c:if>

                <c:if
                  test="${topic_modification_action == '' or topic_modification_action == null or topic_modification_action.equals('') or topic_modification_action.equals(null)}">
                  <%@include file="05_topics_view_admin.jsp" %>
                </c:if>

              </div>
              <div class="tab-pane fade" id="vert-tabs-profile" role="tabpanel"
                   aria-labelledby="vert-tabs-profile-tab">


                <c:if test="${user_modification_action == 'modify_user'}">
                  <%@include file="04_01_user_modify_admin.jsp" %>
                </c:if>

                <c:if
                  test="${user_modification_action == '' or user_modification_action == null or user_modification_action.equals('') or user_modification_action.equals(null)}">
                  <%@include file="04_user_view_admin.jsp" %>
                </c:if>

              </div>
              <div class="tab-pane fade" id="vert-tabs-home" role="tabpanel"
                   aria-labelledby="vert-tabs-home-tab">

                <div class="row">
                  <div class="col-sm-3">
                    <!-- select -->
                    <div class="form-group">
                      <label>Warstwa 1</label>
                      <select class="form-control">
                        <c:forEach items="${topicsLayer1List}" var="topicLayer1Loop" varStatus="theCount">
                          <option>${topicLayer1Loop.getName()}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <!-- select -->
                    <div class="form-group">
                      <label>Warstwa 2</label>
                      <select class="form-control">
                        <c:forEach items="${topicsLayer2List}" var="topicLayer2Loop" varStatus="theCount">
                          <option>${topicLayer2Loop.getName()}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <!-- select -->
                    <div class="form-group">
                      <label>Warstwa 3</label>
                      <select class="form-control">
                        <c:forEach items="${topicsLayer3List}" var="topicLayer3Loop" varStatus="theCount">
                          <option>${topicLayer3Loop.getName()}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <!-- select -->
                    <div class="form-group">
                      <label>Warstwa 4</label>
                      <select class="form-control">
                        <c:forEach items="${topicsLayer4List}" var="topicLayer4Loop" varStatus="theCount">
                          <option>${topicLayer4Loop.getName()}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <%@include file="09_01_editors_form.jsp" %>
                </div>


              </div>
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
<!-- Summernote -->
<script>
  $(function () {
    // Summernote
    $('.textarea').summernote()
  })
</script>

<script src="plugins/summernote/summernote-math.js"></script>

<!-- Ustawienia Summernote -->
<script>
  $('#summernote').summernote({
    toolbar: [
      // [groupName, [list of button]]
      ['style', ['style']],
      ['font', ['bold', 'underline', 'strikethrough','clear']],
      ['fontname', ['fontname']],
      ['fontsize', ['fontsize']],
      ['color', ['color']],
      ['math', ['math']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link', 'picture', 'video','hr']],
      ['view', ['fullscreen', 'codeview', 'help']]
    ],
    focus: true


  });


</script>
</body>
</html>
