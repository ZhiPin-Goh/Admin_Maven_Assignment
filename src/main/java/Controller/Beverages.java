package Controller;

import Models.Beverage;
import Services.BeverageServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/beverages")
public class Beverages extends HttpServlet {
    BeverageServices beverageServices = new BeverageServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String admin = (String) session.getAttribute("admin");
        if (admin == null){
            response.sendRedirect("login.jsp");
        }
        try{
            List<Beverage> beverages = beverageServices.getAllBeverage();
            request.setAttribute("beverages",beverages);
            request.getRequestDispatcher("manage-beverage").forward(request,response);
        } catch (Exception ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("index").forward(request,response);
        }
    }
}
