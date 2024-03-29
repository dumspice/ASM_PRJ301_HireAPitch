<%-- 
    Document   : AdminStaff
    Created on : Mar 13, 2024, 11:29:51 AM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách nhân viên</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="asset/stylesheet/AdminStaff.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete staff with id = " + id + "?")) {
                    window.location = "deleteUser?id=" + id;
                }
            }
        </script>
    </head>
    <c:if test="${sessionScope.user.role != 'Admin'}"> Access Denied </c:if>
    <c:if test="${sessionScope.user.role == 'Admin'}">
    <body>
        <%@ include file="AdminMenu.jsp" %>
        <%
      //get List of Customer
        
        
        %>
        <div class="container">
            <div class="header">
                <h1>Danh sách nhân viên</h1>
                <a href="<%=request.getContextPath()%>/addstaff.jsp" class="add-staff">Thêm nhân viên</a>
            </div>

            <table>
                <thead>
                    <tr>

                        <th>Tên hiển thị</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                        <th>Ảnh</th>
                        <th>Chức năng</th>

                    </tr>
                </thead>
                <%
                // vong for cho list se duoc dien o day
            
                %>
                <tbody>
                    <c:forEach items="${requestScope.sList}" var="s">
                        <tr>
                            <td>${s.display_name}</td> <%-- getName o day co the xem them tinh nang an vao de hien ra chi tiet nguoi dung --%>
                            <td>${s.phone_number}</td> <%-- getPhoneNumber --%>
                            <td>${s.email}</td> <%-- getMail --%>
                            <td><img src="${s.avatar}" alt="Customer Image" width="100"></td> 
                            <td class="action-links">
                                <a href="editStaff?id=${s.id}"><i class="fas fa-pen"></i></a> | <%-- dieu den trang chinh sua --%>
                                <a href="#" onclick="doDelete('${s.id}')"><i class="fas fa-trash"></i></a> <%-- xoa luon roi hien tren trang (onclick thi phai get id cua nguoi bi xoa) --%>
                            </td>
                        </tr>    
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
    </c:if>
</html>
