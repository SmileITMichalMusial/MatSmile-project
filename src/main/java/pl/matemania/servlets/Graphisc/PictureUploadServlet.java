package pl.matemania.servlets.Graphisc;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import pl.matemania.Utils.Dates;
import pl.matemania.Utils.UserImageNotFoundException;
import pl.matemania.dao.ImageUpload;
import pl.matemania.dao.UsersDao;
import pl.matemania.domain.User;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebServlet("/PictureUploadServlet")
@MultipartConfig
class PictureUploadServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogger(PictureUploadServlet.class);

    @Inject
    ImageUpload imageUpload;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        Path currentRelativePath = Paths.get("");
        String s = currentRelativePath.toAbsolutePath().toString();
        System.out.println("Current relative path is: " + s);



        Part filePart = req.getPart("image");
        File file;
        try {
            file = imageUpload.uploadImageFile(filePart);
           // employee.setPhotoURL(file.getName());
        } catch (UserImageNotFoundException userImageNotFound) {
            logger.fatal(userImageNotFound.getMessage());
        }

        RequestDispatcher rd = req.getRequestDispatcher("09_admin_main_page.jsp");
        //resp.sendRedirect(req.getContextPath() + "/AdminMainPageServlet");
        rd.forward(req, resp);
    }

    public PictureUploadServlet() {
    }
}