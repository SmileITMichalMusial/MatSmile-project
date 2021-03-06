package pl.matemania.servlets.userServlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.matemania.dao.UsersDao;
import pl.matemania.domain.User;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserDeleteServlet")
class UserDeleteServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogger(UserDeleteServlet.class);

    @Inject
    UsersDao usersDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");

        User user = usersDao.read(Integer.parseInt(id));

        if (user.getActive()) {
            usersDao.markUserAsInactiveInDb(Integer.parseInt(id));
            logger.info("Użytkownik oznaczony jako nieaktywny w bazie danych:" +
                    " Login: " + user.getLogin() +
                    " | Imię: " + user.getName() +
                    " | Nazwisko: " + user.getSurname() +
                    " | Email: " + user.getEmail() +
                    " | Numee telefonu: " + user.getPhoneNumber() +
                    " | Typ: " + user.getUserType()
            );
        } else {
            usersDao.markUserAsActiveInDb(Integer.parseInt(id));
            logger.info("Użytkownik oznaczony jako aktywny w bazie danych:" +
                    " Login: " + user.getLogin() +
                    " | Imię: " + user.getName() +
                    " | Nazwisko: " + user.getSurname() +
                    " | Email: " + user.getEmail() +
                    " | Numee telefonu: " + user.getPhoneNumber() +
                    " | Typ: " + user.getUserType()
            );
        }

        // lista jest odświeżana w AdminMainPageServlet
        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        resp.sendRedirect(req.getContextPath() + "/AdminMainPageServlet");
        rd.forward(req, resp);
    }

}