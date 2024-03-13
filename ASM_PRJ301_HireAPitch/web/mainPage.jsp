<%-- 
    Document   : mainPage
    Created on : 27 Feb 2024, 16:20:17
    Author     : dumspicy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./asset/stylesheet/reset.css" rel="stylesheet" type="text/css">
        <link href="./asset/stylesheet/mainpagestyle.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <style>

        </style>
    </head>
    <body>
        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <br/>
        <main>
            <section class="banner__filter">
                <div class="container" style="max-width: 1070px;">
                    <div class="banner__filter--content">
                        <!--banner left-->
                        <div class="banner__filter--left">
                            <h3 class="banner__left--heading">Tìm sân</h3>
                            <div class="banner__filter--form">
                                <form action="selectPitch" method="get" id="form-choose-pitch">
                                    <label for="location">Địa điểm</label>
                                    <c:set var="listAdd" value="${requestScope.listAdd}"/>
                                    <select name="pitch-location" class="banner__filter--location" id="location">
                                        <option value="0">Chọn địa điểm</option>
                                        <c:forEach items="${listAdd.keySet()}" var="aid">
                                            <option value="${aid}"  ${aid == requestScope.pitch-location?"selected":" "}>${listAdd[aid].addressName}</option>
                                        </c:forEach>
                                    </select>
                                    <label for="type">Kích thước sân</label>
                                    <c:set var="listPT" value="${requestScope.listPT}"/>
                                    <select name="pitch-type" class="banner__filter--type" id="type">
                                        <option value="0">Chọn kích thước sân</option>
                                        <c:forEach items="${listPT.keySet()}" var="ptid">
                                            <option value="${ptid}" ${ptid == requestScope.pitch-type?"selected":" "}>${listPT[ptid].type}</option>
                                        </c:forEach>                                   
                                    </select>

                                    <input type="submit" value="Tìm sân">
                                </form>
                            </div>
                        </div>

                        <!--banner right-->
                        <div class="banner__filter--right">
                            <h1 class="banner__right--heading">HIRE A PITCH</h1>
                            <h2 class="banner__right--sub-heading">OR FIND A GAME.</h2>
                            <div class="decor-list">
                                <img src="./asset/icon/bullseye-solid.svg" alt="decor">
                                <img src="./asset/icon/futbol-regular.svg" alt="decor">
                                <img src="./asset/icon/volleyball-solid.svg" alt="decor">
                            </div>
                        </div>
                    </div>
                </div>

            </section>
            <!--Product List-->
            <div class="product__list ">
                <div class="container">
                    <div class="product-items row justify-content-center">
                        <c:forEach items="${requestScope.ListPitch}" var="p">
                            <!--Product Start-->
                            <div class="col-lg-3 col-md-6 mb-5">
                                <div class="card h-100 product-card">
                                    <a href="<%=request.getContextPath()%>/ProductDetails.jsp?pitchId=${p.pitchId}">
                                        <!--Product Image-->
                                        <img class="product-items__image card-img-top" 
                                             src="${p.image}" 
                                             alt="..."
                                             />

                                        <!--Product Details-->
                                        <div class="card-body p4 product-card__details">
                                            <div class="text-right">
                                                <!--Product name-->
                                                <div class="product-card__info d-flex justify-content-between">                                                
                                                    <h6 class="mb-3 fw-bold">Tên sân:</h6>
                                                    <span class="fs-6 fw-normal">${p.pitchName}</span>
                                                </div>     
                                                <!--Product Size-->
                                                <div class="product-card__info d-flex justify-content-between">
                                                    <h6 class="mb-3 fw-bold">Kích thước sân:</h6>
                                                    <span class="fs-6 fw-normal">${p.pitchType.type}</span>
                                                </div>
                                                <!--Product Price-->
                                                <div class="product-card__info d-flex justify-content-between">
                                                    <h6 class="mb-3 fw-bold">Tiền thuê:</h6>
                                                    <span class="fs-6 fw-normal">${p.price}</span> 
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
