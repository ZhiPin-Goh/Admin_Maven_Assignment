package Controller;

import Services.BeverageServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;

@WebServlet("/addBeverage")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class AddBeverage extends HttpServlet {
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
        try{
            String name = request.getParameter("beverageName");
            String desc = request.getParameter("description");
            String category = request.getParameter("category");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            boolean hot = request.getParameter("hasHot") != null;
            boolean ice = request.getParameter("hasIce") != null;

            Part filePart = request.getPart("imageFile");
            String fileName = filePart.getSubmittedFileName();

            InputStream fileContent = filePart.getInputStream();

            String result = beverageServices.CreateBeverage(name, desc, category, price, hot, ice, fileContent, fileName);
            response.sendRedirect("manage-beverages.jsp");
        } catch (Exception ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("add-beverage").forward(request, response);
        }
    }
}
