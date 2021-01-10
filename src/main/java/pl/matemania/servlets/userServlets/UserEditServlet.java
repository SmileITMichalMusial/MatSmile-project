package pl.matemania.servlets.userServlets;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.hibernate.usertype.UserType;
import pl.matemania.dao.UsersDao;
import pl.matemania.domain.User;
import pl.matemania.Utils.Dates;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UserEditServlet")
class UserEditServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogger(UserEditServlet.class);

    @Inject
    UsersDao usersDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        req.setAttribute("id", id);
        req.getSession().setAttribute("id", id);

        User user = usersDao.read(Integer.parseInt(id));

        req.setAttribute("user", user);
        req.getSession().setAttribute("user", user);
        req.getSession().setAttribute("user_modification_action", "modify_user");


        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        rd.forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();

        String idUser = String.valueOf(req.getSession().getAttribute("id"));

        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String type = req.getParameter("type");

        req.getSession().setAttribute("name", name);
        req.getSession().setAttribute("surname", surname);
        req.getSession().setAttribute("email", email);
        req.getSession().setAttribute("phone", phone);
        req.getSession().setAttribute("type", type);

        User user = usersDao.read(Integer.parseInt(idUser));
        user.setName(name);
        user.setSurname(surname);
        user.setEmail(email);
        user.setPhoneNumber(phone);
        user.setUserType(type);
        user.setDateModified(Dates.getCurrentDateForDbModifications());

        usersDao.modifyUserDb(user);
        logger.info("Użytkownik zaktualizowany:" +
                " Login: " + user.getLogin() +
                " | Imię: " + name +
                " | Nazwisko: " + surname +
                " | Email: " + email +
                " | Numer telefonu: " + phone

        );
        req.getSession().setAttribute("user_modification_action", null);


        // lista jest odświeżana w AdminMainPageServlet
        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        resp.sendRedirect(req.getContextPath() + "/AdminMainPageServlet");
        rd.forward(req, resp);


    }
}