<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>
<% request.getSession().getAttribute("listOfUsers"); %>
<% request.getSession().getAttribute("topicsLayer1List"); %>
<% request.getSession().getAttribute("topicsLayer2List"); %>
<% request.getSession().getAttribute("topicsLayer3List"); %>
<% request.getSession().getAttribute("topicsLayer4List"); %>


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
          <h3 class="card-title">Menu portalu MateMania</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <table id="example1" class="table table-bordered table-striped">
            <thead>
            <tr>
              <th>Edycja</th>
              <th>id_1</th>
              <th>id_2</th>
              <th>id_3</th>
              <th>id_4</th>
              <th>Warstwa 1</th>
              <th>Warstwa 2</th>
              <th>Warstwa 3</th>
              <th>Warstwa 4</th>
              <th>Aktywny?</th>
              <th><em class="fa fa-cog"></em></th>
              <th>Dodaj nowy</th>
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
                        ${topicsLayer1ListLoop.getOrderId()}
                    </p>
                  </c:if>
                  <c:if test="${topicsLayer1ListLoop.getActive()}">
                    ${topicsLayer1ListLoop.getOrderId()}
                  </c:if>
                </td>
                <td style="width:1px;white-space:nowrap"></td>
                <td style="width:1px;white-space:nowrap"></td>
                <td style="width:1px;white-space:nowrap"></td>
                <td colspan="4">
                  <c:if test="${!topicsLayer1ListLoop.getActive()}">
                    <p class="text-muted">
                        ${topicsLayer1ListLoop.getName()}
                    </p>
                  </c:if>
                  <c:if test="${topicsLayer1ListLoop.getActive()}">
                    ${topicsLayer1ListLoop.getName()}
                  </c:if>
                </td>
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
                <td>Dodaj wpis 1</td>
              </tr>

              <c:forEach items="${topicsLayer2List}" var="topicsLayer2ListLoop">
                <c:if test="${topicsLayer1ListLoop.getIdLayer1() == topicsLayer2ListLoop.getFkIdLayer1()}">
                  <tr>
                    <td>
                      <a href="TopicsEditServlet?id=${topicsLayer2ListLoop.getIdLayer2()}&layer_id=2"><em
                        class="fa fa-pencil-alt"></em></a>
                    </td>
                    <td style="width:1px;white-space:nowrap"></td>
                    <td>
                      <c:if test="${!topicsLayer2ListLoop.getActive()}">
                        <p class="text-muted">
                            ${topicsLayer2ListLoop.getOrderId()}
                        </p>
                      </c:if>
                      <c:if test="${topicsLayer2ListLoop.getActive()}">
                        ${topicsLayer2ListLoop.getOrderId()}
                      </c:if>
                    </td>
                    <td style="width:1px;white-space:nowrap"></td>
                    <td style="width:1px;white-space:nowrap"></td>
                    <td style="width:1px;white-space:nowrap"></td>
                    <td colspan="3">
                      <c:if test="${!topicsLayer2ListLoop.getActive()}">
                        <p class="text-muted">
                            ${topicsLayer2ListLoop.getName()}
                        </p>
                      </c:if>
                      <c:if test="${topicsLayer2ListLoop.getActive()}">
                        ${topicsLayer2ListLoop.getName()}
                      </c:if>
                    </td>
                    <td>
                      <c:if test="${!topicsLayer2ListLoop.getActive()}">
                        <p class="text-muted">
                            ${topicsLayer2ListLoop.getActive()}
                        </p>
                      </c:if>
                      <c:if test="${topicsLayer2ListLoop.getActive()}">
                        ${topicsLayer2ListLoop.getActive()}
                      </c:if>

                    </td>
                    <td>
                      <c:set var="active" scope="session"
                             value="${topicsLayer2ListLoop.getActive()}"/>
                      <c:if test="${active}">
                        <a href="TopicLayer1DeleteServlet?id=${topicsLayer1ListLoop.getIdLayer1()}"><em
                          class="fa fa-trash"></em></a>
                      </c:if>
                      <c:if test="${!active}">
                        <a href="TopicLayer1DeleteServlet?id=${topicsLayer1ListLoop.getIdLayer1()}"><em
                          class="fa fa-plus"></em></a>
                      </c:if>


                    </td>
                    <td>Dodaj wpis 2</td>
                  </tr>
                </c:if>

                <c:forEach items="${topicsLayer3List}" var="topicsLayer3ListLoop">
                  <c:if
                    test="${topicsLayer1ListLoop.getIdLayer1() == topicsLayer2ListLoop.getFkIdLayer1() && topicsLayer2ListLoop.getIdLayer2() == topicsLayer3ListLoop.getFkIdLayer2()}">
                    <tr>
                      <td>
                        <a href="TopicsEditServlet?id=${topicsLayer3ListLoop.getIdLayer3()}&layer_id=3"><em
                          class="fa fa-pencil-alt"></em></a>
                      </td>
                      <td style="width:1px;white-space:nowrap"></td>
                      <td style="width:1px;white-space:nowrap"></td>
                      <td>
                        <c:if test="${!topicsLayer3ListLoop.getActive()}">
                          <p class="text-muted">
                              ${topicsLayer3ListLoop.getOrderId()}
                          </p>
                        </c:if>
                        <c:if test="${topicsLayer3ListLoop.getActive()}">
                          ${topicsLayer3ListLoop.getOrderId()}
                        </c:if>
                      </td>
                      <td style="width:1px;white-space:nowrap"></td>
                      <td colspan="2" style="width:1px;white-space:nowrap"></td>
                      <td colspan="2">
                        <c:if test="${!topicsLayer3ListLoop.getActive()}">
                          <p class="text-muted">
                              ${topicsLayer3ListLoop.getName()}
                          </p>
                        </c:if>
                        <c:if test="${topicsLayer3ListLoop.getActive()}">
                          ${topicsLayer3ListLoop.getName()}
                        </c:if>
                      </td>
                      <td>
                        <c:if test="${!topicsLayer3ListLoop.getActive()}">
                          <p class="text-muted">
                              ${topicsLayer3ListLoop.getActive()}
                          </p>
                        </c:if>
                        <c:if test="${topicsLayer3ListLoop.getActive()}">
                          ${topicsLayer3ListLoop.getActive()}
                        </c:if>

                      </td>
                      <td>
                        <c:set var="active" scope="session"
                               value="${topicsLayer3ListLoop.getActive()}"/>
                        <c:if test="${active}">
                          <a href="TopicLayer1DeleteServlet?id=${topicsLayer3ListLoop.getIdLayer3()}"><em
                            class="fa fa-trash"></em></a>
                        </c:if>
                        <c:if test="${!active}">
                          <a href="TopicLayer1DeleteServlet?id=${topicsLayer3ListLoop.getIdLayer3()}"><em
                            class="fa fa-plus"></em></a>
                        </c:if>


                      </td>
                      <td>Dodaj wpis 3</td>
                    </tr>
                  </c:if>

                  <c:forEach items="${topicsLayer4List}" var="topicsLayer4ListLoop">
                    <c:if
                      test="${topicsLayer1ListLoop.getIdLayer1() == topicsLayer2ListLoop.getFkIdLayer1() && topicsLayer2ListLoop.getIdLayer2() == topicsLayer3ListLoop.getFkIdLayer2() && topicsLayer3ListLoop.getIdLayer3() == topicsLayer4ListLoop.getFkIdLayer3()}">
                      <tr>
                        <td>
                          <a href="TopicsEditServlet?id=${topicsLayer4ListLoop.getIdLayer4()}&layer_id=4"><em
                            class="fa fa-pencil-alt"></em></a>
                        </td>
                        <td style="width:1px;white-space:nowrap"></td>
                        <td style="width:1px;white-space:nowrap"></td>
                        <td style="width:1px;white-space:nowrap"></td>
                        <td>
                          <c:if test="${!topicsLayer4ListLoop.getActive()}">
                            <p class="text-muted">
                                ${topicsLayer4ListLoop.getOrderId()}
                            </p>
                          </c:if>
                          <c:if test="${topicsLayer4ListLoop.getActive()}">
                            ${topicsLayer4ListLoop.getOrderId()}
                          </c:if>
                        </td>
                        <td colspan="3" style="width:1px;white-space:nowrap"></td>
                        <td>
                          <c:if test="${!topicsLayer4ListLoop.getActive()}">
                            <p class="text-muted">
                                ${topicsLayer4ListLoop.getName()}
                            </p>
                          </c:if>
                          <c:if test="${topicsLayer4ListLoop.getActive()}">
                            ${topicsLayer4ListLoop.getName()}
                          </c:if>
                        </td>
                        <td>
                          <c:if test="${!topicsLayer4ListLoop.getActive()}">
                            <p class="text-muted">
                                ${topicsLayer4ListLoop.getActive()}
                            </p>
                          </c:if>
                          <c:if test="${topicsLayer4ListLoop.getActive()}">
                            ${topicsLayer4ListLoop.getActive()}
                          </c:if>

                        </td>
                        <td>
                          <c:set var="active" scope="session"
                                 value="${topicsLayer4ListLoop.getActive()}"/>
                          <c:if test="${active}">
                            <a href="TopicLayer1DeleteServlet?id=${topicsLayer4ListLoop.getIdLayer4()}"><em
                              class="fa fa-trash"></em></a>
                          </c:if>
                          <c:if test="${!active}">
                            <a href="TopicLayer1DeleteServlet?id=${topicsLayer4ListLoop.getIdLayer4()}"><em
                              class="fa fa-plus"></em></a>
                          </c:if>


                        </td>
                        <td>Dodaj wpis 4</td>
                      </tr>
                    </c:if>

                  </c:forEach>
                </c:forEach>
              </c:forEach>
            </c:forEach>
            </tbody>


            <tfoot>
            <tr>
              <th>Edycja</th>
              <th>id_1</th>
              <th>id_2</th>
              <th>id_3</th>
              <th>id_4</th>
              <th>Warstwa 1</th>
              <th>Warstwa 2</th>
              <th>Warstwa 3</th>
              <th>Warstwa 4</th>
              <th>Aktywny?</th>
              <th><em class="fa fa-cog"></em></th>
              <th>Dodaj nowy</th>
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

