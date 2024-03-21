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
                if (confirm("Bạn có muốn xóa người dùng với id = " + id + " không ?")) {
                    window.location = "deleteUser?id=" + id;
                }
            }
        </script>
    </head>
    <c:if test="${sessionScope.user.role != 'Admin'}"> Access Denied </c:if>
    <c:if test="${sessionScope.user.role == 'Admin'}">
    <body>
        <%
        //get List of Customer
        
        
        %>
        <div class="container">
            <div class="header">
                <h1>Danh sách người dùng</h1>
                <a href="<%=request.getContextPath()%>/addcustomer.jsp" class="add-customer">Thêm người dùng</a>
            </div>

            <table>
                <thead>
                    <tr>

                        <th>Tên hiển thị</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                        <th>Ảnh</th>
                        <th>Chúc năng</th>

                    </tr>
                </thead>
                <%
                // vong for cho list se duoc dien o day
            
                %>
                <tbody>
                    <c:forEach items="${requestScope.cList}" var="cus">
                        <tr>
                            <td>${cus.display_name}</td> <%-- getName o day co the xem them tinh nang an vao de hien ra chi tiet nguoi dung --%>
                            <td>${cus.phone_number}</td> <%-- getPhoneNumber --%>
                            <td>${cus.email}</td> <%-- getMail --%>
                            <td><img src="${cus.avatar}" alt="Customer Image" width="100"></td> 
                            <td class="action-links">
                                <a href="editCustomer?id=${cus.id}"><i class="fas fa-pen"></i></a> | <%-- dieu den trang chinh sua --%>
                                <a href="#" onclick="doDelete('${cus.id}')"><i class="fas fa-trash"></i></a> <%-- xoa luon roi hien tren trang (onclick thi phai get id cua nguoi bi xoa) --%>
                            </td>
                        </tr>    
                    </c:forEach>

                    <!-- Add more customer rows here -->
                </tbody>
            </table>
        </div>
    </body>
    </c:if>
</html>
