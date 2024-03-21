<%-- 
    Document   : ProductDetails
    Created on : 9 Mar 2024, 15:31:06
    Author     : dumspicy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dal.pitchDAO"%>
<%@page import="model.Pitch"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="asset/stylesheet/reset.css"/>
        <link rel="stylesheet" type="text/css" href="asset/stylesheet/ProductDetailsStyle.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title></title>
        <style>
            .product-card{
                transition: 0.25s;
            }

            .product-card:hover{
                transform: scale(1.1);
            }

            .product-items__image{
                width: 100%;
                height: 240px;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <br/>
        <%
            // Get today's date
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String today = sdf.format(cal.getTime());

            // Extract year, month, and day
            String[] dateParts = today.split("-");
            String yyyy = dateParts[0];
            String mm = dateParts[1];
            String dd = dateParts[2];
        %>
        <%
            String pitchId = request.getParameter("pitchId");
            int id = Integer.parseInt(pitchId);
            pitchDAO pDao = new pitchDAO();
            Pitch p = pDao.getPitchById(id);
        %>
        <div class="product-details">
            <!--Product info-->
            <div class="container">

                <div class="product-top row">

                    <div class="product-top--info col-lg-8">
                        <h1 class="product-top--heading"><%=p.getPitchName()%></h1>
                        <div class="product-top--address">
                            <img src="asset/icon/location-dot-solid.svg" class="product-top--address__logo"/>
                            <p class="product-top--address__info"><%=p.getAddress()%></p>
                        </div>
                        <img src="<%=p.getImage()%>" class="product-info--img"/>
                    </div>

                    <div class="product-top--details col-lg-4">
                        <div class="product-top__inner">
                            <h3 class="product-top--heading-h3">Thông tin sân</h3>
                            <div class="product-top--details__info">
                                <div class="product-details__info-items">                       
                                    <span class="left">Giờ mở cửa:</span>
                                    <span class="right">6h - 23h</span>
                                </div>
                                <div class="product-details__info-items">               
                                    <span class="left">Số sân thi đấu:</span>
                                    <span class="right">Chưa có thông tin</span>
                                </div>
                                <div class="product-details__info-items">     
                                    <span class="left">Giá thuê:</span>
                                    <span class="right"><fmt:formatNumber value="<%=p.getPrice()%>" pattern="###,###" /></span>
                                </div>                                
                                <div class="product-details__info-items">   
                                    <span class="left">Số điện thoại:</span>
                                    <span class="right">0888888888</span>
                                </div>

                            </div>
                            <div class="product-top__services">
                                <h4 class="product-top--heading-h4">Dịch vụ tiện ích</h4>
                                <div class="product-top__services--inner">

                                    <div class="product-top__services--list-items">
                                        <div class="items">      
                                            <img src="asset/icon/wifi-solid (1).svg" alt=".." class="product__services--img"> Wifi
                                        </div>
                                        <div class="items">  
                                            <img src="asset/icon/shirt-solid.svg" alt=".." class="product__services--img"> Tủ đồ
                                        </div>
                                        <div class="items">  
                                            <img src="asset/icon/mug-hot-solid.svg" alt=".." class="product__services--img"> Giải khát
                                        </div>
                                        <div class="items"> 
                                            <img src="asset/icon/car-solid.svg" alt=".." class="product__services--img"> Bãi đậu xe
                                        </div>
                                        <div class="items">   
                                            <img src="asset/icon/burger-solid.svg" alt=".." class="product__services--img"> Đồ ăn
                                        </div>
                                        <div class="items">   
                                            <img src="asset/icon/paper-plane-solid.svg" alt=".." class="product__services--img"> Tìm đối
                                        </div>
                                        <div class="items">  
                                            <img src="asset/icon/globe-solid.svg" alt=".." class="product__services--img"> Tổ chức giải
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Product action-->
            <div class="container">

                <div class="product__action row">

                    <div class="accessory col-lg-3">
                        <div class="accessory-inner pt-5 bg-white rounded-8">
                            <h4 class="accessory-heading">Thuê phụ kiện</h4>
                            <img src="https://thumbs.dreamstime.com/b/ladder-drills-goal-soccer-ball-marker-cones-sports-shoes-bottle-water-green-artificial-turf-training-equipment-140576793.jpg"
                                 alt="..."
                                 class="accessory-image mt-4"
                                 />
                            <div>
                                <button class="accessory-btn"><a href="<%=request.getContextPath()%>/stuffcontroller">Thuê phụ kiện ở đây <i class="fas fa-arrow-right"></i></a></button>
                            </div>
                        </div>
                    </div>

                    <c:if test="${sessionScope.user != null}">
                        <div class="time-table col-lg-9">
                            <div class="book-calendar h-100 bg-white pt-5 rounded-8 position-relative">
                                <div class="header-book d-flex align-items-center justify-content-between mb-4">
                                    <h3 class="calendar-title fb-bold">Đặt sân</h3>
                                </div>
                                <div class="book-calendar">
                                    <form class="book-calendar__form" action="BookingServlet" method="post">
                                        <input type="hidden" id="pitchId" name="pitchId" value="<%= pitchId %>">
                                        <input type="hidden" id="userId" name="userId" value="${sessionScope.user.getId()}">
                                        <input style="width: 17%; align-self: end;" type="date" name="datePicker" id="datePicker" min="<%= yyyy + '-' + mm + '-' + dd %>" value="<%= yyyy + '-' + mm + '-' + dd %>" required>

                                        <label for="startTime">Start Time:</label>
                                        <select id="startTimeHour" name="startTimeHour" class="book-calendar__option" required>
                                            <option value="">Hour</option>
                                            <% for (int hour = 0; hour < 24; hour++) { %>
                                            <option value="<%= String.format("%02d", hour) %>"><%= String.format("%02d", hour) %></option>
                                            <% } %>
                                        </select>
                                        <select id="startTimeMinute" name="startTimeMinute" class="book-calendar__option" required>
                                            <option value="">Minute</option>
                                            <!-- Add options for minutes, adjust as needed -->
                                            <% for (int minute = 0; minute < 60; minute += 15) { %>
                                            <option value="<%= String.format("%02d", minute) %>"><%= String.format("%02d", minute) %></option>
                                            <% } %>
                                        </select>
                                        <br>

                                        <label for="endTime">End Time:</label>
                                        <select id="endTimeHour" name="endTimeHour" class="book-calendar__option" required>
                                            <option value="">Hour</option>
                                            <% for (int hour = 0; hour < 24; hour++) { %>
                                            <option value="<%= String.format("%02d", hour) %>"><%= String.format("%02d", hour) %></option>
                                            <% } %>
                                        </select>
                                        <select id="endTimeMinute" name="endTimeMinute" class="book-calendar__option" required>
                                            <option value="">Minute</option>
                                            <% for (int minute = 0; minute < 60; minute += 15) { %>
                                            <option value="<%= String.format("%02d", minute) %>"><%= String.format("%02d", minute) %></option>
                                            <% } %>
                                        </select>
                                        <br>
                                        <button type="submit" class="btn btn-success hire-btn" style="font-size: 20px; border-radius: 10px;">Đặt sân</button>
                                    </form>
                                            <span style="color: #2a952e">${noti}</span>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
            <c:if test="${sessionScope.user == null}">
                <div style="text-align: center;">
                    <p >Đăng nhập để đặt sân.</p> </br>
                    <a href="UserLogin.jsp" class="btn btn-primary">Đăng nhập</a>
                </div>
            </c:if>
            <!--Banner image-->
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-12">
                        <div class="slider__banner-news">
                            <img src="asset/img/banner-product.png" alt=".." class="slider__image" style="display: block; margin: 20px auto; width: 100%;"/>
                        </div>
                    </div>
                </div>
            </div>

            <!--Last Pitch-->
            <div class="container">     
                <div class="row">
                    <div class="lastest-pitch__heading col-lg-3">
                        <div class="lastest-pitch__heading-inner pt-5">
                            <h3 class="title">Sân mới nhất</h3>
                        </div>
                    </div>
                </div>

                <%
                    pitchDAO pDAO = new pitchDAO();
                    ArrayList<Pitch> listlastpitch = pDAO.getLastestPitch();
                    int id1 = Integer.parseInt(request.getParameter("pitchId"));
                    Pitch p1 = pDAO.getPitchById(id1);
                %>

                <div class="row">
                    <!--Product List-->
                    <div class="product__list pt-5">
                        <div class="container">
                            <div class="product-items row justify-content-center">
                                <%
                                    for (Pitch lp : listlastpitch) {
                                %>

                                <!--Product Start-->
                                <div class="col-lg-3 col-md-6 mb-5">
                                    <div class="card h-100 product-card">
                                        <a href="<%=request.getContextPath()%>/ProductDetails.jsp?pitchId=<%=lp.getPitchId()%>">
                                            <!--Product Image-->
                                            <img class="product-items__image card-img-top" 
                                                 src="<%=lp.getImage()%>" 
                                                 alt="..."
                                                 />

                                            <!--Product Details-->
                                            <div class="card-body p4 product-card__details">
                                                <div class="text-right">
                                                    <!--Product name-->
                                                    <div class="product-card__info d-flex justify-content-between">                                                
                                                        <h6 class="mb-3 fw-bold">Tên sân:</h6>
                                                        <span class="fs-6 fw-normal"><%=lp.getPitchName()%></span>
                                                    </div>     
                                                    <!--Product Size-->
                                                    <div class="product-card__info d-flex justify-content-between">
                                                        <h6 class="mb-3 fw-bold">Kích thước sân:</h6>
                                                        <span class="fs-6 fw-normal"><%=lp.getType()%></span>
                                                    </div>
                                                    <!--Product Price-->
                                                    <div class="product-card__info d-flex justify-content-between">
                                                        <h6 class="mb-3 fw-bold">Tiền thuê:</h6>
                                                        <span class="fs-6 fw-normal"><fmt:formatNumber value="<%=lp.getPrice()%>" pattern="###,###"/></span> 
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
