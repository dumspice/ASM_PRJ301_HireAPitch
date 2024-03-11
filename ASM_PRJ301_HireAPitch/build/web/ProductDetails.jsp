<%-- 
    Document   : ProductDetails
    Created on : 9 Mar 2024, 15:31:06
    Author     : dumspicy
--%>

<%@page import="dal.pitchDAO"%>
<%@page import="model.Pitch"%>
<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="asset/stylesheet/reset.css"/>
        <link rel="stylesheet" type="text/css" href="asset/stylesheet/ProductDetailsStyle.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title></title>
    </head>
    <body>
        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <br/>
        <%
            String pitchId = request.getParameter("pitchId");
            int id = Integer.parseInt(pitchId);
            pitchDAO pDao = new pitchDAO();
            Pitch p = pDao.getPitchById(id);
        %>
        <div class="product-details">
            <div class="container">
                <!--Product info-->
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
                                    <span class="left">Giá sân:</span>
                                    <span class="right"><%=p.getPrice()%></span>
                                </div>                                
                                <div class="product-details__info-items">   
                                    <span class="left">Số điện thoại:</span>
                                    <span class="right"><%=p.getStaff().getPhoneNumber()%></span>
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
                <!--Product action-->
                <div class="product__action row">

                    <div class="accessory col-md-3 col-12">
                        <div class="accessory-inner p-15 bg-white rounded-8">
                            <h4 class="accessory-heading">Cho thuê phụ kiện</h4>
                            
                        </div>
                    </div>

                    <div class="time-table col-md-9 col-12">
                    </div>
                </div>
            </div>
            <%@include file="footer.jsp" %>
    </body>
</html>
