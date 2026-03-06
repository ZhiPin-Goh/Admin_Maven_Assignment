package Controller;

import Services.OrderingServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/markAsReady", "/markAsComplete"})
public class OrderStatus extends HttpServlet {
    OrderingServices orderingServices = new OrderingServices();

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
            case "markAsReady":
                try{
                    int orderID = Integer.parseInt(request.getParameter("orderID"));
                    String result = orderingServices.MarkAsReady(orderID);
                    response.sendRedirect(targetPage);
                }catch (Exception ex){
                    request.setAttribute("errorMessage", ex.getMessage());
                    request.getRequestDispatcher("index").forward(request, response);
                }
                break;
            case "markAsComplete":
                try{
                    int orderID = Integer.parseInt(request.getParameter("orderID"));
                    String result = orderingServices.OrderingComplete(orderID);
                    response.sendRedirect(targetPage);
                }catch (Exception ex){
                    request.setAttribute("errorMessage", ex.getMessage());
                    request.getRequestDispatcher("index").forward(request, response);
                }
                break;
            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }
}
