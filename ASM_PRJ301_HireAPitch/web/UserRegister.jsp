<%-- 
    Document   : UserRegister
    Created on : 28 Feb 2024, 22:16:34
    Author     : dumspicy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="asset/stylesheet/UserRegisterStyle.css" rel="stylesheet" type="text/css">
        <link href="asset/stylesheet/reset.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <form action="" class="form__register--user">
                <div class="register__heading">
                    <h1>Đăng ký tài khoản</h1>
                </div>
                <div class="register">
                    <label for="name">Họ và Tên(<span>*</span>)</label>
                    <input type="text" name="name" id="name" />
                    <br />
                    <label for="phone">Số điện thoại(<span>*</span>)</label>
                    <input type="text" name="phone" id="phone" />
                    <br />
                    <label for="phone">Username(<span>*</span>)</label>
                    <input type="text" name="username" id="username" />
                    <br />
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" />

                    <div class="section__password">
                        <div class="pass">
                            <label for="password">Mật khẩu(<span>*</span>)</label>
                            <input type="password" name="pass" id="password" />
                        </div>

                        <div class="re_pass">
                            <label for="confirm-pass">Xác nhận mật khẩu(<span>*</span>)</label>
                            <input type="password" name="confirm--pass" id="confirm-pass" />
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="CTA-action">
                        <p>Đã có tài khoản, <a href="<%=request.getContextPath()%>/UserLogin.jsp">đăng nhập</a></p>
                        <input type="submit" value="Đăng ký" class="form__register--btn" id="submit_btn"/>
                    </div>
                </div>
            </form>
        </div>
        <script>
            function validatePass() {
                var pass = document.getElementById("password");
                var re_pass = document.getElementById("confirm-pass");
                var submitBtn = document.getElementById("submit_btn");
                if (pass.value !== re_pass.value) {
                    submitBtn.disabled = true;
                    re_pass.style.border = "1px solid red";
                } else {
                    submitBtn.disabled = false;
                    re_pass.style.border = "1px solid green";
                }
            }
        </script>
    </body>
</html>
