<%-- 
    Document   : userInfo
    Created on : Mar 18, 2024, 7:33:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>User info</title>
        <style>

            .user-info__logout{
                text-decoration: none;
                color: #000;
                background-color:transparent;
                padding: 10px 20px;
                border: 1px solid #f00;
                border-radius: 10px;
            }

            .user-info__logout:hover{
                background-color: #f00;
                color: #fff;
                cursor: pointer;
            }

            .user-avatar{
                width: 200px;
                height: 200px;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <div class="container p-5 user-info m-5">
            <div class="row d-flex justify-content-between">
                <div class="col-md-4 d-flex flex-column justify-content-around align-items-center user-info__left">
                    <img src="asset/img/user-image-with-black-background.png" alt="..." class="user-avatar"/>
                </div>

                <div class="col-md-6 user-info__right">
                    <h1 class="h1 fw-bold text-center mb-5 user-info__heading ">Thông tin tài khoản</h1>
                    <div class="user-info__details">
                        <div class="d-flex justify-content-between mb-4">
                            <span class="fw-bold">Họ và Tên </span>
                            <span>${u.display_name}</span>
                        </div>
                        <div class="d-flex justify-content-between mb-4">
                            <span class="fw-bold">Email:</span>
                            <span>${u.email}</span>
                        </div>
                        <div class="d-flex justify-content-between mb-4">
                            <span class="fw-bold">Số điện thoại: </span>
                            <span>${u.phone_number}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
