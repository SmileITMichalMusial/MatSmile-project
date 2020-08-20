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
import java.util.List;

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

        request.getSession().setAttribute("topicsLayer1List",topicsLayer1List);
        request.getSession().setAttribute("topicsLayer2List",topicsLayer2List);
        request.getSession().setAttribute("topicsLayer3List",topicsLayer3List);
        request.getSession().setAttribute("topicsLayer4List",topicsLayer4List);

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    public StartPage() {}
}
