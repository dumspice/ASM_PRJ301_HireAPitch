<%-- 
    Document   : header
    Created on : 27 Feb 2024, 16:04:55
    Author     : dumspicy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./asset/stylesheet/reset.css" rel="stylesheet" type="text/css">
        <link href="./asset/stylesheet/headerstyle.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <div class="header_wrapper">
      <!-- logo -->
      <div class="header_left">
          <a href="pitchcontroller" class="header_logo" rel="homepage">
          <img
            src="./asset/img/Xanh lá và Trắng Con hưu đực Bóng đá Việt Biểu trưng.png"
            alt="Logo page"
          />
        </a>
        <!-- nav bar -->
        <div class="header_navbar">

          <div class="clear"></div>
          <div class="navbar_list">
            <a href="" class="nav_items" title="Quả bóng đá">Quả bóng đá</a>
            <a href="" class="nav_items" title="Áo đấu">Áo đấu</a>
            <a href="" class="nav_items" title="Găng tay thủ môn">Găng tay thủ môn</a>
            <a href="" class="nav_items" title="Giày đá bóng">Giày đá bóng</a>
          </div>
        </div>
      </div>
      <div class="header_right">
        <div class="header_CTO">
            <c:if test="${sessionScope.user == null}">
          <div class="login">
              <a href="<%=request.getContextPath()%>/UserLogin.jsp">
              <img src="./asset/icon/Vector.svg" alt="" />
              <p class="desc">
                Đăng nhập
                <img
                  src="./asset/icon/angle-down-solid 3.svg"
                  alt=""
                  id="dropdown-btn"
                />
              </p>
            </a>
            <div class="login_sub_menu">
              <a href="<%=request.getContextPath()%>/UserRegister.jsp">Đăng ký tài khoản</a>
            </div>
          </div>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <div class="logout">
                    <a href="logout">Đăng xuất</a>
                </div>
            </c:if>
          <div class="clear"></div>
          <div class="shopping-cart">
            <a href="">
              <img src="./asset/icon/cart-arrow-down-solid 1.svg" alt="" />
              <p class="desc">Giỏ hàng</p>
            </a>
          </div>
        </div>
      </div>
    </div>
    </body>
</html>
