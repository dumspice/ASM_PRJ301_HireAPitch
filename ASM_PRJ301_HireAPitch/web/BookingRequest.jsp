<%-- 
    Document   : BookingRequest
    Created on : Mar 14, 2024, 11:58:42 PM
    Author     : Admin
--%>

<%@page import="controller.BookingServlet"%>
<%@page import="java.util.Queue"%>
<%@page import="model.BookingRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Staff Dashboard</title>
        <!-- Add your CSS styles if necessary -->
    </head>
    <body>
        <h2>Booking Requests</h2>

        <%-- Iterate over the booking queue and display each booking request --%>
        <%
            Queue<BookingRequest> bookingQueue = BookingServlet.getBookingQueue();
            if (bookingQueue.isEmpty()) {
        %>
        <p>No booking requests at the moment.</p>
        <%
            } else {
                while (!bookingQueue.isEmpty()) {
                    BookingRequest bookingRequest = bookingQueue.poll();
        %>
        <div>
            <p>User ID: <%= bookingRequest.getUserId() %></p>
            <p>Pitch ID: <%= bookingRequest.getPitchId() %></p>
            <p>Selected Time Slot: <%= bookingRequest.getSelectedTimeSlot() %></p>
            <form action="confirm" method="get">
                <input type="hidden" name="userId" value="<%= bookingRequest.getUserId() %>">
                <input type="hidden" name="pitchId" value="<%= bookingRequest.getPitchId() %>">
                <input type="hidden" name="selectedTimeSlot" value="<%= bookingRequest.getSelectedTimeSlot() %>">
                <button type="submit" name="action" value="confirm">Confirm</button>
                <button type="submit" name="action" value="reject">Reject</button>
            </form>
        </div>
        <%
                }
            }
        %>
    </body>
</html>

