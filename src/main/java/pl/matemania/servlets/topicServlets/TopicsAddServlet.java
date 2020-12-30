package pl.matemania.servlets.topicServlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.matemania.Utils.Dates;
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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/TopicsAddServlet")
class TopicsAddServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogger(TopicsAddServlet.class);

    @Inject
    TopicsDao topicsDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String layer_number = req.getParameter("layer_number");
        String unique_topic_record_id = req.getParameter("unique_topic_record_id");

        req.setAttribute(layer_number, "layer_number");
        req.setAttribute("unique_topic_record_id", unique_topic_record_id);
        req.getSession().setAttribute("layer_number", layer_number);
        req.getSession().setAttribute("unique_topic_record_id", unique_topic_record_id);


        if (layer_number.equals("1")) {
            System.out.println("layer no w add to: "+ layer_number);

        //    TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(Integer.parseInt(unique_topic_record_id));
          //  req.setAttribute("topicLayer1", topicLayer1);
           // req.getSession().setAttribute("topicLayer1", topicLayer1);

            req.getSession().setAttribute("topic_modification_action", "add_topic_layer_1");

        }

        if (layer_number.equals("2")) {
            System.out.println("layer no w add to: "+ layer_number);
            // Pobierz rekord z warstwy wyżej aby go wyściwetlić na stronie by było widoczne pod jaką ścieżką dodaje się nowy
            TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(Integer.parseInt(unique_topic_record_id));
            req.getSession().setAttribute("topicLayer1",topicLayer1);

            req.getSession().setAttribute("topic_modification_action", "add_topic_layer_2");


        }

        if (layer_number.equals("3")) {

            System.out.println("layer no w add to: "+ layer_number);

            TopicLayer2 topicLayer2 = topicsDao.getSingleTopicLayer2(Integer.parseInt(unique_topic_record_id));
            TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(topicLayer2.getFkIdLayer1());
            req.getSession().setAttribute("topicLayer1",topicLayer1);
            req.getSession().setAttribute("topicLayer2",topicLayer2);
            req.getSession().setAttribute("topic_modification_action", "add_topic_layer_3");
        }

        if (layer_number.equals("4")) {
            System.out.println("layer no w add to: "+ layer_number);

            TopicLayer3 topicLayer3 = topicsDao.getSingleTopicLayer3(Integer.parseInt(unique_topic_record_id));
            TopicLayer2 topicLayer2 = topicsDao.getSingleTopicLayer2(topicLayer3.getFkIdLayer2());
            TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(topicLayer2.getFkIdLayer1());
            req.getSession().setAttribute("topicLayer1",topicLayer1);
            req.getSession().setAttribute("topicLayer2",topicLayer2);
            req.getSession().setAttribute("topicLayer3",topicLayer3);

            req.getSession().setAttribute("topic_modification_action", "add_topic_layer_4");

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


        req.getSession().setAttribute("name", name);
        req.getSession().setAttribute("order", order);
        req.getSession().setAttribute("comment", comment);
        req.getSession().setAttribute("layer_number", layer_number);
        System.out.println("layer number to: " + layer_number);

        if (layer_number.equals("1")) {

            TopicLayer1 topicLayer1 = new TopicLayer1();
            topicLayer1.setName(name);
            topicLayer1.setOrderId(Integer.parseInt(order));
            topicLayer1.setComment(comment);
            topicLayer1.setActive(false);
            topicLayer1.setDateCreated(Dates.getCurrentDateForDbModifications());

            topicsDao.saveTopicLayer1ToDb(topicLayer1);

            logger.info("Dodany rekord do warstwy 1 " +
                    " Nazwa: " + name +
                    " | Kolejnosc: " + order +
                    " | Zawartosc: " + comment

            );

            req.getSession().setAttribute("topic_modification_action", null);
            List<TopicLayer1> topicsLayer1List = topicsDao.getTopicLayer1FromDbSortedByOrderId();
            List<TopicLayer1> topicsLayer1ListActive = topicsDao.getTopicLayer1FromDbActiveSortedByOrderId();
            req.getSession().setAttribute("topicsLayer1List", topicsLayer1List);
            req.getSession().setAttribute("topicsLayer1ListActive", topicsLayer1ListActive);

        }

        if (layer_number.equals("2")) {

            TopicLayer2 topicLayer2 = new TopicLayer2();
            topicLayer2.setFkIdLayer1(Integer.parseInt(unique_topic_record_id));
            topicLayer2.setName(name);
            topicLayer2.setOrderId(Integer.parseInt(order));
            topicLayer2.setComment(comment);
            topicLayer2.setActive(false);
            topicLayer2.setDateCreated(Dates.getCurrentDateForDbModifications());

            topicsDao.saveTopicLayer2ToDb(topicLayer2);

            logger.info("Dodany rekord do warstwy 2 " +
                    " Nazwa: " + name +
                    " | Kolejnosc: " + order +
                    " | Zawartosc: " + comment

            );

            req.getSession().setAttribute("topic_modification_action", null);
            List<TopicLayer2> topicsLayer2List = topicsDao.getTopicLayer2FromDbSortedByOrderId();
            List<TopicLayer2> topicsLayer2ListActive = topicsDao.getTopicLayer2FromDbActiveSortedByOrderId();
            req.getSession().setAttribute("topicsLayer2List", topicsLayer2List);
            req.getSession().setAttribute("topicsLayer2ListActive", topicsLayer2ListActive);

        }

        if (layer_number.equals("3")) {

            TopicLayer3 topicLayer3 = new TopicLayer3();
            topicLayer3.setFkIdLayer2(Integer.parseInt(unique_topic_record_id));
            topicLayer3.setName(name);
            topicLayer3.setOrderId(Integer.parseInt(order));
            topicLayer3.setComment(comment);
            topicLayer3.setActive(false);
            topicLayer3.setDateCreated(Dates.getCurrentDateForDbModifications());

            topicsDao.saveTopicLayer3ToDb(topicLayer3);

            logger.info("Dodany rekord do warstwy 3 " +
                    " Nazwa: " + name +
                    " | Kolejnosc: " + order +
                    " | Zawartosc: " + comment

            );

            req.getSession().setAttribute("topic_modification_action", null);
            List<TopicLayer3> topicsLayer3List = topicsDao.getTopicLayer3FromDbSortedByOrderId();
            List<TopicLayer3> topicsLayer3ListActive = topicsDao.getTopicLayer3FromDbActiveSortedByOrderId();
            req.getSession().setAttribute("topicsLayer3List", topicsLayer3List);
            req.getSession().setAttribute("topicsLayer3ListActive", topicsLayer3ListActive);

        }

        if (layer_number.equals("4")) {

            TopicLayer4 topicLayer4 = new TopicLayer4();
            topicLayer4.setFkIdLayer3(Integer.parseInt(unique_topic_record_id));
            topicLayer4.setName(name);
            topicLayer4.setOrderId(Integer.parseInt(order));
            topicLayer4.setComment(comment);
            topicLayer4.setActive(false);
            topicLayer4.setDateCreated(Dates.getCurrentDateForDbModifications());

            topicsDao.saveTopicLayer4ToDb(topicLayer4);

            logger.info("Dodany rekord do warstwy 4 " +
                    " Nazwa: " + name +
                    " | Kolejnosc: " + order +
                    " | Zawartosc: " + comment

            );

            req.getSession().setAttribute("topic_modification_action", null);
            List<TopicLayer4> topicsLayer4List = topicsDao.getTopicLayer4FromDbSortedByOrderId();
            List<TopicLayer4> topicsLayer4ListActive = topicsDao.getTopicLayer4FromDbActiveSortedByOrderId();
            req.getSession().setAttribute("topicsLayer4List", topicsLayer4List);
            req.getSession().setAttribute("topicsLayer4ListActive", topicsLayer4ListActive);

        }

        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        //resp.sendRedirect(req.getContextPath() + "/AdminMainPageServlet");
        rd.forward(req, resp);


    }
}