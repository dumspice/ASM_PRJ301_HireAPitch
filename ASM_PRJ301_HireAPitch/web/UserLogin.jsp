<%-- 
    Document   : UserLogin
    Created on : 28 Feb 2024, 22:13:52
    Author     : dumspicy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="asset/stylesheet/UserLoginStyle.css" rel="stylesheet">
        <link href="asset/stylesheet/reset.css" rel="stylesheet">
        <title>UserLogin</title>
    </head>
    <body>
        <div class="wrapper">
      <form action="" class="form__login--user">
        <div class="login__heading">
          <h1>Đăng nhập</h1>
        </div>
        <div class="login">
          <label for="user">Số điện thoại</label>
          <input type="text" name="phoneNum" id="user" required />
          <br />
          <label for="pass">Mật khẩu</label>
          <input type="password" name="password" id="pass" required />
        </div>
          <a href="<%=request.getContextPath()%>/UserRegister.jsp" id="UserRegister">Đăng ký</a>
        <a href="" id="ForgottenPass">Quên mật khẩu</a>
        <br />
        <input type="submit" value="Đăng nhập" id="form__user--btn" />
      </form>
    </div>
    </body>
</html>
