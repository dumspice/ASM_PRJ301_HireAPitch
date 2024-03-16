/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Queue;
import model.BookingRequest;

/**
 *
 * @author Admin
 */
@WebServlet(name="ConfirmBookingServlet", urlPatterns={"/confirm"})
public class ConfirmBookingServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ConfirmBookingServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmBookingServlet at " + request.getContextPath () + "</h1>");
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
        // Get the action (confirm or reject) and booking details from the request
        String action = request.getParameter("action");
        int userId = Integer.parseInt(request.getParameter("userId"));
        int pitchId = Integer.parseInt(request.getParameter("pitchId"));
        String selectedTimeSlot = request.getParameter("selectedTimeSlot");

        // Remove the booking request from the list
        Queue<BookingRequest> bookingQueue = BookingServlet.getBookingQueue();
        BookingRequest bookingToRemove = null;
        for (BookingRequest bookingRequest : bookingQueue) {
            if (bookingRequest.getUserId() == userId && bookingRequest.getPitchId() == pitchId && bookingRequest.getSelectedTimeSlot().equals(selectedTimeSlot)) {
                bookingToRemove = bookingRequest;
                break;
            }
        }
        bookingQueue.remove(bookingToRemove);

        // If the action is "confirm", update the slot button's appearance in ProductDetails.jsp
        if ("confirm".equals(action)) {
            // Construct the slot button ID based on pitchId and selectedTimeSlot
            String slotButtonId = "slotButton_" + pitchId + "_" + selectedTimeSlot.replace(" ", "_");

            // Call the JavaScript function to update the slot button's appearance
            String script = "<script>updateSlotButton('" + slotButtonId + "');</script>";
            response.getWriter().println(script);
        }

        // Redirect back to the staff dashboard
        response.sendRedirect("BookingRequest.jsp");
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
        processRequest(request, response);
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
