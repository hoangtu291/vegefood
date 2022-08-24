<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="py-1 bg-primary">
    <div class="container">
        <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
            <div class="col-lg-12 d-block">
                <div class="row d-flex">
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                        <span class="text">0353 360 764</span>
                    </div>
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                        <span class="text">hoangtutdst@gmail.com</span>
                    </div>
                    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                        <span class="text">3-5 Business days delivery &amp; Free Returns</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="#">Vegefoods</a>
        <c:if test="${sessionScope.acc != null}">
            <span class="zmdi zmdi-account-circle nav-item" style="margin-left:20px;"></span>
            <a class="nav-item" style="margin-left:7px;" href="#">Hello ${sessionScope.user.fullName}</a>
        </c:if>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="home" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="shop" class="nav-link">Shop</a></li>
                <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
                <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                <li class="nav-item cta cta-colored"><a href="cart" class="nav-link"><span class="icon-shopping_cart"></span>[${sessionScope.itemsize}]</a></li>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item"><a href="/signin" class="nav-link">Login</a></li>
                </c:if>

                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item"><a href="logout" class="nav-link">Logout</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
