<%--
  Created by IntelliJ IDEA.
  User: Prashant
  Date: 12/25/2019
  Time: 7:48 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title>Car-O-Bar | Home</title>
</head>

<body>
<g:render template="/layouts/loader"/>
<g:render template="/layouts/leftPanel"/>
<div class="page-container">
    <div class="main-content">
        <g:render template="/layouts/header"/>
        <!-- page title area start -->
        <div class="page-title-area">
            <div class="row align-items-center">
                <div class="col-sm-6">
                    <div class="breadcrumbs-area clearfix">
                        <h4 class="page-title pull-left">Dashboard</h4>
                        <ul class="breadcrumbs pull-left">
                            <li><a href="index.html">Home</a></li>
                        </ul>
                    </div>
                </div>

                <g:render template="/layouts/exit" model="[username: username]"/>
            </div>
        </div>
        <!-- page title area end -->
        <g:render template="templates/inCompleteCar" model="[carList: carList]"/>
    </div>

</div>
</body>
</html>