<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vegefoods - Shop</title>
    </head>
    <body class="goto-here">
        <!--nav-->

        <!-- END nav -->

        <div class="hero-wrap hero-bread" style="background-image: url('<c:url value="/template/home/images/bg_1.jpg"/>');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span></p>
                        <h1 class="mb-0 bread">Products</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10 mb-5 text-center">
                        <ul class="product-category">
                            <li><a class="${cID == null ? "active" : ""}" href="shop"/>All</a></li>
                                <c:forEach items="${requestScope.categories}" var="cate">
                                    <li><a class="${cID == cate.getId() ? "active" : ""}" href="category?cid=${cate.getId()}"/>${cate.getName()}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${requestScope.products}" var="product" begin="${requestScope.productBegin}" end="${requestScope.productEnd}">
                        <c:set value="${product.getDiscount()}" var="discount"/>
                        <c:choose>
                            <c:when test="${discount == 0}">
                                <div class="col-md-6 col-lg-3 ftco-animate">
                                    <div class="product">
                                        <a href="details?id=${product.getId()}" class="img-prod"><img class="img-fluid" src="<c:url value="${product.getImage()}"/>" alt="Colorlib Template">
                                            <div class="overlay"></div>
                                        </a>
                                        <div class="text py-3 pb-4 px-3 text-center">
                                            <h3><a href="details?id=${product.getId()}">${product.getName()}</a></h3>
                                            <div class="d-flex">
                                                <div class="pricing">
                                                    <p class="price"><span>$${product.getPriceleft()}0</span></p>
                                                </div>
                                            </div>
                                            <div class="bottom-area d-flex px-3">
                                                <div class="m-auto d-flex">
                                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                        <span><i class="ion-ios-menu"></i></span>
                                                    </a>
                                                    <a href="addCart?id=${product.getId()}" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                        <span><i class="ion-ios-cart"></i></span>
                                                    </a>
                                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                                        <span><i class="ion-ios-heart"></i></span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>

                            <c:otherwise>
                                <div class="col-md-6 col-lg-3 ftco-animate">
                                    <div class="product">
                                        <a href="details?id=${product.getId()}" class="img-prod"><img class="img-fluid" src="<c:url value="${product.getImage()}"/>" alt="Colorlib Template">
                                            <span class="status">${product.getDiscount()}%</span>
                                            <div class="overlay"></div>
                                        </a>
                                        <div class="text py-3 pb-4 px-3 text-center">
                                            <h3><a href="details?id=${product.getId()}">${product.getName()}</a></h3>
                                            <div class="d-flex">
                                                <div class="pricing">
                                                    <p class="price"><span class="mr-2 price-dc">$${product.getPrice()}0</span><span class="price-sale">$${product.getPriceleft()}0</span></p>
                                                </div>
                                            </div>
                                            <div class="bottom-area d-flex px-3">
                                                <div class="m-auto d-flex">
                                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                        <span><i class="ion-ios-menu"></i></span>
                                                    </a>
                                                    <a href="addCart?id=${product.getId()}" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                        <span><i class="ion-ios-cart"></i></span>
                                                    </a>
                                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                                        <span><i class="ion-ios-heart"></i></span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li><a href="#">&lt;</a></li>
                                    <c:forEach begin="1" end="${requestScope.numPage}" varStatus="loop">
                                        <c:if test="${cID == null}">
                                            <li class="${(requestScope.pages == null && loop.count == 1) || requestScope.pages == loop.count ? "active" : ""}"><a href="?page=${loop.count}">${loop.count}</a></li>
                                        </c:if>
                                        <c:if test="${cID != null}">
                                            <li class="${(requestScope.pages == null && loop.count == 1) || requestScope.pages == loop.count ? "active" : ""}"><a href="?cid=${cID}&page=${loop.count}">${loop.count}</a></li>
                                        </c:if>
                                    </c:forEach>
                                <!--<li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>-->
                                <li><a href="#">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
