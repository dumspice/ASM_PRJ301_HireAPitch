<%-- 
    Document   : Booking
    Created on : Mar 18, 2024, 6:10:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:if test="${sessionScope.user.role != 'Staff'}"> Access Denied </c:if>
<c:if test="${sessionScope.user.role == 'Staff'}">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Sách Đặt Sân</title>
        
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to reject booking request with id = " + id + "?")) {
                    window.location = "deleteBooking?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Booking Day</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Customer</th>
                    <th>Pitch</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${bList}" var="booking">
                <tr>
                    <td>${booking.bookingId}</td>
                    <td>${booking.bookDay}</td>
                    <td>${booking.timeStart}</td>
                    <td>${booking.timeEnd}</td>
                    <td><a href="userInfo?id=${booking.userId}">${booking.getCustomer().display_name}</a></td>
                    <td><a href="pitchInfo?id=${booking.pitchId}">${booking.getPitch().pitchName}</a></td>
                    <c:if test="${booking.status != true}">
                    <td><a href="ConfirmBooking?id=${booking.bookingId}">Confirm</a> | <a href="#" onclick="doDelete('${booking.bookingId}')">Reject</a></td>
                    </c:if>
                    <c:if test="${booking.status == true}">
                    <td><a href="#">Đặt đồ ăn</a> | <a href="#">Hóa đơn</a> | <a href="#" onclick="doDelete('${booking.bookingId}')">Xóa</a></td>
                    </c:if>
                </tr>
            </c:forEach>
            <c:if test="${empty bList}">
                <tr>
                    <td colspan="7">No bookings found</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    </body>
</html>
</c:if>
