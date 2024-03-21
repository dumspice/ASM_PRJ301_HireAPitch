<%-- 
    Document   : Cartt
    Created on : Mar 20, 2024, 6:32:53 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function doDelete(Booking_id, Stuff_id) {
                if (confirm("Are you sure to delete staff with id = " + Stuff_id + " and booking with id = " + Booking_id + "?")) {
                window.location = "deleteBookingStuff?Booking_id=" + Booking_id + "&Stuff_id=" + Stuff_id;
                }
            }
        </script>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th></th>
                    <th>Tên sản phẩm</th>
                    <th>Size</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Tổng giá</th>
                    <th></th>
                </tr>
            </thead>
            <c:forEach items="${bs}" var="bs">
            <tbody>
                <tr>
                    <td rowspan="3"><img src="${bs.getStuff().image}" alt="Stuff Image" style="max-width: 100px; max-height: 100px;"/></td>
                    <td>${bs.getStuff().stuffName}</td>
                    <td>${bs.getStuff().size}</td>
                    <td>${bs.amount}</td>
                    <td><fmt:formatNumber value="${bs.getStuff().price}" pattern="###,###" /></td>
                    <td><fmt:formatNumber value="${bs.getStuff().price*bs.amount}" pattern="###,###" /></td>
                    <td><a href="#" onclick="doDelete('${bs.booking_id}', '${bs.stuff_id}')">Xóa</td>
                </tr>
            </tbody>
            </c:forEach>
        </table>
        <button onclick="goBack()">Back</button>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>

    </body>
</html>
