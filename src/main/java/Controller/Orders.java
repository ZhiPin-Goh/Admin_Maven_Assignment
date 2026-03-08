package Controller;

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

@WebServlet("/ordersList")
public class Orders extends HttpServlet {
    OrderingServices orderingServices = new OrderingServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String admin = (String) session.getAttribute("admin");
        if (admin == null){
            response.sendRedirect("login.jsp");
        }
        try{
            List<OrderPreparingDTO> orderList = orderingServices.GetAllOrder();
            request.setAttribute("orderList", orderList);
            request.getRequestDispatcher("orders").forward(request,response);
        } catch (Exception ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("index").forward(request, response);
        }
    }
}
