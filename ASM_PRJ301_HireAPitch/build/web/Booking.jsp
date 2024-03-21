<%-- 
    Document   : Booking
    Created on : Mar 18, 2024, 6:10:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:if test="${sessionScope.user.role != 'Staff'}"> Access Denied </c:if>
<c:if test="${sessionScope.user.role == 'Staff'}">

    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" type="text/css" href="asset/stylesheet/BookingStyle.css"/>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
            </style>
            <script type="text/javascript">
                function doDelete(id) {
                    if (confirm("Are you sure to reject booking request with id = " + id + "?")) {
                        window.location = "deleteBooking?id=" + id;
                    }
                }
            </script>
            <title>Danh Sách Đặt Sân</title>
        </head>
        <body>
            <header style="height: 203px;">
                <%@include file="header.jsp" %>
            </header>
            <main>
                <section class="h-100 p-5" style="background-color: #f7f4f4;">
                    <div class="container h-100 p-5">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col">
                                <p class="mb-3">
                                    <span class="h2">Danh sách thuê sân</span>
                                </p>
                                <c:forEach items="${bList}" var="booking">
                                    <div class="card mb-4">
                                        <div class="card-body p-4">

                                            <div class="row align-items-center">
                                                <div class="col-md-2">
                                                    <a href="pitchInfo?id=${booking.pitchId}">
                                                        <img src="${booking.getPitch().image}"
                                                             class="img-fluid rounded" alt="Generic placeholder image">
                                                    </a>
                                                </div>
                                                <div class="col-md-5 d-flex">
                                                    <div>
                                                        <p class="lead text-muted mb-4 pb-2"><a href="pitchInfo?id=${booking.pitchId}">${booking.getPitch().pitchName}</a></p>
                                                        <p class="small fw-bold mb-0 ">
                                                            Booking day: <span class="fw-normal">${booking.bookDay}</span> <br/><br/>
                                                            Booking time: <span class="fw-normal">${booking.timeStart}</span> - <span class="fw-normal">${booking.timeEnd}</span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 d-flex justify-content-center">
                                                    <div>
                                                        <p class="lead text-muted mb-4 pb-2">Người thuê</p>

                                                        <a href="userInfo?id=${booking.userId}">
                                                            <img src="asset/icon/Vector.svg" class="" style="object-fit: cover; display: block; margin: 0 auto;"/>
                                                        </a>
                                                    </div>
                                                </div>
                                                <c:if test="${booking.status != true}">
                                                    <div class="col-md-1 d-flex justify-content-center">
                                                        <div>
                                                            <p class="lead text-muted mb-4 pb-2">Confirm</p>
                                                            <p class="small fw-normal mb-0">
                                                                <a href="ConfirmBooking?id=${booking.bookingId}">
                                                                    <img src="asset/icon/check-solid.svg" style="object-fit: cover; display: block; margin: 0 auto;"/>
                                                                </a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-1 d-flex justify-content-center">
                                                        <div>
                                                            <p class="lead text-muted mb-4 pb-2">Xóa</p>
                                                            <p class="small fw-normal mb-0">
                                                                <a href="#!" onclick="doDelete('${booking.bookingId}')">
                                                                    <img src="asset/icon/trash-solid.svg"style="object-fit: cover; display: block; margin: 0 auto;"/>
                                                                </a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </c:if>    
                                                <c:if test="${booking.status == true}">
                                                    <div class="col-md-1 d-flex justify-content-center">
                                                        <div>
                                                            <p class="lead text-muted mb-4 pb-2">Đồ ăn</p>
                                                            <p class="small fw-normal mb-0">
                                                                <a href="<%=request.getContextPath()%>/fdscontroller">
                                                                    <img src="asset/icon/burger-solid.svg"style="object-fit: cover; display: block; margin: 0 auto;"/>
                                                                </a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-1 d-flex justify-content-center">
                                                        <div>
                                                            <p class="lead text-muted mb-4 pb-2">Bill</p>
                                                            <p class="small fw-normal mb-0">
                                                                <a href="#!">
                                                                    <img src="asset/icon/money-bill-1-regular.svg"style="object-fit: cover; display: block; margin: 0 auto;"/>
                                                                </a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-1 d-flex justify-content-center">
                                                        <div>
                                                            <p class="lead text-muted mb-4 pb-2">Xóa</p>
                                                            <p class="small fw-normal mb-0">
                                                                <a href="#!" onclick="doDelete('${booking.bookingId}')">
                                                                    <img src="asset/icon/trash-solid.svg"style="object-fit: cover; display: block; margin: 0 auto;"/>
                                                                </a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </section>
            </main>
            <%@include file="footer.jsp" %>
        </body>
    </html> 
</c:if>