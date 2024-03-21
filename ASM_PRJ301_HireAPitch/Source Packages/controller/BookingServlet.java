/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Booking;

/**
 *
 * @author Admin
 */
@WebServlet(name="BookingServlet", urlPatterns={"/BookingServlet"})
public class BookingServlet extends HttpServlet {
   
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
            out.println("<title>Servlet BookingServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServlet at " + request.getContextPath () + "</h1>");
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
        BookingDAO bDAO = new BookingDAO();
        ArrayList<Booking> bList = bDAO.getAllBooking();
        request.setAttribute("bList", bList);
        request.getRequestDispatcher("Booking.jsp").forward(request, response);
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
        int pitchId = Integer.parseInt(request.getParameter("pitchId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String datePicker = request.getParameter("datePicker");
        String startTimeHour = request.getParameter("startTimeHour");
        String startTimeMinute = request.getParameter("startTimeMinute");
        String endTimeHour = request.getParameter("endTimeHour");
        String endTimeMinute = request.getParameter("endTimeMinute");

        String startTime = startTimeHour + ":" + startTimeMinute;
        String endTime = endTimeHour + ":" + endTimeMinute;
        
        Booking booking = new Booking(0, datePicker, startTime, endTime, userId, pitchId);

        BookingDAO bDAO = new BookingDAO();

        bDAO.insert(booking);  
        ArrayList<Booking> BList = bDAO.getBookingByUP(userId, pitchId);
        request.setAttribute("BList", BList);
        request.setAttribute("noti", "Tạo yêu cầu thành công!");
        request.getRequestDispatcher("ProductDetails.jsp").forward(request, response);
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
