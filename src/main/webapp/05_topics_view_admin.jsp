<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="login" scope="session" value="${login}"/>
<% request.getSession().getAttribute("listOfUsers"); %>
<% request.getSession().getAttribute("topicsLayer1List"); %>
<% request.getSession().getAttribute("topicsLayer2List"); %>
<% request.getSession().getAttribute("topicsLayer3List"); %>
<% request.getSession().getAttribute("topicsLayer4ListWithoutContent"); %>


<section class="content">

  <div class="row">
    <div class="col-12">

      <!-- /.card -->

      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Menu portalu MateMania</h3>
          <h6 class="small"><br><br>Legenda:<br>
            <ul>
              <li>kolumna "Dodaj nowy": Okrągły plusik dodaje nowy wiersz w danej warstwie i sekcji</li>
              <li>kwadratowy plusik obok nazwy warstwy: pojawia się tylko wtedy gdy nie ma ani jednego wiersza w niższej warstwie. Tworzy
                pierwszy rekord niższej warstwy
              </li>
              <li>koło zębate: aktywuje / deaktywuje wiersz (nieaktywne wiersze sią niewodiczne w menu dla użytkownika)</li>
            </ul>

          </h6>
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
                  <a
                    href="TopicsEditServlet?unique_topic_record_id=${topicsLayer1ListLoop.getIdLayer1()}&layer_number=1"><em
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
                      <!-- sprawdzenie czy rekord warstwy jeden ma rekord-dziecko w warstwie 2. Jeśli nie ma to przycisk aby dodać -->
                      <c:if
                        test="${!topicsLayer2List.stream().anyMatch(l -> l.getFkIdLayer1().equals(topicsLayer1ListLoop.getIdLayer1()))}">
                        <a href="TopicsAddServlet?unique_topic_record_id=${topicsLayer1ListLoop.getIdLayer1()}&layer_number=2"><em
                          class="fa fa-plus-square"></em></a>
                      </c:if>
                      <!-- koniec sprawdzenia czy rekord warstwy jeden ma rekord-dziecko w warstwie 2 -->

                    </p>
                  </c:if>
                  <c:if test="${topicsLayer1ListLoop.getActive()}">
                    ${topicsLayer1ListLoop.getName()}
                    <!-- sprawdzenie czy rekord warstwy jeden ma rekord-dziecko w warstwie 2. Jeśli nie ma to przycisk aby dodać -->
                    <c:if
                      test="${!topicsLayer2List.stream().anyMatch(l -> l.getFkIdLayer1().equals(topicsLayer1ListLoop.getIdLayer1()))}">
                      <a href="TopicsAddServlet?unique_topic_record_id=${topicsLayer1ListLoop.getIdLayer1()}&layer_number=2"><em
                        class="fa fa-plus-square"></em></a>
                    </c:if>
                    <!-- koniec sprawdzenia czy rekord warstwy jeden ma rekord-dziecko w warstwie 2 -->
                  </c:if>
                </td>
                <td>
                  <c:if test="${!topicsLayer1ListLoop.getActive()}">
                    <p class="text-muted">
                      Nie
                    </p>
                  </c:if>
                  <c:if test="${topicsLayer1ListLoop.getActive()}">
                    Tak
                  </c:if>

                </td>
                <td>
                  <c:set var="active" scope="session"
                         value="${topicsLayer1ListLoop.getActive()}"/>
                  <c:if test="${active}">
                    <a href="TopicActiveInactiveServlet?layer_number=1&id=${topicsLayer1ListLoop.getIdLayer1()}"><em
                      class="fa fa-trash"></em></a>
                  </c:if>
                  <c:if test="${!active}">
                    <a href="TopicActiveInactiveServlet?layer_number=1&id=${topicsLayer1ListLoop.getIdLayer1()}"><em
                      class="fa fa-plus"></em></a>
                  </c:if>


                </td>
                <td><a href="TopicsAddServlet?layer_number=1"><em
                  class="fa fa-plus-circle"></em></a></td>
              </tr>

              <c:forEach items="${topicsLayer2List}" var="topicsLayer2ListLoop">
                <c:if test="${topicsLayer1ListLoop.getIdLayer1() == topicsLayer2ListLoop.getFkIdLayer1()}">
                  <tr>
                    <td>
                      <a
                        href="TopicsEditServlet?unique_topic_record_id=${topicsLayer2ListLoop.getIdLayer2()}&layer_number=2"><em
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
                          <!-- sprawdzenie czy rekord warstwy dwa  ma rekord-dziecko w warstwie 3. Jeśli nie ma to przycisk aby dodać -->
                          <c:if
                            test="${!topicsLayer3List.stream().anyMatch(l -> l.getFkIdLayer2().equals(topicsLayer2ListLoop.getIdLayer2()))}">
                            <a
                              href="TopicsAddServlet?unique_topic_record_id=${topicsLayer2ListLoop.getIdLayer2()}&layer_number=3"><em
                              class="fa fa-plus-square"></em></a>
                          </c:if>
                          <!-- koniec sprawdzenia czy rekord warstwy dwa ma rekord-dziecko w warstwie 3 -->
                        </p>
                      </c:if>
                      <c:if test="${topicsLayer2ListLoop.getActive()}">
                        ${topicsLayer2ListLoop.getName()}
                        <!-- sprawdzenie czy rekord warstwy dwa ma rekord-dziecko w warstwie 3. Jeśli nie ma to przycisk aby dodać
                        Przycisk zawiera link do dodania warstwy drugiej (w odróżnieniu od kolumny "dodaj nowy" gdzie dodajemy daną warstwę (tutaj 1.)
                        tzn: link pod plusem tutaj jest taki sam jak link pod plusem w warstwie drugiej
                        -->

                        <c:if
                          test="${!topicsLayer3List.stream().anyMatch(l -> l.getFkIdLayer2().equals(topicsLayer2ListLoop.getIdLayer2()))}">
                          <a
                            href="TopicsAddServlet?unique_topic_record_id=${topicsLayer2ListLoop.getIdLayer2()}&layer_number=3"><em
                            class="fa fa-plus-square"></em></a>
                        </c:if>
                        <!-- koniec sprawdzenia czy rekord warstwy dwa ma rekord-dziecko w warstwie 3 -->

                      </c:if>
                    </td>
                    <td>
                      <c:if test="${!topicsLayer2ListLoop.getActive()}">
                        <p class="text-muted">
                          Nie
                        </p>
                      </c:if>
                      <c:if test="${topicsLayer2ListLoop.getActive()}">
                        Tak
                      </c:if>

                    </td>
                    <td>
                      <c:set var="active" scope="session"
                             value="${topicsLayer2ListLoop.getActive()}"/>
                      <c:if test="${active}">
                        <a href="TopicActiveInactiveServlet?layer_number=2&id=${topicsLayer2ListLoop.getIdLayer2()}"><em
                          class="fa fa-trash"></em></a>
                      </c:if>
                      <c:if test="${!active}">
                        <a href="TopicActiveInactiveServlet?layer_number=2&id=${topicsLayer2ListLoop.getIdLayer2()}"><em
                          class="fa fa-plus"></em></a>
                      </c:if>


                    </td>
                    <td><a
                      href="TopicsAddServlet?unique_topic_record_id=${topicsLayer1ListLoop.getIdLayer1()}&layer_number=2"><em
                      class="fa fa-plus-circle"></em></a></td>
                  </tr>
                </c:if>

                <c:forEach items="${topicsLayer3List}" var="topicsLayer3ListLoop">
                  <c:if
                    test="${topicsLayer1ListLoop.getIdLayer1() == topicsLayer2ListLoop.getFkIdLayer1() && topicsLayer2ListLoop.getIdLayer2() == topicsLayer3ListLoop.getFkIdLayer2()}">
                    <tr>
                      <td>
                        <a
                          href="TopicsEditServlet?unique_topic_record_id=${topicsLayer3ListLoop.getIdLayer3()}&layer_number=3"><em
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
                            <!-- sprawdzenie czy rekord warstwy trzy   ma rekord-dziecko w warstwie 4. Jeśli nie ma to przycisk aby dodać -->
                            <c:if
                              test="${!topicsLayer4ListWithoutContent.stream().anyMatch(l -> l.getFkIdLayer3().equals(topicsLayer3ListLoop.getIdLayer3()))}">
                              <a
                                href="TopicsAddServlet?unique_topic_record_id=${topicsLayer3ListLoop.getIdLayer3()}&layer_number=4"><em
                                class="fa fa-plus-square"></em></a>
                            </c:if>
                            <!-- koniec sprawdzenia czy rekord warstwy trzy ma rekord-dziecko w warstwie 4 -->
                          </p>
                        </c:if>
                        <c:if test="${topicsLayer3ListLoop.getActive()}">
                          ${topicsLayer3ListLoop.getName()}
                          <!-- sprawdzenie czy rekord warstwy trzy ma rekord-dziecko w warstwie 4. Jeśli nie ma to przycisk aby dodać -->
                          <c:if
                            test="${!topicsLayer4ListWithoutContent.stream().anyMatch(l -> l.getFkIdLayer3().equals(topicsLayer3ListLoop.getIdLayer3()))}">
                            <a
                              href="TopicsAddServlet?unique_topic_record_id=${topicsLayer3ListLoop.getIdLayer3()}&layer_number=4"><em
                              class="fa fa-plus-square"></em></a>
                          </c:if>
                          <!-- koniec sprawdzenia czy rekord warstwy trzy ma rekord-dziecko w warstwie 4 -->
                        </c:if>
                      </td>
                      <td>
                        <c:if test="${!topicsLayer3ListLoop.getActive()}">
                          <p class="text-muted">
                            Nie
                          </p>
                        </c:if>
                        <c:if test="${topicsLayer3ListLoop.getActive()}">
                          Tak
                        </c:if>

                      </td>
                      <td>
                        <c:set var="active" scope="session"
                               value="${topicsLayer3ListLoop.getActive()}"/>
                        <c:if test="${active}">
                          <a
                            href="TopicActiveInactiveServlet?layer_number=3&id=${topicsLayer3ListLoop.getIdLayer3()}"><em
                            class="fa fa-trash"></em></a>
                        </c:if>
                        <c:if test="${!active}">
                          <a
                            href="TopicActiveInactiveServlet?layer_number=3&id=${topicsLayer3ListLoop.getIdLayer3()}"><em
                            class="fa fa-plus"></em></a>
                        </c:if>


                      </td>
                      <td><a
                        href="TopicsAddServlet?unique_topic_record_id=${topicsLayer2ListLoop.getIdLayer2()}&layer_number=3"><em
                        class="fa fa-plus-circle"></em></a></td>
                    </tr>
                  </c:if>

                  <c:forEach items="${topicsLayer4ListWithoutContent}" var="topicsLayer4ListLoop">
                    <c:if
                      test="${topicsLayer1ListLoop.getIdLayer1() == topicsLayer2ListLoop.getFkIdLayer1() && topicsLayer2ListLoop.getIdLayer2() == topicsLayer3ListLoop.getFkIdLayer2() && topicsLayer3ListLoop.getIdLayer3() == topicsLayer4ListLoop.getFkIdLayer3()}">
                      <tr>
                        <td>
                          <a
                            href="TopicsEditServlet?unique_topic_record_id=${topicsLayer4ListLoop.getIdLayer4()}&layer_number=4"><em
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
                              Nie
                            </p>
                          </c:if>
                          <c:if test="${topicsLayer4ListLoop.getActive()}">
                            Tak
                          </c:if>

                        </td>
                        <td>
                          <c:set var="active" scope="session"
                                 value="${topicsLayer4ListLoop.getActive()}"/>
                          <c:if test="${active}">
                            <a
                              href="TopicActiveInactiveServlet?layer_number=4&id=${topicsLayer4ListLoop.getIdLayer4()}"><em
                              class="fa fa-trash"></em></a>
                          </c:if>
                          <c:if test="${!active}">
                            <a
                              href="TopicActiveInactiveServlet?layer_number=4&id=${topicsLayer4ListLoop.getIdLayer4()}"><em
                              class="fa fa-plus"></em></a>
                          </c:if>


                        </td>
                        <td><a
                          href="TopicsAddServlet?unique_topic_record_id=${topicsLayer3ListLoop.getIdLayer3()}&layer_number=4"><em
                          class="fa fa-plus-circle"></em></a></td>
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

