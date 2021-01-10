package pl.matemania.servlets.userServlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.matemania.Utils.Dates;
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

@WebServlet("/UserAddServletUser")
class UserAddServletUser extends HttpServlet {

    private static final Logger logger = LogManager.getLogger(UserAddServletUser.class);

    @Inject
    UsersDao usersDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String login = req.getParameter("login");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        String type = "user";

        if (usersDao.isUniqueLogin(login)) {
            logger.info("Użytkownik: " + login + " istnieje w bazie danych. Nie można stworzyć użytkownika z tym samym loginem");
            logger.info("Przekierowanie do strony głównej");
            req.setAttribute("errorTitle", "Nie można utworzyć konta");
            req.setAttribute("errorDecscription", "Taki login już istnieje. Wybierz inny.");
            req.setAttribute("infoText","Powrót");
            req.setAttribute("link","/jsp/01_admin_pages/21_4_user_add_user.jsp");
            RequestDispatcher rd = req.getRequestDispatcher("999_error.jsp");
            rd.forward(req, resp);
            return;
        }



        User user = new User();
        user.setLogin(login);
        user.setName(name);
        user.setSurname(surname);
        user.setEmail(email);
        user.setUserType(type);
        user.setPassword(password);
        user.setActive(true);
        user.setDateCreated(Dates.getCurrentDateForDbModifications());

        usersDao.saveUserToDb(user);
        logger.info("Użytkownik dodany do bazy danych:" +
                " | Login " + login +
                " | Imię " + name +
                " | Nazwisko " + surname +
                " | Email " + email  +""
        );

        req.setAttribute("errorTitle", "Gratulacje");
        req.setAttribute("errorDecscription", "Użytkownik założony");
        req.setAttribute("link", "08_login.jsp");
        req.setAttribute("infoText", "Powrót na stronę logowania");

        RequestDispatcher rd = req.getRequestDispatcher("999_error.jsp");
        rd.forward(req, resp);

    }
}