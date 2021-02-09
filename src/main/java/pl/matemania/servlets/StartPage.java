package pl.matemania.servlets;

import pl.matemania.dao.TopicsDao;
import pl.matemania.domain.topics.TopicLayer1;
import pl.matemania.domain.topics.TopicLayer2;
import pl.matemania.domain.topics.TopicLayer3;
import pl.matemania.domain.topics.TopicLayer4;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/StartPage")
public class StartPage extends HttpServlet {

    @Inject
    TopicsDao topicsDao;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        List<TopicLayer1> topicsLayer1List = topicsDao.getTopicLayer1FromDbSortedByOrderId();
        List<TopicLayer2> topicsLayer2List = topicsDao.getTopicLayer2FromDbSortedByOrderId();
        List<TopicLayer3> topicsLayer3List = topicsDao.getTopicLayer3FromDbSortedByOrderId();
        List<TopicLayer4> topicsLayer4List = topicsDao.getTopicLayer4FromDbSortedByOrderId();

        List<TopicLayer1> topicsLayer1ListActive = topicsDao.getTopicLayer1FromDbActiveSortedByOrderId();
        List<TopicLayer2> topicsLayer2ListActive = topicsDao.getTopicLayer2FromDbActiveSortedByOrderId();
        List<TopicLayer3> topicsLayer3ListActive = topicsDao.getTopicLayer3FromDbActiveSortedByOrderId();
        List<TopicLayer4> topicsLayer4ListActive = topicsDao.getTopicLayer4FromDbActiveSortedByOrderId();



        request.getSession().setAttribute("topicsLayer1List", topicsLayer1List);
        request.getSession().setAttribute("topicsLayer2List", topicsLayer2List);
        request.getSession().setAttribute("topicsLayer3List", topicsLayer3List);
        request.getSession().setAttribute("topicsLayer4List", topicsLayer4List);

        request.getSession().setAttribute("topicsLayer1ListActive", topicsLayer1ListActive);
        request.getSession().setAttribute("topicsLayer2ListActive", topicsLayer2ListActive);
        request.getSession().setAttribute("topicsLayer3ListActive", topicsLayer3ListActive);
        request.getSession().setAttribute("topicsLayer4ListActive", topicsLayer4ListActive);



        String id_layer_2_to_display = request.getParameter("id_layer_2_to_display");
        request.getSession().setAttribute("id_layer_2_to_display", id_layer_2_to_display);

        List<TopicLayer3> topicsLayer3ToDisplay = topicsLayer3ListActive
                .stream()
                .filter(p -> p.getFkIdLayer2()
                        .equals(id_layer_2_to_display))
                .collect(Collectors.toList());

        request.getSession().setAttribute("topicsLayer3ToDisplay", topicsLayer3ToDisplay);

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    public StartPage() {
    }
}
