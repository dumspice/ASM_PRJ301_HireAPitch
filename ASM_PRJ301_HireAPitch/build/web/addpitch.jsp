<%-- 
    Document   : addpitch
    Created on : Mar 14, 2024, 12:46:57 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Pitch</title>
        <link href="asset/stylesheet/addpitch.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
        <h1>Thêm sân</h1>
        <form action="addPitch" method="get" >
            <div class="form-group">
                <label for="name">Tên sân: </label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="address">Địa chỉ: </label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="province">Khu vực: </label>
                <select id="province" name="province" required>
                    <option value="Hà Nội">Hà Nội</option>
                    <option value="Hồ Chí Minh">Hồ Chí Minh</option>
                    <option value="Đà Nẵng">Đà Nẵng</option>
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
                <label for="price">Giá sân: </label>
                <input type="number" id="price" name="price" step="0" required>
            </div>
            <div class="form-group">
                <label for="image">Ảnh:</label>
                <input type="text" id="image" name="image"/>
            </div>
            <div class="button-group">
                <input type="submit" value="Add">
                <input type="reset" value="Reset">
            </div>
        </form>
    </div>
    </body>
</html>
