package pl.matemania.servlets;

import pl.matemania.dao.TopicsDao;
import pl.matemania.domain.topics.TopicLayer3;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/TheoryViewServlet")
public class TheoryViewServlet extends HttpServlet {

    @Inject
    TopicsDao topicsDao;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String idLayer3 = request.getParameter("idLayer3");
        TopicLayer3 topicLayer3 = topicsDao.getSingleTopicLayer3(Integer.parseInt(idLayer3));
        request.getSession().setAttribute("topicLayer3",topicLayer3);

        RequestDispatcher rd = request.getRequestDispatcher("01_Layer_3_page.jsp");
        rd.forward(request, response);
        return;
    }

    public TheoryViewServlet() {}
}
