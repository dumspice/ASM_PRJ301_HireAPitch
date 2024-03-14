<%-- 
    Document   : editfd
    Created on : Mar 13, 2024, 8:31:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Food Item</title>
        <link href="asset/stylesheet/editfd.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <h1>Edit Food&Drinks</h1>
            <form action="" method="POST" >
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" id="id" name="id" value="10" readonly>
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="Apple" required>
                </div>
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input type="number" id="amount" name="amount" value="10" required>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" step="0.01" value="10" required>
                </div>
                <div class="form-group">
                    <label for="type">Type:</label>
                    <select id="type" name="type" required>
                        <option value="Food" >Food</option>
                        <option value="Drink" >Drink</option>
                        <option value="Dessert" >Dessert</option>
                        <option value="Fruit" >Fruit</option>
                        <option value="Decor" >Decor</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="avatar">Avatar:</label>
                    <input type="file" id="avatar" name="avatar" value="customer_image.jpg"
                           accept="image/jpeg, image/png, image/gif" >
                    <input type="hidden" id="currentAvatar" name="currentAvatar" value="customer_image.jpg">
                </div>
                <div class="button-group">
                    <input type="submit" value="Save">

                </div>
            </form>
        </div>
    </body>
</html>
