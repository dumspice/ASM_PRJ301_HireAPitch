<%-- 
    Document   : AdminCustomer
    Created on : Mar 13, 2024, 10:52:21 AM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="AdminMenu.jsp" %> <br/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Customer</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="asset/stylesheet/AdminCustomer.css" rel="stylesheet" type="text/css">
        
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete category with id = " + id + "?")) {
                    window.location = "deleteCategory?id=" + id;
                }
            }
        </script>
    </head>

    <body>
        <%
        //get List of Customer
        
        
        %>
        <div class="container">
            <div class="header">
                <h1>Customer List</h1>
                <a href="<%=request.getContextPath()%>/addcustomer.jsp" class="add-customer">Add Customer</a>
            </div>

            <table>
                <thead>
                    <tr>

                        <th>Display Name</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Image</th>
                        <th>Action</th>

                    </tr>
                </thead>
                <%
                // vong for cho list se duoc dien o day
            
                %>
                <tbody>
                    <c:forEach begin="1" end="4">
                        <tr>
                            <td>John Doe</td> <%-- getName o day co the xem them tinh nang an vao de hien ra chi tiet nguoi dung --%>
                            <td>123456789</td> <%-- getPhoneNumber --%>
                            <td>johndoe@example.com</td> <%-- getMail --%>
                            <td><img src="customer_image.jpg" alt="Customer Image" width="100"></td> 
                            <td class="action-links">
                                <a href="editstaff.jsp?id=1"><i class="fas fa-pen"></i></a> | <%-- dieu den trang chinh sua --%>
                                <a href="#" onclick="doDelete('<%=1%>')"><i class="fas fa-trash"></i></a> <%-- xoa luon roi hien tren trang (onclick thi phai get id cua nguoi bi xoa) --%>
                            </td>
                        </tr>    
                    </c:forEach>

                    <!-- Add more customer rows here -->
                </tbody>
            </table>
        </div>
    </body>
</html>
