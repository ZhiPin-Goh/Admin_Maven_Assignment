package Controller;

import Models.IceLevels;
import Models.Sizes;
import Models.SugarLevels;
import Services.DrinkOptionServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(urlPatterns = {"/addSize", "/addIceOption", "/addSugarOption"})
public class AddDrinkOption extends HttpServlet {
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
            case "/addSize":
                try {
                    String beverageSize = request.getParameter("beveragesize");
                    BigDecimal priceModifier = new BigDecimal(request.getParameter("pricemodifier"));

                    Sizes newSize = new Sizes(0, beverageSize, priceModifier);
                    String result = drinkOptionServices.CreateSize(newSize);
                    session.setAttribute("successMessage", "Size added successfully!");
                    response.sendRedirect(targetPage);

                } catch (Exception ex) {
                    session.setAttribute("errorMessage", "Failed to add size: " + ex.getMessage());
                    response.sendRedirect(targetPage);
                }
                break;

            case "/addIceOption":
                try{
                    String iceoption = request.getParameter("iceoption");

                    IceLevels newIce = new IceLevels(0, iceoption);
                    String result = drinkOptionServices.CreateIceLevel(newIce);
                    session.setAttribute("successMessage", "Ice option added successfully!");
                    response.sendRedirect(targetPage);
                }catch (Exception ex) {
                    session.setAttribute("errorMessage", "Failed to add Ice option: " + ex.getMessage());
                    response.sendRedirect(targetPage);
                }
                break;

            case "/addSugarOption":
                try{
                    String sugaroption = request.getParameter("sugaroption");

                    SugarLevels newSugar = new SugarLevels(0, sugaroption);
                    String result = drinkOptionServices.CreateSugarLevel(newSugar);
                    session.setAttribute("successMessage", "Sugar option added successfully!");
                    response.sendRedirect(targetPage);
                }catch (Exception ex) {
                    session.setAttribute("errorMessage", "Failed to add Sugar option: " + ex.getMessage());
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
