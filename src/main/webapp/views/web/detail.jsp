<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${productById.getName()} - Vegefoods</title>
    </head>
    <body class="goto-here">

        <!--nav-->
        
        <!-- END nav -->

        <div class="hero-wrap hero-bread" style="background-image: url('<c:url value="/template/home/images/bg_1.jpg"/>');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="home">Home</a></span> <span class="mr-2"><a href="shop">Product</a></span> <span>Product Single</span></p>
                        <h1 class="mb-0 bread">Product Single</h1>
                    </div>
                </div>
            </div>
        </div>
            
        <c:set value="${requestScope.productById}" var="product"/>
        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-5 ftco-animate">
                        <a href="<c:url value="${product.getImage()}"/>" class="image-popup"><img src="<c:url value="${product.getImage()}"/>" class="img-fluid" alt="Colorlib Template"></a>
                    </div>
                    <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                        <h3>${product.getName()}</h3>
                        <div class="rating d-flex">
                            <p class="text-left mr-4">
                                <a href="#" class="mr-2">5.0</a>
                                <a href="#"><span class="ion-ios-star-outline"></span></a>
                                <a href="#"><span class="ion-ios-star-outline"></span></a>
                                <a href="#"><span class="ion-ios-star-outline"></span></a>
                                <a href="#"><span class="ion-ios-star-outline"></span></a>
                                <a href="#"><span class="ion-ios-star-outline"></span></a>
                            </p>
                            <p class="text-left mr-4">
                                <a href="#" class="mr-2" style="color: #000;"><span style="color: #bbb;">Category: </span>${product.getCategoryModel().getName()}</a>
                            </p>
                            <p class="text-left">
                                <a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">Sold</span></a>
                            </p>
                        </div>
                        <c:choose>
                            <c:when test="${product.getDiscount() == 0}">
                                <p class="price"><span class="price-sale">$${product.getPriceleft()}0</span></p>
                            </c:when>
                            <c:otherwise>
                                <p class="price"><span class="mr-2 price-dc" style="color: #ccc; font-size: 18px; text-decoration: line-through">$${product.getPrice()}0</span><span class="price-sale">$${product.getPriceleft()}0</span></p>
                            </c:otherwise>
                        </c:choose>
                        <p>${product.getDescription()}</p>
                        <div class="row mt-4">
                            <div class="w-100"></div>
                            <div class="input-group col-md-6 d-flex mb-3">
                                <span class="input-group-btn mr-2">
                                    <button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
                                        <i class="ion-ios-remove"></i>
                                    </button>
                                </span>
                                <input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
                                <span class="input-group-btn ml-2">
                                    <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                        <i class="ion-ios-add"></i>
                                    </button>
                                </span>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-12">
                                <p style="color: #000;">600 kg available</p>
                            </div>
                        </div>
                        <p><a href="addCart?id=${product.getId()}" class="btn btn-black py-3 px-5">Add to Cart</a></p>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-3 pb-3">
                    <div class="col-md-12 heading-section text-center ftco-animate">
                        <span class="subheading">Products</span>
                        <h2 class="mb-4">Related Products</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                    </div>
                </div>   		
            </div>
            <div class="container">
                <div class="row">
                    <c:forEach items="${requestScope.products}" var="product"  begin='0' end='3'>
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
                                                    <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
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
                                                    <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
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
            </div>
        </section>

    </body>
</html>
