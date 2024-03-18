/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name="addCustomer", urlPatterns={"/addCustomer"})
public class addCustomer extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addCustomer</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addCustomer at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String displayName = request.getParameter("displayName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String avatar = request.getParameter("avatar");

        // Create a User object with the provided data
        UserDAO uDao = new UserDAO();
        
        
        if (displayName == null || displayName.isEmpty()) {
            request.setAttribute("nameEmpty", "Vui lòng nhập họ và tên của bạn.");
        }

        if (phoneNumber == null || phoneNumber.isEmpty()) {
            request.setAttribute("phoneEmpty", "Vui lòng nhập số điện thoại của bạn.");
        }

        if (username == null || username.isEmpty()) {
            request.setAttribute("usernameEmpty", "Vui lòng nhập tên người dùng của bạn.");
        }

        if (password == null || password.isEmpty()) {
            request.setAttribute("passEmpty", "Vui lòng nhập mật khẩu.");
        }

        if (uDao.usernameExisted(username)) {
            request.setAttribute("usernameExisted", "Tên người dùng đã tồn tại. Vui lòng chọn tên khác.");
        }

        if (uDao.phoneExisted(phoneNumber)) {
            request.setAttribute("phoneExisted", "Số điện thoại đã tồn tại. Vui lòng chọn số khác.");
        }

        if (uDao.emailExisted(email)) {
            request.setAttribute("emailExisted", "Email đã tồn tại. Vui lòng chọn email khác.");
        }
        
        if (request.getAttribute("usernameExisted") == null
                && request.getAttribute("phoneExisted") == null
                && request.getAttribute("emailExisted") == null
                && request.getAttribute("passEmpty") == null
                && request.getAttribute("usernameEmpty") == null
                && request.getAttribute("phoneEmpty") == null
                && request.getAttribute("nameEmpty") == null) {
            uDao.insert(username, password, displayName, phoneNumber, email, avatar, "Customer");
            response.sendRedirect("CustomerController");
        } else {
            request.getRequestDispatcher("addcustomer.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
