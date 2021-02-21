package pl.matemania.servlets.topicServlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.matemania.Utils.Dates;
import pl.matemania.dao.TopicsDao;
import pl.matemania.dao.UsersDao;
import pl.matemania.domain.User;
import pl.matemania.domain.topics.*;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/TopicsEditServlet")
class TopicsEditServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogger(TopicsEditServlet.class);

    @Inject
    TopicsDao topicsDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String unique_topic_record_id = req.getParameter("unique_topic_record_id");
        String layer_number = req.getParameter("layer_number");
        //req.setAttribute("unique_topic_record_id", unique_topic_record_id);
        //req.setAttribute(layer_number, "layer_number");
        req.getSession().setAttribute("unique_topic_record_id", unique_topic_record_id);
        req.getSession().setAttribute("layer_number", layer_number);


        if (layer_number.equals("1")) {

            TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(Integer.parseInt(unique_topic_record_id));
            System.out.println("Pobrany layer name:" + topicLayer1.getName() + "ID: " + topicLayer1.getIdLayer1());

            //req.setAttribute("topicLayer1", topicLayer1);
            req.getSession().setAttribute("topicLayer1", topicLayer1);
            req.getSession().setAttribute("topic_modification_action", "modify_topic_layer_1");

        }

        if (layer_number.equals("2")) {

            TopicLayer2 topicLayer2 = topicsDao.getSingleTopicLayer2(Integer.parseInt(unique_topic_record_id));
            System.out.println("Pobrany layer name:" + topicLayer2.getName() + "ID: " + topicLayer2.getIdLayer2());

            //req.setAttribute("topicLayer2", topicLayer2);
            req.getSession().setAttribute("topicLayer2", topicLayer2);
            req.getSession().setAttribute("topic_modification_action", "modify_topic_layer_2");

        }

        if (layer_number.equals("3")) {

            TopicLayer3 topicLayer3 = topicsDao.getSingleTopicLayer3(Integer.parseInt(unique_topic_record_id));
            System.out.println("Pobrany layer name:" + topicLayer3.getName() + "ID: " + topicLayer3.getIdLayer3());

            //req.setAttribute("topicLayer3", topicLayer3);
            req.getSession().setAttribute("topicLayer3", topicLayer3);
            req.getSession().setAttribute("topic_modification_action", "modify_topic_layer_3");

        }

        if (layer_number.equals("4")) {

            TopicLayer4 topicLayer4 = topicsDao.getSingleTopicLayer4(Integer.parseInt(unique_topic_record_id));
            System.out.println("Pobrany layer name:" + topicLayer4.getName() + "ID: " + topicLayer4.getIdLayer4());

            //req.setAttribute("topicLayer4", topicLayer4);
            req.getSession().setAttribute("topicLayer4", topicLayer4);
            req.getSession().setAttribute("topic_modification_action", "modify_topic_layer_4");

        }

        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();

        String unique_topic_record_id = String.valueOf(req.getSession().getAttribute("unique_topic_record_id"));

        String layer_number = (String) req.getSession().getAttribute("layer_number");
        String name = req.getParameter("name");
        String order = req.getParameter("order");
        String comment = req.getParameter("comment");
        String content = req.getParameter("content");


        req.getSession().setAttribute("name", name);
        req.getSession().setAttribute("order", order);
        req.getSession().setAttribute("comment", comment);
        req.getSession().setAttribute("layer_number", layer_number);
        req.getSession().setAttribute("content",content);
        System.out.println("layer number to: " + layer_number);

        if (layer_number.equals("1")) {

            TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(Integer.parseInt(unique_topic_record_id));
            topicLayer1.setName(name);
            topicLayer1.setOrderId(Integer.parseInt(order));
            topicLayer1.setComment(comment);
            topicLayer1.setDateModified(Dates.getCurrentDateForDbModifications());
            topicsDao.modifyTopicLayer1Db(topicLayer1);


            logger.info("Warstwa " +layer_number + " zaktualizowana:" +
                    " Name: " + name +
                    " | Kolejnosc: " + order +
                    " | Komentarz: " + comment

            );
            req.getSession().setAttribute("topic_modification_action", null);
            List<TopicLayer1> topicsLayer1List = topicsDao.getTopicLayer1FromDbSortedByOrderId();
            List<TopicLayer1> topicsLayer1ListActive = topicsDao.getTopicLayer1FromDbActiveSortedByOrderId();
            req.getSession().setAttribute("topicsLayer1List", topicsLayer1List);
            req.getSession().setAttribute("topicsLayer1ListActive", topicsLayer1ListActive);

        }

        if (layer_number.equals("2")) {

            TopicLayer2 topicLayer2 = topicsDao.getSingleTopicLayer2(Integer.parseInt(unique_topic_record_id));
            topicLayer2.setName(name);
            topicLayer2.setOrderId(Integer.parseInt(order));
            topicLayer2.setComment(comment);
            topicLayer2.setDateModified(Dates.getCurrentDateForDbModifications());
            topicsDao.modifyTopicLayer2Db(topicLayer2);


            logger.info("Warstwa " +layer_number + " zaktualizowana:" +
                    " Name: " + name +
                    " | Kolejnosc: " + order +
                    " | Komentarz: " + comment

            );
            req.getSession().setAttribute("topic_modification_action", null);
            List<TopicLayer2> topicsLayer2List = topicsDao.getTopicLayer2FromDbSortedByOrderId();
            List<TopicLayer2> topicsLayer2ListActive = topicsDao.getTopicLayer2FromDbActiveSortedByOrderId();
            req.getSession().setAttribute("topicsLayer2List", topicsLayer2List);
            req.getSession().setAttribute("topicsLayer2ListActive", topicsLayer2ListActive);

        }

        if (layer_number.equals("3")) {

            TopicLayer3 topicLayer3 = topicsDao.getSingleTopicLayer3(Integer.parseInt(unique_topic_record_id));
            topicLayer3.setName(name);
            topicLayer3.setOrderId(Integer.parseInt(order));
            topicLayer3.setComment(comment);
            topicLayer3.setDateModified(Dates.getCurrentDateForDbModifications());
            topicsDao.modifyTopicLayer3Db(topicLayer3);


            logger.info("Warstwa " +layer_number + " zaktualizowana:" +
                    " Name: " + name +
                    " | Kolejnosc: " + order +
                    " | Komentarz: " + comment

            );
            req.getSession().setAttribute("topic_modification_action", null);
            List<TopicLayer3> topicsLayer3List = topicsDao.getTopicLayer3FromDbSortedByOrderId();
            List<TopicLayer3> topicsLayer3ListActive = topicsDao.getTopicLayer3FromDbActiveSortedByOrderId();
            req.getSession().setAttribute("topicsLayer3List", topicsLayer3List);
            req.getSession().setAttribute("topicsLayer3ListActive", topicsLayer3ListActive);

        }

        if (layer_number.equals("4")) {

            TopicLayer4 topicLayer4 = topicsDao.getSingleTopicLayer4(Integer.parseInt(unique_topic_record_id));
            topicLayer4.setName(name);
            topicLayer4.setOrderId(Integer.parseInt(order));
            topicLayer4.setComment(comment);
            topicLayer4.setContent(content);
            topicLayer4.setDateModified(Dates.getCurrentDateForDbModifications());
            topicsDao.modifyTopicLayer4Db(topicLayer4);


            logger.info("Warstwa " +layer_number + " zaktualizowana:" +
                    " Name: " + name +
                    " | Kolejnosc: " + order +
                    " | Komentarz: " + comment +
                    " | Zawartość: " + comment

            );
            req.getSession().setAttribute("topic_modification_action", null);
            List<TopicLayer4WithoutContent> topicsLayer4ListWithoutContent = topicsDao.getTopicLayer4FromDbWithoutContentSortedByOrderId();
            List<TopicLayer4WithoutContent> topicsLayer4ListActiveWithoutContent = topicsDao.getTopicLayer4FromDbActiveWithoutContentSortedByOrderId();
            req.getSession().setAttribute("topicsLayer4ListWithoutContent", topicsLayer4ListWithoutContent);
            req.getSession().setAttribute("topicsLayer4ListActiveWithoutContent", topicsLayer4ListActiveWithoutContent);
            req.setAttribute("topicsLayer4ListWithoutContent", topicsLayer4ListWithoutContent);
            req.setAttribute("topicsLayer4ListActiveWithoutContent", topicsLayer4ListActiveWithoutContent);

        }

        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        //resp.sendRedirect(req.getContextPath() + "/AdminMainPageServlet");
        rd.forward(req, resp);


    }
}