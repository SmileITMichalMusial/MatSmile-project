<% request.getSession().getAttribute("topicsLayer4ListActive"); %>
<% request.getSession().getAttribute("topicLayer1"); %>
<% request.getSession().getAttribute("topicLayer2"); %>
<% request.getSession().getAttribute("topicLayer3"); %>
<% request.getSession().getAttribute("nextTopicLayer3"); %>
<% request.getSession().getAttribute("previousTopicLayer3"); %>
  <!-- Lewe menu -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <div class="card card-primary card-outline card-lightblue">
      <div class="card-header">
        <div class="container-fluid">

          <div class="row">
            <!--<i class="fas fa-edit"></i> -->
            <div class="col-4 col-sm-4 float-left">
              ${previousTopicLayer3.getName()}
            </div>
            <div class="col-4 col-sm-4">
              ${topicLayer1.getName()} / ${topicLayer2.getName()} / ${topicLayer3.getName()}
            </div>
            <div class="col-4 col-sm-4 float-right">
              <div class="float-right">
                ${nextTopicLayer3.getName()}
              </div>
            </div>

          </div>

        </div>
      </div>
      <div class="card-body">

        <div class="row">
          <div class="col-2 col-sm-2">

            <div class="nav flex-column nav-tabs h-100" id="vert-tabs-tab" role="tablist" aria-orientation="vertical">
              <!-- ten stream filtruje tylko te elementy z warstwy 4 ktore sa przypisane do warstwy 3 ktora przyszła jako parametr-->
              <c:forEach
                items="${topicsLayer4ListActive.stream().filter(l -> l.getFkIdLayer3().equals(topicLayer3.getIdLayer3())).toList()}"
                var="topicsLayer4ListActiveLoop" varStatus="theCount">

                  <c:if test="${theCount.count == 1}">
                    <a class="nav-link active" id="vert-tabs-home-tab-${theCount.count}" data-toggle="pill"
                       href="#vert-tabs-home-${theCount.count}"
                       role="tab" aria-controls="vert-tabs-home-${theCount.count}"
                       aria-selected="true">${theCount.count}. ${topicsLayer4ListActiveLoop.getName()}</a>
                  </c:if>
                  <c:if test="${theCount.count != 1}">
                    <a class="nav-link" id="vert-tabs-home-tab-${theCount.count}" data-toggle="pill"
                       href="#vert-tabs-home-${theCount.count}"
                       role="tab" aria-controls="vert-tabs-home-${theCount.count}"
                       aria-selected="false">${theCount.count}. ${topicsLayer4ListActiveLoop.getName()}</a>
                  </c:if>


              </c:forEach>
            </div>
          </div>
          <div class="col-10 col-sm-10">
            <div class="tab-content" id="vert-tabs-tabContent">
              <c:forEach
                items="${topicsLayer4ListActive.stream().filter(l -> l.getFkIdLayer3().equals(topicLayer3.getIdLayer3())).toList()}"
                var="topicsLayer4ListActiveLoop" varStatus="theCount2">

                  <c:if test="${theCount2.count == 1}">
                    <div class="tab-pane text-left fade show active" id="vert-tabs-home-${theCount2.count}"
                         role="tabpanel"
                         aria-labelledby="vert-tabs-home-tab-${theCount2.count}"> ${topicsLayer4ListActiveLoop.getContent()}
                    </div>
                  </c:if>
                  <c:if test="${theCount2.count != 1}">
                    <div class="tab-pane fade" id="vert-tabs-home-${theCount2.count}" role="tabpanel"
                         aria-labelledby="vert-tabs-home-tab-${theCount2.count}"> ${topicsLayer4ListActiveLoop.getContent()}
                    </div>
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
