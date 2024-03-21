<%-- 
    Document   : Cart
    Created on : 13 Mar 2024, 01:52:35
    Author     : dumspicy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="asset/stylesheet/CartStyle.css"/>
        <link rel="stylesheet" type="text/css" href="asset/stylesheet/reset.css .css"/>
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

            .accessory-btn{
                border: none;
                outline: none;
                background: #fff;
                padding: 0;
            }

            .modal_main.open{
                display: flex;
            }

            .modal_main{
                position: fixed;
                top: 0;
                bottom: 0;
                right: 0;
                left: 0;
                background-color: rgba(0, 0, 0, 0.4);
                align-items: center;
                justify-content: center;
                display: none;
            }
            .modal_container{
                background-color: #fff;
                width: 900px;
                min-height: 200px;
                position: relative;
            }

            header.modal_header {
                height: 130px;
                background-color: #009688;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 30px;
                color: #fff;
                font-family: "Segoe UI",Arial,sans-serif;
                letter-spacing: 4px;
            }

            header.modal_header i{
                margin-right: 15px;
            }

            .modal_close{
                position: absolute;
                top: 0;
                right: 0;
                padding: 14px;
                color: #fff;
                font-size: 20px;
            }

            .modal_close:hover{
                background-color: #ccc;
                color: #000;
                cursor: pointer;
            }

            .modal_body{
                padding: 20px 16px;
            }

            .modal_footer{
                display: flex;
                justify-content: space-between;
                padding: 0 16px;
            }

            #modal_close_btn{
                border: none;
                outline: none;
                background-color: #f44336;
                color: #fff;
                padding: 10px 15px;
                font-size: 16px;
                font-weight: 500;
                margin: 16px 0;
            }

            #modal_close_btn:hover{
                background-color: #ccc;
                color: #000;
                cursor: pointer;
            }

            .modal_footer a{
                color: #2196f3;
            }

        </style>
    </head>
    <body>
        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <main>
            <section class="h-100 p-5" style="background-color: #ddd;">
                <div class="container h-100 p-5">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <p class="mb-3">
                                <span class="h2">Giỏ hàng của bạn</span>
                                <span class="h4">(1 item in your cart)</span>
                            </p>
                            <c:forEach begin="1" end="4">
                                <div class="card mb-4">
                                    <div class="card-body p-4">

                                        <div class="row align-items-center">
                                            <div class="col-md-2">
                                                <a href="<%=request.getContextPath()%>/ProductDetails?pitchId=21">
                                                    <img src="https://images.toplist.vn/images/800px/san-bong-da-co-nhan-tao-hoang-kim-619011.jpg"
                                                         class="img-fluid rounded" alt="Generic placeholder image">
                                                </a>
                                            </div>
                                            <div class="col-md-2 d-flex justify-content-center">
                                                <div>
                                                    <p class="small text-muted mb-4 pb-2">Tên sân</p>
                                                    <p class="lead fw-normal mb-0 line-clamp">Sân bóng ĐH TDTT Đà Nẵng</p>
                                                </div>
                                            </div>
                                            <div class="col-md-2 d-flex justify-content-center">
                                                <div>
                                                    <p class="small text-muted mb-4 pb-2">Phụ kiện</p>

                                                    <i class="fas fa-caret-down me-2" style="color: #000;"></i>
                                                    <button class="lead fw-normal mb-0 accessory-btn" data-toggle="modal" data-target="#exampleModal" onclick="OpenModal()">
                                                        Đã thuê
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-md-2 d-flex justify-content-center">
                                                <div>
                                                    <p class="small text-muted mb-4 pb-2">Quantity</p>
                                                    <p class="lead fw-normal mb-0">1</p>
                                                </div>
                                            </div>
                                            <div class="col-md-2 d-flex justify-content-center">
                                                <div>
                                                    <p class="small text-muted mb-4 pb-2">Price</p>
                                                    <p class="lead fw-normal mb-0">$799</p>
                                                </div>
                                            </div>
                                            <div class="col-md-2 d-flex justify-content-center">
                                                <div>
                                                    <p class="small text-muted mb-4 pb-2">Total</p>
                                                    <p class="lead fw-normal mb-0">$799</p>
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
                                <button type="button" class="btn btn-light btn-lg me-2"><a href="<%=request.getContextPath()%>/pitchcontroller">Quay về trang chủ</a></button>
                                <button type="button" class="btn btn-primary btn-lg">Đặt sân</button>
                            </div>

                        </div>
                    </div>
                </div>

            </section>
        </main>
        <!--Modal-->
        <div class="modal_main">
            <div class="modal_container">
                <div class="modal_close" onclick="CloseModal()">
                    <i  class="fa fa-close"></i>
                </div>

                <header class="modal_header">
                    Sản phẩm đã thuê
                </header>

                <div class="modal_body">
                    <c:forEach begin="1" end="3">
                        <div class="card mb-4">
                            <div class="card-body p-4">

                                <div class="row align-items-center">
                                    <div class="col-md-2">
                                        <a href="<%=request.getContextPath()%>/ProductDetails.jsp?pitchId=21">
                                            <img src="https://img.lazcdn.com/g/p/8a096157db09a588648bd05986ac7ed4.jpg_720x720q80.jpg"
                                                 class="img-fluid rounded" alt="Generic placeholder image">
                                        </a>
                                    </div>
                                    <div class="col-md-2 d-flex justify-content-center">
                                        <div>
                                            <p class="small text-muted mb-4 pb-2">Phụ kiện</p>
                                            <p class="lead fw-normal mb-0 line-clamp">Giày Joma</p>
                                        </div>
                                    </div>
                                    <div class="col-md-2 d-flex justify-content-center">
                                        <div>
                                            <p class="small text-muted mb-4 pb-2">Phụ kiện</p>

                                            <i class="fas fa-caret-down me-2" style="color: #000;"></i>
                                            <button class="lead fw-normal mb-0 accessory-btn" data-toggle="modal" data-target="#exampleModal" onclick="OpenModal()">
                                                Đã thuê
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-md-2 d-flex justify-content-center">
                                        <div>
                                            <p class="small text-muted mb-4 pb-2">Quantity</p>
                                            <p class="lead fw-normal mb-0">1</p>
                                        </div>
                                    </div>
                                    <div class="col-md-2 d-flex justify-content-center">
                                        <div>
                                            <p class="small text-muted mb-4 pb-2">Price</p>
                                            <p class="lead fw-normal mb-0">$799</p>
                                        </div>
                                    </div>
                                    <div class="col-md-2 d-flex justify-content-center">
                                        <div>
                                            <p class="small text-muted mb-4 pb-2">Total</p>
                                            <p class="lead fw-normal mb-0">$799</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>

                <footer class="modal_footer">
                    <button id="modal_close_btn" onclick="CloseModal()">Close <i class="ti-close"></i></button>
                    <p class="modal_help">Need <a href="">help?</a></p>
                </footer>
            </div>
        </div>
        <script>
            const checkBtn = document.querySelectorAll('.accessory-btn');
            const modal = document.querySelector('.modal_main');
            const closeBtn = document.querySelector('.modal_close');

            function OpenModal() {
                modal.classList.add('open');
            }

            function CloseModal() {
                modal.classList.remove('open');
            }


        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
