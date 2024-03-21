<%-- 
    Document   : pitchInfo
    Created on : Mar 18, 2024, 7:33:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <style>

            .product-top--heading{
                font-size: 2.4rem;
                font-weight: bold;
                margin: 0 0 10px;
            }

            .product-top{
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 100px 0 15px;
            }

            .product-top--address{
                display: flex;
                gap: 15px;
                margin: 0 0 10px;
            }

            .product-info--img{
                width: 100%;
                height: 650px;
                border-radius: 10px 10px 2px 2px;
                object-fit: cover;
            }
            .product-top__inner{
                padding: 15px;
            }

            .product-top--heading-h3{
                font-size: 1.5rem;
                font-weight: bold;
                border-left: 3px solid #ffd88a;
                margin: 0 0 10px;
                padding: 0 0 0 15px;
            }

            .product-top--details__info{
                margin: 20px 0 0;
            }

            .product-details__info-items{
                display: flex;
                justify-content: space-between;
                margin: 0 0 15px;
            }

            .product-details__info-items .right{
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <br/>
        <div class="container">
            <div class="product-top row">
                <div class="product-top--info col-lg-8">
                    <h1 class="product-top--heading">${p.pitchName}</h1>
                    <div class="product-top--address">
                        <img src="asset/icon/location-dot-solid.svg" class="product-top--address__logo"/>
                        <p class="product-top--address__info">${p.address}</p>
                    </div>
                    <img src="${p.image}" class="product-info--img"/>
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
                                <span class="left">Loại sân</span>
                                <span class="right">${p.type}</span>
                            </div>
                            <div class="product-details__info-items">     
                                <span class="left">Giá thuê:</span>
                                <span class="right"><fmt:formatNumber value="${p.price}" pattern="###,###" /></span>
                            </div>                                
                            <div class="product-details__info-items">   
                                <span class="left">Khu vực:</span>
                                <span class="right">${p.region}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
