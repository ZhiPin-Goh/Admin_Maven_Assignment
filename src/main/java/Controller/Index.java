package Controller;

import ModelsDTO.DashboardDTO;
import ModelsDTO.OrderPreparingDTO;
import Services.OrderingServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/getDashboardStatusCount", "/getOrderPreparing"})
public class Index extends HttpServlet {
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
        String path =request.getServletPath();
        switch (path){
            case "/getDashboardStatusCount":
                try{
                    DashboardDTO result = orderingServices.GetDashboardStatusCount();
                    request.setAttribute("count", result);
                    request.getRequestDispatcher("index").forward(request,response);
                }
                catch (Exception ex){
                    request.setAttribute("errorMessage", ex.getMessage());
                    request.getRequestDispatcher("index").forward(request,response);
                }
                break;
            case "/getOrderPreparing":
                try{
                    List<OrderPreparingDTO> list = orderingServices.GetOrderPreparing();
                    request.setAttribute("list", list);
                    request.getRequestDispatcher("index").forward(request, response);
                }
                catch (Exception ex){
                    request.setAttribute("errorMessage", ex.getMessage());
                    request.getRequestDispatcher("index").forward(request,response);
                }
                break;
            default:
                request.setAttribute("errorMessage", "Invalid option");
                request.getRequestDispatcher("index").forward(request,response);
                break;
        }
    }
}
