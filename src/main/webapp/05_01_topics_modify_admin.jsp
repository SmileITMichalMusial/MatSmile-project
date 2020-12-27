<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>
<% request.getSession().getAttribute("listOfUsers"); %>
<% request.getSession().getAttribute("topicsLayer1List"); %>
<% request.getSession().getAttribute("topicsLayer2List"); %>
<% request.getSession().getAttribute("topicsLayer3List"); %>
<% request.getSession().getAttribute("topicsLayer4List"); %>
<% request.getSession().getAttribute("topicLayer1"); %>


<head>g
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
    <h3 class="card-title">Edycja zawartości warstwa: ${topicLayer1.getName()}  </h3>
  </div>
  <!-- /.card-header -->
  <!-- form start -->
  <form role="form" method="post" action="TopicsEditServlet">
    <div class="card-body">
      <div class="form-group">
        <label for="name_edit">Name</label>
        <input type="text" class="form-control" name="name" id="name_edit" placeholder="name"
               value="${topicLayer1.getName()}">
      </div>
      <div class="form-group">
        <label for="order_edit">Order</label>
        <input type="text" class="form-control" name="order" id="order_edit" placeholder="Order" value="${topicLayer1.getOrderId()}">
      </div>
      <div class="form-group">
        <label for="comment_edit">Comment</label>
        <input type="text" class="form-control" name="comment" id="comment_edit" placeholder="Comment"
               value="${topicLayer1.getComment()}">
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

