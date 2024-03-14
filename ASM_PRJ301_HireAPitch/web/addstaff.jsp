<%-- 
    Document   : addstaff
    Created on : Mar 13, 2024, 10:32:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Add Staff</title>
        <link href="asset/stylesheet/addstaff.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <h1>Add Staff</h1>
            <form action="" method="POST">
                <div class="form-group">
                    <label for="staffID">Staff ID:</label>
                    <input type="text" id="staffID" name="staffID" required>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="displayName">Display Name:</label>
                    <input type="text" id="displayName" name="displayName" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="tel" id="phoneNumber" name="phoneNumber" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="avatar">Avatar:</label>
                    <input type="file" id="avatar" name="avatar" accept="image/jpeg, image/png, image/gif">
                </div>
                <div class="button-group">
                    <input type="submit" value="Submit">
                    <input type="reset" value="Reset">
                </div>
            </form>
        </div>
    </body>
</html>