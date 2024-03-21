<%-- 
    Document   : Cartt
    Created on : Mar 20, 2024, 6:32:53 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <style>
            .line-clamp {
                display: -webkit-box;
                -webkit-line-clamp: var(--line-clamp, 1);
                -webkit-box-orient: vertical;
                overflow: hidden;
            }

            .line-clamp.line_2 {
                --line-clamp: 2;
            }

            .back-btn{
                border: none;
                outline: none;
                background: #fff;
                padding: 15px 20px;
                background-color: #d9d9d9;
                border-radius: 10px;
            }

            .back-btn a{
                color: #000;
                text-decoration: none;
            }
        </style>
        <script>
            function doDelete(Booking_id, Stuff_id) {
                if (confirm("Are you sure to delete staff with id = " + Stuff_id + " and booking with id = " + Booking_id + "?")) {
                    window.location = "deleteBookingStuff?Booking_id=" + Booking_id + "&Stuff_id=" + Stuff_id;
                }
            }
        </script>
    </head>
    <body>
        <main>
            <section class="h-100 p-5" style="background-color: #f4f4f4;">
                <div class="container h-100 p-5">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <p class="mb-3">
                                <span class="h2">Giỏ hàng của bạn</span>
                            </p>
                            <c:forEach items="${bs}" var="bs">
                                <div class="card mb-4">
                                    <div class="card-body p-4">

                                        <div class="row align-items-center">
                                            <div class="col-md-2">
                                                <a href="<%=request.getContextPath()%>/ProductDetails?pitchId=21">
                                                    <img src="${bs.getStuff().image}"
                                                         class="img-fluid rounded" alt="Generic placeholder image">
                                                </a>
                                            </div>
                                            <div class="col-md-2 d-flex justify-content-center">
                                                <div>
                                                    <p class="lead text-muted mb-4 pb-2">Sản phẩm</p>
                                                    <p class="small fw-normal mb-0 line-clamp">${bs.getStuff().stuffName}</p>
                                                </div>
                                            </div>
                                            <div class="col-md-2 d-flex justify-content-center">
                                                <div>
                                                    <p class="small text-muted mb-4 pb-2">Size</p>
                                                    <p class="small fw-normal mb-0 line-clamp">${bs.getStuff().size}</p>

                                                </div>
                                            </div>
                                            <div class="col-md-2 d-flex justify-content-center">
                                                <div>
                                                    <p class="lead text-muted mb-4 pb-2">Số lượng</p>
                                                    <p class="small fw-normal mb-0">${bs.amount}</p>
                                                </div>
                                            </div>
                                            <div class="col-md-2 d-flex justify-content-center">
                                                <div>
                                                    <p class="lead text-muted mb-4 pb-2">Đơn giá</p>
                                                    <p class="small fw-normal mb-0"><fmt:formatNumber value="${bs.getStuff().price}" pattern="###,###" /></p>
                                                </div>
                                            </div>
                                            <div class="col-md-2 d-flex justify-content-center">
                                                <div>
                                                    <p class="lead text-muted mb-4 pb-2">Tổng giá</p>
                                                    <p class="small fw-normal mb-0"><fmt:formatNumber value="${bs.getStuff().price*bs.amount}" pattern="###,###" /></p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row align-items-center">
                                            <div class="col-md-12 d-flex justify-content-center">
                                                <div>
                                                    <p class="lead text-muted mb-4 pb-2">Xóa</p>
                                                    <p class="small fw-normal mb-0">
                                                        <a href="#" onclick="doDelete('${bs.booking_id}', '${bs.stuff_id}')">
                                                            <img src="asset/icon/trash-solid.svg" style="object-fit: cover; display: block; margin: 0 auto;"/>
                                                        </a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>

                            <div class="card mb-5">
                                <div class="card-body p-4">

                                    <div class="float-end">
                                        <p class="mb-0 me-5 d-flex align-items-center">
                                            <span class="small text-muted me-2">Order total:</span> <span
                                                class="lead fw-normal">$799</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <button type="button" class="back-btn me-2"><a href="<%=request.getContextPath()%>/pitchcontroller">Quay về trang chủ</a></button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </body>
</html>
