<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title><dec:title default="Admin"/></title>
        <dec:head/>
    </head>
    <body>
        <div class="container-scroller"> 
            <!-- header -->
            <%@ include file="/common/admin/header.jsp"%>
            <!-- header -->
            <div class="container-fluid page-body-wrapper">

                <%@ include file="/common/admin/menu.jsp"%>
                <dec:body/>
                <%--<%@ include file="/common/admin/footer.jsp"%>--%>

            </div>


        </div>
        
    </body>
</html>
