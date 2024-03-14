<%-- 
    Document   : AdminStuff
    Created on : Mar 13, 2024, 3:15:23 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Stuff</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="asset/stylesheet/AdminStuff.css" rel="stylesheet" type="text/css">
        <script>
            function filterProducts() {
                var selectedTypes = Array.from(document.querySelectorAll('input[name="typeFilter"]:checked')).map(checkbox => checkbox.value);
                var table = document.getElementById("productTable");
                var rows = table.getElementsByTagName("tr");

                for (var i = 1; i < rows.length; i++) { // Start from index 1 to skip the header row
                    var row = rows[i];
                    var typeCell = row.cells[5].innerText.toLowerCase();
                    var typeMatch = selectedTypes.includes("all") || selectedTypes.includes(typeCell);

                    if (typeMatch) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                }
            }
        </script>
    </head>
    <body>
        <%@ include file="AdminMenu.jsp" %>
        <div class="container">
            <div class="header">
                <h1>Stuff List</h1>
                <button class="addButton" onclick="location.href = 'addstuff.jsp'">Add Stuff</button>
            </div>


            <div class="filter">
                <div>
                    <label>Filter by Type:</label>
                    <input type="checkbox" id="allCheckbox" name="typeFilter" value="all" onclick="filterProducts()" checked>
                    <label for="allCheckbox">All</label>
                </div>
                <div>
                    <input type="checkbox" id="ballCheckbox" name="typeFilter" value="ball" onclick="filterProducts()" checked>
                    <label for="ballCheckbox">Ball</label>
                </div>
                <div>
                    <input type="checkbox" id="shoesCheckbox" name="typeFilter" value="shoes" onclick="filterProducts()" checked>
                    <label for="shoesCheckbox">Shoes</label>
                </div>
                <div>
                    <input type="checkbox" id="shirtCheckbox" name="typeFilter" value="shirt" onclick="filterProducts()" checked>
                    <label for="shirtCheckbox">Shirt</label>
                </div>
                <div>
                    <input type="checkbox" id="gloveCheckbox" name="typeFilter" value="glove" onclick="filterProducts()" checked>
                    <label for="gloveCheckbox">Glove</label>
                </div>

            </div>
            </br>
            <table class="productTable" id="productTable">
                <thead>
                    <tr>
                        <th>Stuff</th>
                        <th>Size</th>
                        <th>Amount Exist</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach begin="1" end="4">
                        <tr>
                            <td>Football</td>
                            <td>5</td>
                            <td>15</td>
                            <td>19.99</td>
                            <td><img src="football.jpg" alt="Football"></td>
                            <td>Ball</td>
                            <td><a href="editstuff.jsp?id=1"><i class="fas fa-pen"></i></a> | <a href="deleteproduct.jsp?id=1"><i class="fas fa-trash"></i></a></td>
                        </tr>
                    </c:forEach>
                    <!-- Other product rows -->
                </tbody>
            </table>
        </div>

    </body>
</html>
