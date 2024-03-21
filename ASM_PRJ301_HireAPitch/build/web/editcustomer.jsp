<%-- 
    Document   : editcustomer
    Created on : Mar 13, 2024, 7:36:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Customer</title>
        <link href="asset/stylesheet/editcustomer.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <h1>Thay đổi thông tin người dùng</h1>
            <form action="editCustomer?id=${user.id}" method="POST">
                <div class="form-group">
                    <label for="username">Tên đăng nhập:</label>
                    <input type="text" id="username" name="username" value="${user.username}" required>
                    <span class="error-message">${empty requestScope.usernameExisted ? "" : requestScope.usernameExisted}</span>
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="text" id="password" name="password" value="${user.password}" required>
                </div>
                <div class="form-group">
                    <label for="displayName">Tên hiển thị</label>
                    <input type="text" id="displayName" name="displayName" value="${user.display_name}" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Số điện thoại</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phone_number}" required>
                    <span class="error-message">${empty requestScope.phoneExisted ? "" : requestScope.phoneExisted}</span>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${user.email}" required>
                    <span class="error-message">${empty requestScope.emailExisted ? "" : requestScope.emailExisted}</span>
                </div>
                <div class="form-group">
                    <label for="avatar">Avatar:</label>
                    <input type="text" id="avatar" name="avatar" value="${user.avatar}">
                </div>
                <div class="button-group">
                    <input type="submit" value="Update">
                </div>
            </form>
        </div>
    </body>
</html>
