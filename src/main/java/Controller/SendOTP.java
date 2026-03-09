package Controller;

import Services.UserServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/sendOTP")
public class SendOTP extends HttpServlet {
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
        try{
            String email = request.getParameter("email");
            String result = userServices.SendEmailOTP(email);
            response.sendRedirect(targetPage);
        } catch (Exception ex) {
            request.setAttribute("errorMessage", "Failed to send email: "+ ex.getMessage());
            request.getRequestDispatcher("manage-users").forward(request, response);
        }
    }
}
