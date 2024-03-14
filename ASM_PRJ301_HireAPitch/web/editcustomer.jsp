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
            <h1>Edit Customer</h1>
            <form action="" method="POST" >
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" id="id" name="id" value="123" readonly>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="JohnDoe" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" id="password" name="password" value="10112004" required>
                </div>
                <div class="form-group">
                    <label for="displayName">Display Name:</label>
                    <input type="text" id="displayName" name="displayName" value="John Doe" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="tel" id="phoneNumber" name="phoneNumber" value="123-456-7890" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="johndoe@example.com" required>
                </div>
                <div class="form-group">
                    <label for="avatar">Avatar:</label>
                    <input type="file" id="avatar" name="avatar" value="customer_image.jpg"
                           accept="image/jpeg, image/png, image/gif" >
                    <input type="hidden" id="currentAvatar" name="currentAvatar" value="customer_image.jpg">
                </div>
                <div class="button-group">
                    <input type="submit" value="Update">

                </div>
            </form>
        </div>
    </body>
</html>
