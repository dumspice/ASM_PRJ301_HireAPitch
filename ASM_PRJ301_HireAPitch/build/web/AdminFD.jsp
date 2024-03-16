<%-- 
    Document   : AdminFD
    Created on : Mar 13, 2024, 3:14:20 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food & Drinks</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="asset/stylesheet/AdminFD.css" rel="stylesheet" type="text/css">
        <script>
            function filterProducts() {
                var selectedTypes = Array.from(document.querySelectorAll('input[name="typeFilter"]:checked')).map(checkbox => checkbox.value);
                var table = document.getElementById("productTable");
                var rows = table.getElementsByTagName("tr");

                for (var i = 1; i < rows.length; i++) { // Start from index 1 to skip the header row
                    var row = rows[i];
                    var typeCell = row.cells[4].innerText.toLowerCase();
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
    <c:if test="${sessionScope.user.roleId != 1}"> Access Denied </c:if>
    <c:if test="${sessionScope.user.roleId == 1}">
    <body>
        <%@ include file="AdminMenu.jsp" %>

        <div class="container">
            <div class="header">
                <h1>Food & Drink</h1>
                <button class="addButton" onclick="location.href = 'addfd.jsp'">Add Food&Drink</button>
            </div>

            <div class="filter">
                <label>Filter by Type:</label>
                <div>
                    <input type="checkbox" id="allCheckbox" name="typeFilter" value="all" onclick="filterProducts()" checked>
                    <label for="allCheckbox">All</label>
                </div>
                <div>
                    <input type="checkbox" id="foodCheckbox" name="typeFilter" value="đồ ăn" onclick="filterProducts()" checked>
                    <label for="foodCheckbox">Đồ ăn</label>
                </div>
                <div>
                    <input type="checkbox" id="drinkCheckbox" name="typeFilter" value="drink" onclick="filterProducts()" checked>
                    <label for="drinkCheckbox">Drink</label>
                </div>
                <div>
                    <input type="checkbox" id="dessertCheckbox" name="typeFilter" value="dessert" onclick="filterProducts()" checked>
                    <label for="dessertCheckbox">Dessert</label>
                </div>
                <div>
                    <input type="checkbox" id="fruitCheckbox" name="typeFilter" value="fruit" onclick="filterProducts()" checked>
                    <label for="fruitCheckbox">Fruit</label>
                </div>


            </div>

            </br>

            <table class="productTable" id="productTable">
                <thead>
                    <tr>

                        <th>Name</th>
                        <th>Price</th>
                        <th>Amount Exist</th>
                        <th>Image</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                        <td>Burger</td>
                        <td>5.99</td>
                        <td>10</td>
                        <td><img src="burger.jpg" alt="Burger" width="50"></td>
                        <td>Đồ ăn</td>
                        <td><a href="editfd.jsp?id=1"><i class="fas fa-pen"></i></a> | <a href="deleteproduct.jsp?id=1"><i class="fas fa-trash"></i></a></td>
                    </tr>
                    <tr>

                        <td>Soda</td>
                        <td>1.99</td>
                        <td>20</td>
                        <td><img src="soda.jpg" alt="Soda" width="50"></td>
                        <td>Drink</td>
                        <td><a href="editfd.jsp?id=2"><i class="fas fa-pen"></i></a> | <a href="deleteproduct.jsp?id=2"><i class="fas fa-trash"></i></a></td>
                    </tr>
                    <!-- Add more product rows here -->
                    <tr>
                        <td>Cake</td>
                        <td>3.99</td>
                        <td>8</td>
                        <td><img src="cake.jpg" alt="Cake" width="50"></td>
                        <td>Dessert</td>
                        <td><a href="editfd.jsp?id=3"><i class="fas fa-pen"></i></a> | <a href="deleteproduct.jsp?id=3"><i class="fas fa-trash"></i></a></td>
                    </tr>
                    <tr>

                        <td>Apple</td>
                        <td>0.99</td>
                        <td>15</td>
                        <td><img src="apple.jpg" alt="Apple" width="50"></td>
                        <td>Fruit</td>
                        <td><a href="editfd.jsp?id=4"><i class="fas fa-pen"></i></a> | <a href="deleteproduct.jsp?id=4"><i class="fas fa-trash"></i></a></td>
                    </tr>

                </tbody>
            </table>
        </div>
    </body>
    </c:if>
</html>
