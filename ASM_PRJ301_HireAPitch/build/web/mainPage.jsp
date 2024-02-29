<%-- 
    Document   : mainPage
    Created on : 27 Feb 2024, 16:20:17
    Author     : dumspicy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./asset/stylesheet/reset.css" rel="stylesheet">
        <link href="./asset/stylesheet/mainpagestyle.css" rel="stylesheet">
        <title>JSP Page</title>
        <style>

        </style>
    </head>
    <body style="height: 10000px;">
        <header style="height: 203px;">
            <%@include file="header.jsp" %>
        </header>
        <br/>
        <main>
            <section class="banner__filter">
                <div class="container">
                    <div class="banner__filter--content">
                        <!--banner left-->
                        <div class="banner__filter--left">
                            <h3 class="banner__left--heading">Tìm sân</h3>
                            <div class="banner__filter--form">
                                <form>
                                    <label for="location">Địa điểm</label>
                                    <select name="pitch--location" class="banner__filter--location" id="location">
                                        <option value="HaNoi">Hà Nội</option>
                                        <option value="TpHCM">Tp Hồ Chí Minh</option>
                                        <option value="DaNang">Đà Nẵng</option>
                                    </select>
                                     <label for="type">Kích thước sân</label>
                                     <select name="pitch--type" class="banner__filter--type" id="type">
                                        <option value="5">Sân 5</option>
                                        <option value="7">Sân 7</option>
                                        <option value="11">Sân 11</option>
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
                <div class="triangle"></div>
            </section>
        </main>
    </body>
</html>
