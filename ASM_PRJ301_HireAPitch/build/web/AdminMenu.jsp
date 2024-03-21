<%-- 
    Document   : AdminHome
    Created on : Mar 13, 2024, 9:30:03 AM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Menu</title>
        <link href="asset/stylesheet/AdminMenu.css" rel="stylesheet" type="text/css">
    </head>
    <c:if test="${sessionScope.user.role != 'Admin'}"> Access Denied </c:if>
    <c:if test="${sessionScope.user.role == 'Admin'}">
    <body>
        <ul class="menu">
            <li><a href="AdminHome.jsp">Home</a></li>
            <li><a href="CustomerController">Khách hàng</a></li>
            <li><a href="StaffController">Nhân viên</a></li>
            <li><a href="FDSAdmin">Đồ ăn & đồ uống</a></li>
            <li><a href="stuffAdmin">Thuê đồ</a></li>
            <li><a href="PitchAdmin">Sân</a></li>
            <li class="logout-button"><a href="logout">Đăng xuất</a></li> <!-- Added logout button with separate class -->
        </ul>
    </body>
    </c:if>
</html>
