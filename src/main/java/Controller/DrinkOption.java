package Controller;

import Models.IceLevels;
import Models.Sizes;
import Services.DrinkOptionServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/drinkOptions")
public class DrinkOption extends HttpServlet {
    DrinkOptionServices drinkOptionServices = new DrinkOptionServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String admin = (String) session.getAttribute("admin");
        if (admin == null){
            response.sendRedirect("login.jsp");
            return;
        }
        try{
            request.setAttribute("sizes", drinkOptionServices.GetDrinkSize());
            request.setAttribute("sugars", drinkOptionServices.GetDrinkSugar());
            request.setAttribute("ices", drinkOptionServices.GetDrinkIce());
            request.getRequestDispatcher("drink-option.jsp").forward(request, response);

        } catch (Exception ex) {
            request.setAttribute("errorMessage", "Drink option not found");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
