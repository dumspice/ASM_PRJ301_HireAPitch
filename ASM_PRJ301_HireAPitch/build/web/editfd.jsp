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
            <h1>Thay đổi thông tin Đồ ăn & Đồ uống</h1>
            <form action="editFDS?id=${fd.FDS_id}" method="POST" >
                <div class="form-group">
                    <label for="name">Tên:</label>
                    <input type="text" id="name" name="name" value="${fd.FDS_name}" required>
                </div>
                <div class="form-group">
                    <label for="amount">Số lượng:</label>
                    <input type="number" id="amount" name="amount" value="${fd.amount}" required>
                </div>
                <div class="form-group">
                    <label for="price">Giá:</label>
                    <input type="number" id="price" name="price" step="0.01" value="${fd.price}" required>
                </div>
                <div class="form-group">
                    <label for="type">Thể loại:</label>
                    <select id="type" name="type" required>
                        <option value="Đồ ăn" ${fd.type == 'Đồ ăn' ? 'selected' : ''} >Đồ ăn</option>
                        <option value="Đồ uống" ${fd.type == 'Đồ uống' ? 'selected' : ''}>Đồ uống</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="image">Ảnh</label>
                    <input type="text" id="image" name="image" value="${fd.image}">
                </div>
                <div class="button-group">
                    <input type="submit" value="Save">

                </div>
            </form>
        </div>
    </body>
</html>
