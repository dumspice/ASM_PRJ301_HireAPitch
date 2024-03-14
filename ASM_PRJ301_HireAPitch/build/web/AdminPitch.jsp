<%-- 
    Document   : AdminPitch
    Created on : Mar 13, 2024, 11:34:18 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pitches</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="asset/stylesheet/AdminPitch.css" rel="stylesheet" type="text/css">

        <script>
            function filterPitches() {
                var selectedTypes = Array.from(document.querySelectorAll('input[name="typeFilter"]:checked')).map(checkbox => checkbox.value);
                var selectedProvinces = Array.from(document.querySelectorAll('input[name="provinceFilter"]:checked')).map(checkbox => checkbox.value);
                var table = document.getElementById("pitchTable");
                var rows = table.getElementsByTagName("tr");

                for (var i = 1; i < rows.length; i++) { // Start from index 1 to skip the header row
                    var row = rows[i];
                    var typeCell = row.cells[4].innerText;
                    var provinceCell = row.cells[5].innerText;
                    var typeMatch = selectedTypes.includes("all") || selectedTypes.includes(typeCell);
                    var provinceMatch = selectedProvinces.includes("all") || selectedProvinces.includes(provinceCell);

                    if (typeMatch && provinceMatch) {
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
                <h1>Pitch List</h1>
                <button class="addButton" onclick="location.href = 'addpitch.jsp'">Add Pitch</button>
            </div>

            <div class="filter">
                <label>Filter by Type:</label>
                <div>
                    <input type="checkbox" id="allCheckbox" name="typeFilter" value="all" onclick="filterPitches()" checked>
                    <label for="allCheckbox">All</label>
                </div>
                <div>
                    <input type="checkbox" id="san5Checkbox" name="typeFilter" value="Sân 5" onclick="filterPitches()" checked>
                    <label for="san5Checkbox">Sân 5</label>
                </div>
                <div>
                    <input type="checkbox" id="san7Checkbox" name="typeFilter" value="Sân 7" onclick="filterPitches()" checked>
                    <label for="san7Checkbox">Sân 7</label>
                </div>
                <div>
                    <input type="checkbox" id="san11Checkbox" name="typeFilter" value="Sân 11" onclick="filterPitches()" checked>
                    <label for="san11Checkbox">Sân11</label>
                </div>
            </div>

            <div class="filter">
                <label>Filter by Province:</label>
                <div>
                    <input type="checkbox" id="allProvinceCheckbox" name="provinceFilter" value="all" onclick="filterPitches()" checked>
                    <label for="allProvinceCheckbox">All</label>
                </div>
                <div>
                    <input type="checkbox" id="hanoiCheckbox" name="provinceFilter" value="Hanoi" onclick="filterPitches()" checked>
                    <label for="hanoiCheckbox">Hanoi</label>
                </div>
                <div>
                    <input type="checkbox" id="hoChiMinhCheckbox" name="provinceFilter" value="Ho Chi Minh" onclick="filterPitches()" checked>
                    <label for="hoChiMinhCheckbox">Ho Chi Minh</label>
                </div>
                <div>
                    <input type="checkbox" id="danangCheckbox" name="provinceFilter" value="Danang" onclick="filterPitches()" checked>
                    <label for="danangCheckbox">Danang</label>
                </div>
            </div>

            <table id="pitchTable" class="productTable">
                <tr>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Type</th>
                    <th>Province</th>
                    <th>Action</th>
                </tr>
                <c:forEach begin="1" end="4">
                    <tr>
                        <td>Pitch 1</td>
                        <td>123 Main Street</td>
                        <td>$10</td>
                        <td><img src="pitch1.jpg" alt="Pitch 1 Image"></td>
                        <td>Sân 5</td>
                        <td>Hanoi</td>
                        <td>
                            <a href="editPitch.jsp?id=1"><i class="fas fa-pen"></i></a> |
                            <a href="deletePitch.jsp?id=1"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
