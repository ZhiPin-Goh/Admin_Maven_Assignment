package Controller;

import Services.BeverageServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/beverageAvailable", "/beverageUnAvailable"})
public class BeverageStatus extends HttpServlet {
    BeverageServices beverageServices = new BeverageServices();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String referer = request.getHeader("Referer");
        String targetPage = (referer != null) ? referer : "index";
        HttpSession session = request.getSession();
        String admin = (String) session.getAttribute("admin");
        if (admin == null){
            response.sendRedirect("login.jsp");
        }
        String path =request.getServletPath();
        switch (path){
            case "/beverageAvailable":
                try {
                    int id = Integer.parseInt(request.getParameter("beverageid"));
                    String result = beverageServices.BeverageAvailable(id);
                    response.sendRedirect(targetPage);
                } catch (Exception ex) {
                    request.setAttribute("errorMessage", "Failed to available: " + ex.getMessage());
                    request.getRequestDispatcher("manage-beverages").forward(request, response);
                }
                break;
            case "/beverageUnAvailable":
                try{
                    int id = Integer.parseInt(request.getParameter("beverageid"));
                    String result = beverageServices.BeverageUnAvailable(id);
                    response.sendRedirect(targetPage);
                } catch (Exception ex) {
                    request.setAttribute("errorMessage", "Failed to unavailable" + ex.getMessage());
                    request .getRequestDispatcher("manage-beverages").forward(request, response);
                }
        }
    }
}
