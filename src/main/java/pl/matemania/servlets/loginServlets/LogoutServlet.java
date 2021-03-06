package pl.matemania.servlets.loginServlets;


import pl.matemania.servlets.loginServlets.LoginServlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.LogManager;
import java.util.logging.Logger;

@WebServlet("/LogoutServlet")
class LogoutServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogManager().getLogger(String.valueOf(LoginServlet.class));

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        String login = (String) session.getAttribute("login");
        logger.info("Użytkownik: " + login + " wylogowany z sukcesem");
        session.invalidate();

        String redirect;
        redirect = "StartPage";
        RequestDispatcher rd = req.getRequestDispatcher(redirect);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String redirect;
        redirect = "/index.jsp";


        RequestDispatcher rd = req.getRequestDispatcher(redirect);
        rd.forward(req, resp);

    }
}