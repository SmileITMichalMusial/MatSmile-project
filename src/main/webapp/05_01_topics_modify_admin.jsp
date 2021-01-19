<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>
<% request.getSession().getAttribute("listOfUsers"); %>
<% request.getSession().getAttribute("topicsLayer1List"); %>
<% request.getSession().getAttribute("topicsLayer2List"); %>
<% request.getSession().getAttribute("topicsLayer3List"); %>
<% request.getSession().getAttribute("topicsLayer4List"); %>
<% request.getSession().getAttribute("topicsLayer1ListActive"); %>
<% request.getSession().getAttribute("topicsLayer2ListActive"); %>
<% request.getSession().getAttribute("topicsLayer3ListActive"); %>
<% request.getSession().getAttribute("topicsLayer4ListActive"); %>
<% request.getSession().getAttribute("topic_modification_action"); %>
<% request.getSession().getAttribute("topicLayer1"); %>
<% request.getSession().getAttribute("topicLayer2"); %>
<% request.getSession().getAttribute("topicLayer3"); %>
<% request.getSession().getAttribute("topicLayer4"); %>




<c:if test="${topic_modification_action == 'modify_topic_layer_1'}">
  <div class="card card-primary">
    <div class="card-header">
      <h3 class="card-title">Edycja zawartości warstwa: ${topicLayer1.getName()}  </h3>
    </div>
    <!-- /.card-header -->
    <!-- form start -->
    <form role="form" method="post" action="TopicsEditServlet">
      <div class="card-body">
        <div class="form-group">
          <label for="name_edit">Nazwa</label>
          <input type="text" class="form-control" name="name" id="name_edit" placeholder="name"
                 value="${topicLayer1.getName()}">
        </div>
        <div class="form-group">
          <label for="order_edit">Kolejność</label>
          <input type="text" class="form-control" name="order" id="order_edit" placeholder="Order"
                 value="${topicLayer1.getOrderId()}">
        </div>
        <div class="form-group">
          <label for="comment_edit">Komentarz (niewidoczny na stronie)</label>
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
</c:if>

<c:if test="${topic_modification_action == 'modify_topic_layer_2'}">
  <div class="card card-primary">
    <div class="card-header">
      <h3 class="card-title">Edycja zawartości warstwa: ${topicLayer2.getName()}  </h3>
    </div>
    <!-- /.card-header -->
    <!-- form start -->
    <form role="form" method="post" action="TopicsEditServlet">
      <div class="card-body">
        <div class="form-group">
          <label for="name_edit">Nazwa</label>
          <input type="text" class="form-control" name="name" id="name_edit" placeholder="name"
                 value="${topicLayer2.getName()}">
        </div>
        <div class="form-group">
          <label for="order_edit">Kolejność</label>
          <input type="text" class="form-control" name="order" id="order_edit" placeholder="Order"
                 value="${topicLayer2.getOrderId()}">
        </div>
        <div class="form-group">
          <label for="comment_edit">Komentarz (niewidoczny na stronie)</label>
          <input type="text" class="form-control" name="comment" id="comment_edit" placeholder="Comment"
                 value="${topicLayer2.getComment()}">
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
</c:if>

<c:if test="${topic_modification_action == 'modify_topic_layer_3'}">
  <div class="card card-primary">
    <div class="card-header">
      <h3 class="card-title">Edycja zawartości warstwa: ${topicLayer3.getName()}  </h3>
    </div>
    <!-- /.card-header -->
    <!-- form start -->
    <form role="form" method="post" action="TopicsEditServlet">
      <div class="card-body">
        <div class="form-group">
          <label for="name_edit">Nazwa</label>
          <input type="text" class="form-control" name="name" id="name_edit" placeholder="name"
                 value="${topicLayer3.getName()}">
        </div>
        <div class="form-group">
          <label for="order_edit">Kolejność</label>
          <input type="text" class="form-control" name="order" id="order_edit" placeholder="Order"
                 value="${topicLayer3.getOrderId()}">
        </div>
        <div class="form-group">
          <label for="comment_edit">Komentarz (niewidoczny na stronie)</label>
          <input type="text" class="form-control" name="comment" id="comment_edit" placeholder="Comment"
                 value="${topicLayer3.getComment()}">
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
</c:if>

<c:if test="${topic_modification_action == 'modify_topic_layer_4'}">
  <div class="card card-primary">
    <div class="card-header">
      <h3 class="card-title">Edycja zawartości warstwa: ${topicLayer4.getName()}  </h3>
    </div>
    <!-- /.card-header -->
    <!-- form start -->
    <form role="form" method="post" action="TopicsEditServlet">
      <div class="card-body">
        <div class="form-group">
          <label for="name_edit">Nazwa</label>
          <input type="text" class="form-control" name="name" id="name_edit" placeholder="name"
                 value="${topicLayer4.getName()}">
        </div>
        <div class="form-group">
          <label for="order_edit">Kolejność</label>
          <input type="text" class="form-control" name="order" id="order_edit" placeholder="Order"
                 value="${topicLayer4.getOrderId()}">
        </div>
        <div class="form-group">
          <label for="comment_edit">Komentarz (niewidoczny na stronie)</label>
          <input type="text" class="form-control" name="comment" id="comment_edit" placeholder="Comment"
                 value="${topicLayer4.getComment()}">
        </div>

        <div class="card-body pad">
          <div class="mb-3">
            <label for="summernote">Treść</label>
            <textarea class="textarea" placeholder="Place some text here" id="summernote" name="content"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">

                ${topicLayer4.getContent()}
            </textarea>
          </div>
          <p class="text-sm mb-0">
            Edytor <a href="https://github.com/summernote/summernote">Dokumentacja i licencja</a>
          </p>
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

</c:if>

