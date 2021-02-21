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
import java.util.Optional;

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
        TopicLayer2 topicLayer2 = topicsDao.getSingleTopicLayer2(topicLayer3.getFkIdLayer2());
        TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(topicLayer2.getFkIdLayer1());

        //Integer previousOrderIdLayer3 = topicLayer3.getOrderId() - 1;
        //Integer nextOrderIdLayer3 = topicLayer3.getOrderId() + 1;
        TopicLayer3 nextTopicLayer3 = topicsDao.getTopicLayer3WithNextOrderId(topicLayer3.getOrderId(), topicLayer3.getFkIdLayer2());
        TopicLayer3 previousTopicLayer3 = topicsDao.getTopicLayer3WithPreviousOrderId(topicLayer3.getOrderId(), topicLayer3.getFkIdLayer2());
        //System.out.println("next id to: "+nextTopicLayer3.getName() + nextTopicLayer3.getIdLayer3());
        // pobierz grupe z warstwy 4 do wyswietlenia
        List<TopicLayer4> topicLayer4GroupToDisplay = topicsDao.getTopicLayer4GroupForTopicLayer3Id(topicLayer3.getIdLayer3());


        request.getSession().setAttribute("topicLayer1",topicLayer1);
        request.getSession().setAttribute("topicLayer2",topicLayer2);
        request.getSession().setAttribute("topicLayer3",topicLayer3);
        request.getSession().setAttribute("topicLayer4GroupToDisplay",topicLayer4GroupToDisplay);
        request.getSession().setAttribute("nextTopicLayer3",nextTopicLayer3);
        request.getSession().setAttribute("previousTopicLayer3",previousTopicLayer3);

        RequestDispatcher rd = request.getRequestDispatcher("01_Layer_3_page.jsp");
        rd.forward(request, response);
        return;
    }

    public TheoryViewServlet() {}
}
