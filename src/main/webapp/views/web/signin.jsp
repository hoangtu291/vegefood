<%-- 
    Document   : signin
    Created on : Jul 12, 2021, 4:17:04 PM
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
        <title>Sign In - Vegefoods</title>
        <link rel="icon" href="<c:url value="/template/home/images/Logo_caheo_xanh.svg"/>" type="image/svg">
        <!-- Font Icon -->
        <link rel="stylesheet" href="<c:url value="/template/loginSign/fonts/material-icon/css/material-design-iconic-font.min.css"/>">

        <!-- Main css -->
        <link rel="stylesheet" href="<c:url value="/template/loginSign/css/style.css"/>">
    </head>
    <body>

        <div class="main">
            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="<c:url value="/template/loginSign/images/signin-image.jpg"/>" alt="sing up image"></figure>
                            <a href="/First_Project/views/signup.jsp" class="signup-image-link">Create an account</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Sign in</h2>
                            <a class="text-warning" style="color: red;opacity: 70%;">${requestScope.message}</a>
                               <form method="post" class="register-form" id="login-form" action="/signin">
                                <div class="form-group">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="your_name" placeholder="User Name"/>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="your_pass" placeholder="Password"/>
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                    <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" id="signin" class="form-submit" value="Log in"/>
                                </div>
                                </form>
                                <!--<div class="social-login">
                                    <span class="social-label">Or login with</span>
                                    <ul class="socials">
                                        <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                        <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                        <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                    </ul>
                                </div>-->
                        </div>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
        <script src="<c:url value="/template/loginSign/vendor/jquery/jquery.min.js"/>"></script>
        <script src="<c:url value="/template/loginSign/js/main.js"/>"></script>
    </body>
</html>
