package pl.matemania.servlets.topicServlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.matemania.dao.TopicsDao;
import pl.matemania.domain.topics.TopicLayer1;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/TopicLayer1DeleteServlet")
class TopicLayer1DeleteServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogger(TopicLayer1DeleteServlet.class);

    @Inject
    TopicsDao topicsDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");

        TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(Integer.parseInt(id));

        if (topicLayer1.getActive()) {
            topicsDao.markTopicLayer1AsInactiveInDb(Integer.parseInt(id));
            logger.info("TopicLayer1 oznaczony jako nieaktywny w bazie danych:" +
                    " TopicLayer1 id: " + topicLayer1.getIdLayer1() +
                    " | TopicLayer1 name: " + topicLayer1.getName()
            );
        } else {
            topicsDao.markTopicLayer2AsActiveInDb(Integer.parseInt(id));
            logger.info("Użytkownik oznaczony jako aktywny w bazie danych:" +
                    " TopicLayer1 id: " + topicLayer1.getIdLayer1() +
                    " | TopicLayer1 name: " + topicLayer1.getName()

            );
        }
        // refresh TopicLayer1 list
        List<TopicLayer1> topicsLayer1List = topicsDao.getTopicLayer1FromDbSortedByOrderId();
        req.getSession().setAttribute("topicsLayer1List", topicsLayer1List);

        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        resp.sendRedirect(req.getContextPath() + "/AdminMainPageServlet");
        rd.forward(req, resp);
    }

}