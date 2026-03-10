package Controller;

import Services.DrinkOptionServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/deleteSize", "/deleteIceOption", "/deleteSugarOption"})
public class DeleteDrinkOption extends HttpServlet {
    DrinkOptionServices drinkOptionServices = new DrinkOptionServices();

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
            case "/deleteSize":
                try{
                    int id = Integer.parseInt(request.getParameter("sizeid"));
                    String result = drinkOptionServices.DeleteSize(id);
                    response.sendRedirect(targetPage);
                }catch (Exception ex){
                    session.setAttribute("errorMessage", "Failed to delete Size: " +ex.getMessage());
                    response.sendRedirect(targetPage);
                }
                break;
            case "/deleteIceOption":
                try{
                    int id = Integer.parseInt(request.getParameter("iceoptionid"));
                    String result = drinkOptionServices.DeleteIceLevel(id);
                    response.sendRedirect(targetPage);
                }catch (Exception ex) {
                    session.setAttribute("errorMessage", "Failed to delete ice option: " + ex.getMessage());
                    response.sendRedirect(targetPage);
                }
                break;
            case "/deleteSugarOption":
                try{
                    int id = Integer.parseInt(request.getParameter("sugaroptionid"));
                    String result = drinkOptionServices.DeleteSugarLevel(id);
                    response.sendRedirect(targetPage);
                } catch (Exception ex) {
                    session.setAttribute("errorMessage", "Failed to delete sugar option: " + ex.getMessage());
                    response.sendRedirect(targetPage);
                }
                break;
            default:
                session.setAttribute("errorMessage", "Failed option");
                response.sendRedirect(targetPage);
                break;
        }
    }
}
