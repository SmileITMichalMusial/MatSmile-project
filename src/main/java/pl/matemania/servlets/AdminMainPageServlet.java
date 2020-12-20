package pl.matemania.servlets;
;
import pl.matemania.dao.UsersDao;
import pl.matemania.domain.User;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/AdminMainPageServlet")


public class AdminMainPageServlet extends HttpServlet {

    @Inject
    UsersDao usersDao;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();


        request.getSession().getAttribute("listOfUsers");
        response.setContentType("text/html;charset=UTF-8");
        List<User> listOfUsers = usersDao.getUsersListFromDBSortedReversedActiveThenTypeThenId();

        // FIX_ME
        // Sortowanie do beana

        request.setAttribute("listOfUsers", listOfUsers);
        request.getSession().setAttribute("listOfUsers", listOfUsers);

        request.getSession().setAttribute("user_modification_action", null);

        RequestDispatcher rd = request.getRequestDispatcher("09_admin_main_page.jsp");
        rd.forward(request, response);

    }

    public AdminMainPageServlet() {
    }
}
