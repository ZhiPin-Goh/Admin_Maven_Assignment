package Controller;

import Services.UserServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/activeUser", "/inactiveUser"})
public class UserStatus extends HttpServlet {
    UserServices userServices = new UserServices();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String referer = request.getHeader("Referer");
        String targetPage = (referer != null) ? referer : "index";
        HttpSession session = request.getSession();
        String admin = (String) session.getAttribute("admin");
        if (admin == null){
            response.sendRedirect("login.jsp");
        }
        String path = request.getServletPath();
        switch (path){
            case "/activeUser":
                try {
                    int id = Integer.parseInt(request.getParameter("userid"));
                    String result = userServices.ActiveUser(id);
                    session.setAttribute("successMessage", "Status activated.");
                    response.sendRedirect(targetPage);
                } catch (Exception ex) {
                    session.setAttribute("errorMessage", ex.getMessage());
                    response.sendRedirect(targetPage);
                }
                break;
            case "/inactiveUser":
                try{
                    int id = Integer.parseInt(request.getParameter("userid"));
                    String result = userServices.UnActiveUser(id);
                    session.setAttribute("successMessage", "Status deactivated.");
                    response.sendRedirect(targetPage);
                } catch (Exception ex) {
                    session.setAttribute("errorMessage", ex.getMessage());
                    response.sendRedirect(targetPage);
                }
                break;
        }
    }
}
