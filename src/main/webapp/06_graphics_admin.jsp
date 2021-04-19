<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>
<% request.getSession().getAttribute("listOfUsers"); %>





<section class="content">

  <div class="row">
    <div class="col-12">

      <!-- /.card -->

      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Zarządzanie obrazkami</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">


          <form class="form-wrapper" method="post" action="PictureUploadServlet" enctype="multipart/form-data">



            <div class="input-group image-preview">

              <input type="text" class="form-control image-preview-filename" disabled="disabled"
                     placeholder="Wybierz zdjęcie...">
              <!-- don't give a name === doesn't send on POST/GET -->
              <span class="input-group-append">
    <!-- image-preview-clear button -->
    <button type="button" class="btn btn-info image-preview-clear" style="display:none;">
    <span class="glyphicon glyphicon-remove"></span> Wyczyść
    </button>
                <!-- image-preview-input -->
    <div type="button" class="btn btn-default image-preview-input">
    <span class="glyphicon glyphicon-folder-open"></span>
    <span class="image-preview-input-title">Wybierz</span>
    <input type="file" accept="image/png, image/jpeg, image/gif"
           name="image" id="file"/> <!-- rename it -->
    </div>
    </span>
            </div>


            <button type="submit" name="save" class="btn btn-default">Dodaj obrazek <i
              class="fa fa-envelope-open-o"></i></button>
            <a href="/jsp/01_admin_pages/22_1_employees_view.jsp" class="btn btn-default">Anuluj<i
              class="fa fa-backward"></i></a>
          </form>




        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->

</section>

