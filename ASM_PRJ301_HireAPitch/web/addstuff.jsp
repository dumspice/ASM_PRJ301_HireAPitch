<%-- 
    Document   : addstuff
    Created on : Mar 13, 2024, 9:08:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Stuff</title>
        <link href="asset/stylesheet/addstuff.css" rel="stylesheet" type="text/css">
        <script>
            function changeSizeField() {
                var stuffType = document.getElementById("stuffType").value;
                var sizeField = document.getElementById("sizeField");
                var shoeSizeField = document.getElementById("shoeSizeField");
                var shirtGloveSizeField = document.getElementById("shirtGloveSizeField");

                sizeField.style.display = "none";
                shoeSizeField.style.display = "none";
                shirtGloveSizeField.style.display = "none";

                if (stuffType === "Ball") {
                    sizeField.style.display = "block";
                } else if (stuffType === "Shoes") {
                    shoeSizeField.style.display = "block";
                } else if (stuffType === "Shirt" || stuffType === "Glove") {
                    shirtGloveSizeField.style.display = "block";
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Add Stuff</h1>
            <form action="" method="POST" >
                <div class="form-group">
                    <label for="stuffId">Stuff ID:</label>
                    <input type="text" id="stuffId" name="stuffId" required>
                </div>
                <div class="form-group">
                    <label for="stuffName">Stuff Name:</label>
                    <input type="text" id="stuffName" name="stuffName" required>
                </div>
                <div class="form-group">
                    <label for="stuffType">Stuff Type:</label>
                    <select id="stuffType" name="stuffType" onchange="changeSizeField()" required>
                        <option value="">Select Stuff Type</option>
                        <option value="Ball">Ball</option>
                        <option value="Shoes">Shoes</option>
                        <option value="Shirt">Shirt</option>
                        <option value="Glove">Glove</option>
                    </select>
                </div>
                <div class="form-group" id="sizeField" style="display: none;">
                    <label for="size">Size:</label>
                    <select id="size" name="size">
                        <option value="">Select Size</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
                <div class="form-group" id="shoeSizeField" style="display: none;">
                    <label for="shoeSize">Size:</label>
                    <input type="number" id="shoeSize" name="shoeSize" min="35" max="44" required>
                </div>
                <div class="form-group" id="shirtGloveSizeField" style="display: none;">
                    <label for="shirtGloveSize">Size:</label>
                    <select id="shirtGloveSize" name="shirtGloveSize">
                        <option value="">Select Size</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="XL">XL</option>
                        <option value="XXL">XXL</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input type="number" id="amount" name="amount" required>
                </div>
                <div class="form-group">
                    <label for="image">Image:</label>
                    <input type="file" id="image" name="image" accept="image/*" required>
                </div>
                <div class="button-group">
                    <input type="submit" value="Save">
                    <input type="reset" value="Reset">
                </div>
            </form>
        </div>
    </body>
</html>
