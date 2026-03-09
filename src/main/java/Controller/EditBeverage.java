package Controller;

import ModelsDTO.EditBeverageDTO;
import Services.BeverageServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/editBeverage")
public class EditBeverage extends HttpServlet {
    BeverageServices beverageServices = new BeverageServices();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String admin = (String) session.getAttribute("admin");
        if (admin == null){
            response.sendRedirect("login.jsp");
        }
        try{
            int id = Integer.parseInt(request.getParameter("beverageid"));
            String name = request.getParameter("beveragename");
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            boolean iceoption = new Boolean(request.getParameter("iceoption"));
            boolean hotoption = new Boolean(request.getParameter("hotoption"));
            EditBeverageDTO beverage = new EditBeverageDTO(id, name, description,category,price,iceoption,hotoption);
            String result = beverageServices.UpdateBeverage(beverage);
            response.sendRedirect("manage-beverage.jsp");
        } catch (Exception ex) {
            request.setAttribute("errorMessage", "Failed to edit: "+ex.getMessage());
            request.getRequestDispatcher("manage-beverage").forward(request, response);
        }
    }
}
