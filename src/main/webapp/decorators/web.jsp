<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><dec:title default="Vegefoods"/></title>
        <link rel="icon" href="<c:url value="/template/home/images/Logo_caheo_xanh.svg"/>" type="image/svg">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="<c:url value="/template/home/css/open-iconic-bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/home/css/animate.css"/>">

        <link rel="stylesheet" href="<c:url value="/template/home/css/owl.carousel.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/home/css/owl.theme.default.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/home/css/magnific-popup.css"/>">

        <link rel="stylesheet" href="<c:url value="/template/home/css/aos.css"/>">

        <link rel="stylesheet" href="<c:url value="/template/home/css/ionicons.min.css"/>">

        <link rel="stylesheet" href="<c:url value="/template/home/css/bootstrap-datepicker.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/home/css/jquery.timepicker.css"/>">


        <link rel="stylesheet" href="<c:url value="/template/home/css/flaticon.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/loginSign/fonts/material-icon/css/material-design-iconic-font.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/home/css/icomoon.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/home/css/style.css"/>">
    </head>
    <body class="goto-here">
        <!-- header -->
        <%@ include file="/common/web/header.jsp"%>
        <!-- header -->
        <dec:body />
        <!-- footer -->
        <%@ include file="/common/web/footer.jsp"%>
        <!-- footer -->

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        <!-- jquery -->
        <script src="<c:url value="/template/home/js/jquery.min.js"/>"></script>
        <script src="<c:url value="/template/home/js/jquery-migrate-3.0.1.min.js"/>"></script>
        <script src="<c:url value="/template/home/js/popper.min.js"/>"></script>
        <script src="<c:url value="/template/home/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/template/home/js/jquery.easing.1.3.js"/>"></script>
        <script src="<c:url value="/template/home/js/jquery.waypoints.min.js"/>"></script>
        <script src="<c:url value="/template/home/js/jquery.stellar.min.js"/>"></script>
        <script src="<c:url value="/template/home/js/owl.carousel.min.js"/>"></script>
        <script src="<c:url value="/template/home/js/jquery.magnific-popup.min.js"/>"></script>
        <script src="<c:url value="/template/home/js/aos.js"/>"></script>
        <script src="<c:url value="/template/home/js/jquery.animateNumber.min.js"/>"></script>
        <script src="<c:url value="/template/home/js/bootstrap-datepicker.js"/>"></script>
        <script src="<c:url value="/template/home/js/scrollax.min.js"/>"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="<c:url value="/template/home/js/google-map.js"/>"></script>
        <script src="<c:url value="/template/home/js/main.js"/>"></script>
        <!-- jquery -->
    </body>
</html>
