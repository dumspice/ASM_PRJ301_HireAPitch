<%-- 
    Document   : editPitch
    Created on : Mar 14, 2024, 12:48:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Pitch</title>
        <link href="asset/stylesheet/editPitch.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <h1>Edit Pitch</h1>
            <form action="saveeditedpitch.jsp" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" id="id" name="id" value="10" readonly>
                </div>
                <div class="form-group">
                    <label for="name">Pitch Name:</label>
                    <input type="text" id="name" name="name" value="Pitch Name" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="Address" required>
                </div>
                <div class="form-group">
                    <label for="province">Province:</label>
                    <select id="province" name="province" required>
                        <option value="Hanoi">Hanoi</option>
                        <option value="Ho Chi Minh">Ho Chi Minh</option>
                        <option value="Danang">Danang</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="type">Type:</label>
                    <select id="type" name="type" required>
                        <option value="Sân 5">Sân 5</option>
                        <option value="Sân 7">Sân 7</option>
                        <option value="Sân 11">Sân 11</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" step="0.01" value="100" required>
                </div>
                <div class="form-group">
                    <label for="image">Image:</label>
                    <input type="file" id="image" name="image" accept="image/*">
                </div>
                <div class="button-group">
                    <input type="submit" value="Save">
                </div>
            </form>
        </div>
    </body>
</html>
