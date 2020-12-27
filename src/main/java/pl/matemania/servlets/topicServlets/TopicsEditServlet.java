package pl.matemania.servlets.topicServlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.matemania.Utils.Dates;
import pl.matemania.dao.TopicsDao;
import pl.matemania.dao.UsersDao;
import pl.matemania.domain.User;
import pl.matemania.domain.topics.TopicLayer1;

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
        String id = req.getParameter("id");
        String layer_id = req.getParameter("layer_id");
        req.setAttribute("id", id);
        req.setAttribute(layer_id, "layer_id");
        req.getSession().setAttribute("id", id);
        req.getSession().setAttribute("layer_id", layer_id);


        TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(Integer.parseInt(id));
        System.out.println("Pobrany layer name:" + topicLayer1.getName() + "ID: " + topicLayer1.getIdLayer1());

        req.setAttribute("topicLayer1", topicLayer1);
        req.getSession().setAttribute("topicLayer1", topicLayer1);
        req.getSession().setAttribute("topic_modification_action", "modify_topic");


        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        rd.forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();

        String idLayer = String.valueOf(req.getSession().getAttribute("id"));

        String name = req.getParameter("name");
        String order = req.getParameter("order");
        String comment = req.getParameter("comment");


        req.getSession().setAttribute("name", name);
        req.getSession().setAttribute("order", order);
        req.getSession().setAttribute("comment", comment);

        TopicLayer1 topicLayer1 = topicsDao.getSingleTopicLayer1(Integer.parseInt(idLayer));
        topicLayer1.setName(name);
        topicLayer1.setOrderId(Integer.parseInt(order));
        topicLayer1.setComment(comment);
        topicLayer1.setDateModified(Dates.getCurrentDateForDbModifications());
        topicsDao.modifyTopicLayer1Db(topicLayer1);


        logger.info("Warstwa X zaktualizowana:" +
                " Name: " + name +
                " | Kolejnosc: " + order +
                " | Zawartosc: " + comment

        );
        req.getSession().setAttribute("topic_modification_action", null);
        List<TopicLayer1> topicsLayer1List = topicsDao.getTopicLayer1FromDbSortedByOrderId();
        req.getSession().setAttribute("topicsLayer1List", topicsLayer1List);

        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        resp.sendRedirect(req.getContextPath() + "/AdminMainPageServlet");
        rd.forward(req, resp);


    }
}