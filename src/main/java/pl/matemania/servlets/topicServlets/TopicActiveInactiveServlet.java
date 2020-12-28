package pl.matemania.servlets.topicServlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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

@WebServlet("/TopicActiveInactiveServlet")
class TopicActiveInactiveServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogger(TopicActiveInactiveServlet.class);

    @Inject
    TopicsDao topicsDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String layer_number = req.getParameter("layer_number");
        String id = req.getParameter("id");

        if (layer_number.equals("1")) {

            TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(Integer.parseInt(id));

            if (topicLayer1.getActive()) {
                topicsDao.markTopicLayer1AsInactiveInDb(Integer.parseInt(id));
                logger.info("Topic z warstwy numer" + layer_number + "oznaczony jako nieaktywny w bazie danych:" +
                        " Topic id: " + topicLayer1.getIdLayer1() +
                        " | Topic name: " + topicLayer1.getName()
                );
            } else {
                topicsDao.markTopicLayer1AsActiveInDb(Integer.parseInt(id));
                logger.info("Topic z warstwy numer" + layer_number + "oznaczony jako aktywny w bazie danych:" +
                        " Topic id: " + topicLayer1.getIdLayer1() +
                        " | Topic name: " + topicLayer1.getName()
                );
            }
            // refresh TopicLayer1 list
            List<TopicLayer1> topicsLayer1List = topicsDao.getTopicLayer1FromDbSortedByOrderId();
            req.getSession().setAttribute("topicsLayer1List", topicsLayer1List);
        }

        if (layer_number.equals("2")) {

            TopicLayer2 topicLayer2 = topicsDao.getSingleTopicLayer2(Integer.parseInt(id));

            if (topicLayer2.getActive()) {
                topicsDao.markTopicLayer2AsInactiveInDb(Integer.parseInt(id));
                logger.info("Topic z warstwy numer" + layer_number + "oznaczony jako nieaktywny w bazie danych:" +
                        " Topic id: " + topicLayer2.getIdLayer2() +
                        " | Topic name: " + topicLayer2.getName()
                );
            } else {
                topicsDao.markTopicLayer2AsActiveInDb(Integer.parseInt(id));
                logger.info("Topic z warstwy numer" + layer_number + "oznaczony jako aktywny w bazie danych:" +
                        " Topic id: " + topicLayer2.getIdLayer2() +
                        " | Topic name: " + topicLayer2.getName()
                );
            }
            // refresh TopicLayer2 list
            List<TopicLayer2> topicsLayer2List = topicsDao.getTopicLayer2FromDbSortedByOrderId();
            req.getSession().setAttribute("topicsLayer2List", topicsLayer2List);
        }

        if (layer_number.equals("3")) {

            TopicLayer3 topicLayer3 = topicsDao.getSingleTopicLayer3(Integer.parseInt(id));

            if (topicLayer3.getActive()) {
                topicsDao.markTopicLayer3AsInactiveInDb(Integer.parseInt(id));
                logger.info("Topic z warstwy numer" + layer_number + "oznaczony jako nieaktywny w bazie danych:" +
                        " Topic id: " + topicLayer3.getIdLayer3() +
                        " | Topic name: " + topicLayer3.getName()
                );
            } else {
                topicsDao.markTopicLayer3AsActiveInDb(Integer.parseInt(id));
                logger.info("Topic z warstwy numer" + layer_number + "oznaczony jako aktywny w bazie danych:" +
                        " Topic id: " + topicLayer3.getIdLayer3() +
                        " | Topic name: " + topicLayer3.getName()
                );
            }
            // refresh TopicLayer1 list
            List<TopicLayer3> topicsLayer3List = topicsDao.getTopicLayer3FromDbSortedByOrderId();
            req.getSession().setAttribute("topicsLayer3List", topicsLayer3List);
        }

        if (layer_number.equals("4")) {

            TopicLayer4 topicLayer4 = topicsDao.getSingleTopicLayer4(Integer.parseInt(id));

            if (topicLayer4.getActive()) {
                topicsDao.markTopicLayer4AsInactiveInDb(Integer.parseInt(id));
                logger.info("Topic z warstwy numer" + layer_number + "oznaczony jako nieaktywny w bazie danych:" +
                        " Topic id: " + topicLayer4.getIdLayer4() +
                        " | Topic name: " + topicLayer4.getName()
                );
            } else {
                topicsDao.markTopicLayer4AsActiveInDb(Integer.parseInt(id));
                logger.info("Topic z warstwy numer" + layer_number + "oznaczony jako aktywny w bazie danych:" +
                        " Topic id: " + topicLayer4.getIdLayer4() +
                        " | Topic name: " + topicLayer4.getName()
                );
            }
            // refresh TopicLayer1 list
            List<TopicLayer4> topicsLayer4List = topicsDao.getTopicLayer4FromDbSortedByOrderId();
            req.getSession().setAttribute("topicsLayer4List", topicsLayer4List);
        }

        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        //resp.sendRedirect(req.getContextPath() + "/AdminMainPageServlet");
        rd.forward(req, resp);
    }

}