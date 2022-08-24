<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-product"/>

<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Star Admin2</title>

        <link rel="icon" href="<c:url value="/template/home/images/Logo_caheo_xanh.svg"/>" type="image/svg">


        <!-- plugins:css -->
        <link rel="stylesheet" href="<c:url value="/template/admin/vendors/feather/feather.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/admin/vendors/mdi/css/materialdesignicons.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/admin/vendors/ti-icons/css/themify-icons.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/admin/vendors/typicons/typicons.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/admin/vendors/simple-line-icons/css/simple-line-icons.css"/>">
        <link rel="stylesheet" href="<c:url value="/template/admin/vendors/css/vendor.bundle.base.css"/>">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <!--<link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">-->
        <link rel="stylesheet" href="<c:url value="/template/admin/js/select.dataTables.min.css"/>">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="<c:url value="/template/admin/css/vertical-layout-light/style.css"/>">
    </head>
    <body>
        <!-- partial:partials/_navbar.html -->
        <!--HEADER-->
        <!-- partial -->
        <!-- partial:partials/_sidebar.html -->
        <!--MENU-->
        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <h2>Add new product</h2>
                <div class="grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <form class="forms-sample" id="form-edit">
                                <div class="form-group">
                                    <label for="name">Product name<span class="text-danger">*</span></label>
                                    <input name="name" type="text" class="form-control" id="name" placeholder="Product name" value="${product.getName()}" required>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <label for="price">Price</label>
                                        <div class="input-group">
                                            <c:if test="${not empty product.getId()}">
                                                <input name="price" pattern="[0-9.]+" type="text" class="form-control" id="price" placeholder="Price" value="${product.getPrice()}" required>
                                            </c:if>
                                            <c:if test="${empty product.getId()}">
                                                <input name="price" pattern="[0-9.]+" type="text" class="form-control" id="price" placeholder="Price" required>
                                            </c:if>

                                            <div class="input-group-append">
                                                <span class="input-group-text text-dark">VND</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label for="discount">Discount</label>
                                        <div class="input-group">
                                            <c:if test="${not empty product.getId()}">
                                                <input name="discount" type="number" min="0" max="100" class="form-control" id="discount" value="${product.getDiscount()}" placeholder="Discount">
                                            </c:if>
                                            <c:if test="${empty product.getId()}">
                                                <input name="discount" type="number" min="0" max="100" class="form-control" id="discount" placeholder="Discount">
                                            </c:if>

                                            <div class="input-group-append">
                                                <span class="input-group-text text-dark">%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="image">Product images</label>
                                    <div class="image-product w-100 mb-3 d-flex" style="justify-content: center;">
                                        <c:if test="${not empty product.getId()}">
                                            <img src="${product.getImage()}" alt="Ảnh sản phẩm" width="300px" style="border: 2px solid #ccc; box-shadow: 0px 0px 7px rgb(221, 221, 221);">
                                        </c:if>
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Upload</span>
                                        </div>
                                        <div class="custom-file">
                                            <input name="image" type="file" class="custom-file-input" id="image" required>
                                            <label class="custom-file-label" for="image" id="image-text">
                                                <c:if test="${not empty product.getId()}">
                                                    <c:set value="${fn:split(product.getImage(), '/')}" var="str" />
                                                    <c:out value="${str[fn:length(str)-1]}"></c:out>
                                                </c:if>
                                                <c:if test="${empty product.getId()}">
                                                    Choose file
                                                </c:if>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <p>Categories</p>
                                    <div class="row">
                                        <div class="col-sm">
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="categoryid" id="category1" value="1" checked>
                                                    Vegetables
                                                    <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-sm">
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="categoryid" id="category2" value="2">
                                                    Fruits
                                                    <i class="input-helper"></i></label>
                                            </div>
                                        </div>

                                        <div class="col-sm">
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="categoryid" id="category3" value="3">
                                                    Juices
                                                    <i class="input-helper"></i></label>
                                            </div>
                                        </div>

                                        <div class="col-sm">
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="categoryid" id="category4" value="4">
                                                    Dried
                                                    <i class="input-helper"></i></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <textarea class="form-controls" id="description" rows="10" form="form-edit" name="description">${product.getDescription()}</textarea>
                                </div>


                                <button type="submit" class="btn btn-primary me-2" id="btn-submit-form">Submit</button>
                                <button class="btn btn-light" type="reset">Cancel</button>

                                <c:if test="${not empty product.getId()}">
                                    <input type="hidden" value="${product.getId()}" id="id" name="id" />
                                </c:if>

                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright © 2021. All rights reserved.</span>
                </div>
            </footer>
            <!-- partial -->
        </div>

        <!-- main-panel ends -->
        <!-- plugins:js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="<c:url value="/template/admin/vendors/js/vendor.bundle.base.js"/>"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="<c:url value="/template/admin/vendors/chart.js/Chart.min.js"/>"></script>
        <script src="<c:url value="/template/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"/>"></script>
        <script src="<c:url value="/template/admin/vendors/progressbar.js/progressbar.min.js"/>"></script>

        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="<c:url value="/template/admin/js/off-canvas.js"/>"></script>
        <script src="<c:url value="/template/admin/js/hoverable-collapse.js"/>"></script>
        <script src="<c:url value="/template/admin/js/template.js"/>"></script>
        <script src="<c:url value="/template/admin/js/settings.js"/>"></script>
        <script src="<c:url value="/template/admin/js/todolist.js"/>"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src="<c:url value="/template/admin/js/dashboard.js"/>"></script>
        <script src="<c:url value="/template/admin/js/Chart.roundedBarCharts.js"/>"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

        <!-- End custom js for this page-->
        <!-- jquery -->

        <script type="text/javascript">

            //            if($('.form-group input').is('[required]')){
            //                $(this).parent().children('lable').append(`<span class="text-danger">*</span>`);
            //            }

            $('#price').keyup(function (e) {
                if (e.keyCode >= 48 && e.keyCode <= 57 || e.keyCode >= 96 && e.keyCode <= 105 || (e.keyCode === 8 || e.keyCode === 46) && $('#price').val().length > 0) {
                    str = $(this).val().replace(/\./g, '');
                    $('#price').val(new Intl.NumberFormat('de-DE').format(parseInt(str)));
                } else {
                    $('#price').val('');
                }
            });
            $('#form-edit #image').change(function () {
                if ($('#form-edit #image').val() !== '') {
                    $('#form-edit .image-product').html('<img src="/template/home/images/' + $('#form-edit #image').prop("files")[0].name + '" alt="Ảnh sản phẩm" width="300px" style="border: 2px solid #ccc; box-shadow: 0px 0px 7px rgb(221, 221, 221);">');
                    $('#form-edit #image-text').html($('#form-edit #image').prop("files")[0].name);
                }
            });
        </script>

        <script>
            $('#btn-submit-form').click(function (e) {
                e.preventDefault();

                var data = {};
                var id = new URLSearchParams(window.location.search).get("pid");

                var formData = $('#form-edit').serializeArray();
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });

                data["price"] = data["price"].replace(/\./g, '');



                if (id === null) {
                    data["image"] = $('#form-edit #image').prop("files")[0].name;
                    addProduct(data);
                } else {
                    data["image"] = $('#form-edit #image-text').html().trim();
                    updateNew(data);
                }
            });

            function addProduct(data) {
                $.ajax({
                    url: '/api-admin-product',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        window.location.href = "/admin-product?type=list";
                        alert("Added successfully");
                    },
                    error: function (error) {
                        window.location.href = alert(error);
                    }
                });
            }

            function updateNew(data) {
                $.ajax({
                    url: '/api-admin-product',
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        window.location.href = "/admin-product?type=list";
                        alert("Updated successfully");
                    },
                    error: function (error) {
                        alert(error);
                    }
                });
            }
        </script>
    </body>

</html>

