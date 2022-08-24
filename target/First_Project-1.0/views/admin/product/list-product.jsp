<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

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
                <h2>List of Products</h2>

                <div class="row flex-grow">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card card-rounded">
                            <div class="card-body">
                                <div class="d-sm-flex justify-content-between align-items-start">
                                    <div>
                                        <h4 class="card-title card-title-dash">Pending Requests</h4>
                                        <p class="card-subtitle card-subtitle-dash">You have 50+ new requests</p>
                                    </div>
                                    <div>

                                        <button type="button" class="btn btn-outline-danger btn-icon-text btn-sm" id="btn-delete">
                                            <i class="ti-trash btn-icon-prepend"></i>                                                    
                                            Delete
                                        </button>

                                        <a href="/admin-product?type=edit" class="text-decoration-none mx-3">
                                            <button type="button" class="btn btn-outline-success btn-icon-text btn-sm">
                                                <i class="ti-plus btn-icon-prepend"></i>                                                    
                                                Add Product
                                            </button>

                                        </a>
                                    </div>

                                </div>
                                <div class="table-responsive  mt-1">
                                    <table class="table select-table">
                                        <thead>
                                            <tr>
                                                <th>
                                                    Check all
                                                    <div class="form-check form-check-flat mt-0">
                                                        <label class="form-check-label">
                                                            <input type="checkbox" id="check-all" class="form-check-input" aria-checked="false">
                                                        </label>
                                                    </div>
                                                </th>
                                                <th>Product</th>
                                                <th>Prices</th>
                                                <th>Quantity</th>
                                                <th>Category</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.products}" var="product">
                                                <tr id="p${product.getId()}">
                                                    <td>
                                                        <div class="form-check form-check-flat mt-0">
                                                            <label class="form-check-label">
                                                                <input type="checkbox" class="form-check-input input-check" aria-checked="false" value="${product.getId()}">
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex ">
                                                            <img src="<c:url value="${product.getImage()}"/>" alt="">
                                                            <div>
                                                                <h6>${product.getName()}</h6>
                                                                <p>Head admin</p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <h6>${product.getPrice()} VND</h6>

                                                    </td>
                                                    <td>
                                                        <div>
                                                            <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                                                <p class="text-success">79%</p>
                                                                <p>85/162</p>
                                                            </div>
                                                            <div class="progress progress-md">
                                                                <div class="progress-bar bg-success" role="progressbar" style="width: 85%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><div class="badge badge-opacity-warning">${product.getCategoryModel().getName()}</div>
                                                    </td>
                                                    <td><a href="/admin-product?type=edit&pid=${product.getId()}"><i class="mdi mdi-pencil-box-outline" style="font-size: 20px; color: #82ae46"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
        <!-- End custom js for this page-->
        <!-- jquery -->

        <script>
            //Check All

            $("#check-all").change(function () {

                if ($('#check-all').is(':checked') == true) {
                    $('.input-check').prop('checked', true);
                } else {
                    $('.input-check').prop('checked', false);
                }
            });

            $(".input-check").click(function () {
                if ($(this).is(":checked")) {
                    var isAllChecked = 0;

                    $(".input-check").each(function () {
                        if (!this.checked)
                            isAllChecked = 1;
                    });

                    if (isAllChecked == 0) {
                        $("#check-all").prop("checked", true);
                    }
                } else {
                    $("#check-all").prop("checked", false);
                }
            });

        </script>

        <script>
            $('#btn-delete').click(function () {
                var data = {};
                var ids = $('tbody input[type=checkbox]:checked').map(function () {
                    return $(this).val();
                }).get();
                data['ids'] = ids;
                if (ids.length > 0) {
                    var message = 'Do you want to delete ' + ids.length + ' items';
                    if(ids.length <=1){
                        message= 'Do you want to delete ' + ids.length + ' item';
                    }
                    var result = confirm(message);
                    if (result) {
                        deleteNew(data, ids);
                    }
                }
                
            });

            function deleteNew(data, ids) {
                $.ajax({
                    url: '/api-admin-product',
                    type: 'DELETE',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function (result) {
                        window.location.href = "/admin-product?type=list";
                        var message = "Deleted " + data.length + "items successfully";
                        if (data.length <= 1) {
                            message = "Deleted " + data.length + "item successfully";
                        }
                        alert(message);
                    },
                    error: function (error) {
                        window.location.href = "/admin-product?type=list";
                        alert(error);
                    }
                });
            }
        </script>
    </body>

</html>

