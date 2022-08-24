<%-- 
    Document   : signup
    Created on : Jul 12, 2021, 4:18:29 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up - Vegefoods</title>
        <link rel="icon" href="<c:url value="/template/home/images/Logo_caheo_xanh.svg"/>" type="image/svg">
        <!-- Font Icon -->
        <link rel="stylesheet" href="<c:url value="/template/loginSign/fonts/material-icon/css/material-design-iconic-font.min.css"/>">

        <!-- Main css -->
        <link rel="stylesheet" href="<c:url value="/template/loginSign/css/style.css"/>">
    </head>
    <body>

        <div class="main">
            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>
                            <a class="text-warning" style="color: red;opacity: 70%;">${requestScope.message}</a>
                            <form method="POST" class="register-form" id="register-form" action="/signup">
                                <div class="form-group">
                                    <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="name" placeholder="User Name"/>
                                </div>
                                <div class="form-group">
                                    <label for="fullname"><i class="zmdi zmdi-email"></i></label>
                                    <input type="text" name="fullname" id="email" placeholder="Full Name"/>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="pass" id="pass" placeholder="Password"/>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                                </div>
                                <div class="form-group">
                                    <label for="address"><i class="zmdi zmdi-home"></i></label>
                                    <input type="text" name="address" id="re_pass" placeholder="Address"/>
                                </div>
                                <div class="form-group">
                                    <label for="phone"><i class="zmdi zmdi-phone"></i></label>
                                    <input type="text" name="phone" id="re_pass" placeholder="Phone Number"/>
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" id="signup" class="form-submit" value="Register"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="<c:url value="/template/loginSign/images/signup-image.jpg"/>" alt="sing up image"></figure>
                            <a href="/First_Project/views/signin.jsp" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- JS -->
        <script src="<c:url value="/template/loginSign/vendor/jquery/jquery.min.js"/>"></script>
        <script src="<c:url value="/template/loginSign/js/main.js"/>"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
