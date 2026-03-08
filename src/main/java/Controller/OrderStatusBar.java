package Controller;

import ModelsDTO.OrderStatusPage;
import Services.OrderingServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//This is show Preparing, CompletedToday, Completed at Orders Page // this is return number
@WebServlet("orderStatusBar")
public class OrderStatusBar extends HttpServlet {
    OrderingServices orderingServices = new OrderingServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String referer = request.getHeader("Referer");
        String targetPage = (referer != null) ? referer : "index";
        HttpSession session = request.getSession();
        String admin = (String) session.getAttribute("admin");
        if (admin == null){
            response.sendRedirect("login.jsp");
        }
        try{
            OrderStatusPage orderBar = orderingServices.GetOrderStatusBar();
            request.setAttribute("orderBar", orderBar);
            request.getRequestDispatcher("orders").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("orders").forward(request, response);
        }
    }
}
