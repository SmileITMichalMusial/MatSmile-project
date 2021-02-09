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
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/StartPageContent")
public class StartPageContent extends HttpServlet {

    @Inject
    TopicsDao topicsDao;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        String id_layer_2_to_display = request.getParameter("id_layer_2_to_display");
        request.getSession().setAttribute("id_layer_2_to_display", id_layer_2_to_display);



        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    public StartPageContent() {
    }
}
