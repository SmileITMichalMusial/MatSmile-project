<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>
<% request.getSession().getAttribute("listOfUsers"); %>
<% request.getSession().getAttribute("topicsLayer1List"); %>
<% request.getSession().getAttribute("topicsLayer2List"); %>
<% request.getSession().getAttribute("topicsLayer3List"); %>
<% request.getSession().getAttribute("topicsLayer4List"); %>


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


<section class="content">

  <div class="row">
    <div class="col-12">

      <!-- /.card -->

      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Menu portalu MateMania</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <table id="example1" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>Edycja</th>
              <th>id_1</th>
              <th>order_id_1</th>
              <th>id_2</th>
              <th>order_id_2</th>
              <th>id_3</th>
              <th>order_id_3</th>
              <th>id_4</th>
              <th>order_id_4</th>
              <th>Warstwa 1</th>
              <th>Warstwa 2</th>
              <th>Warstwa 3</th>
              <th>Warstwa 4</th>
              <th>Aktywny?</th>
              <th><em class="fa fa-cog"></em></th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${topicsLayer1List}" var="topicsLayer1ListLoop">

              <tr>
                <td>
                  <a href="TopicsEditServlet?id=${topicsLayer1ListLoop.getIdLayer1()}&layer_id=1"><em
                    class="fa fa-pencil-alt"></em></a>
                </td>
                <td>
                  <c:if test="${!topicsLayer1ListLoop.getActive()}">
                    <p class="text-muted">
                        ${topicsLayer1ListLoop.getIdLayer1()}
                    </p>
                  </c:if>
                  <c:if test="${topicsLayer1ListLoop.getActive()}">
                    ${topicsLayer1ListLoop.getIdLayer1()}
                  </c:if>
                </td>
                <td>
                  <c:if test="${!topicsLayer1ListLoop.getActive()}">
                    <p class="text-muted">
                        ${topicsLayer1ListLoop.getOrderId()}
                    </p>
                  </c:if>
                  <c:if test="${topicsLayer1ListLoop.getActive()}">
                    ${topicsLayer1ListLoop.getOrderId()}
                  </c:if>
                </td>
                <td>
                  ID_2
                </td>
                <td>
                  order_id_2
                </td>
                <td>
                  ID_3
                </td>
                <td>
                  order_id_3
                </td>
                <td>
                  ID_4
                </td>
                <td>
                  order_id_4
                </td>
                <td>
                  <c:if test="${!topicsLayer1ListLoop.getActive()}">
                    <p class="text-muted">
                        ${topicsLayer1ListLoop.getName()}
                    </p>
                  </c:if>
                  <c:if test="${topicsLayer1ListLoop.getActive()}">
                    ${topicsLayer1ListLoop.getName()}
                  </c:if>
                </td>
                <td>Warstwa 2 name</td>
                <td>Warstwa 3 name</td>
                <td>Warstwa 4 name</td>
                <td>
                  <c:if test="${!topicsLayer1ListLoop.getActive()}">
                    <p class="text-muted">
                        ${topicsLayer1ListLoop.getActive()}
                    </p>
                  </c:if>
                  <c:if test="${topicsLayer1ListLoop.getActive()}">
                    ${topicsLayer1ListLoop.getActive()}
                  </c:if>

                </td>
                <td>
                  <c:set var="active" scope="session"
                         value="${topicsLayer1ListLoop.getActive()}"/>
                  <c:if test="${active}">
                    <a href="TopicLayer1DeleteServlet?id=${topicsLayer1ListLoop.getIdLayer1()}"><em
                      class="fa fa-trash"></em></a>
                  </c:if>
                  <c:if test="${!active}">
                    <a href="TopicLayer1DeleteServlet?id=${topicsLayer1ListLoop.getIdLayer1()}"><em
                      class="fa fa-plus"></em></a>
                  </c:if>


                </td>
              </tr>
            </c:forEach>
            </tbody>

            <tfoot>
            <tr>
              <th>Edycja</th>
              <th>id_1</th>
              <th>order_id_1</th>
              <th>id_2</th>
              <th>order_id_2</th>
              <th>id_3</th>
              <th>order_id_3</th>
              <th>id_4</th>
              <th>order_id_4</th>
              <th>Warstwa 1</th>
              <th>Warstwa 2</th>
              <th>Warstwa 3</th>
              <th>Warstwa 4</th>
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

