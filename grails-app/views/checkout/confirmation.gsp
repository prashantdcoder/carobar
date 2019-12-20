<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 11/5/17
  Time: 3:26 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>CaroBar</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <link rel="stylesheet" href="/home/prashantk/project/carobar/web-app/css/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <asset:stylesheet href="mycss"/>

    <script type="text/javascript" src="https://js.stripe.com/v2/"></script>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#myPage">CarOBar</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li>  <g:link controller="home" action="redirectionPage"><span class="glyphicon glyphicon-home"></span>HOME</g:link> </li>
                <li>  <g:link controller="home" action="addCars"><span class="glyphicon glyphicon-shopping-cart"></span>SELL</g:link></li>
                <li>  <g:link controller="home" action="feedback"><span class="glyphicon glyphicon-pencil"></span>FEEDBACK</g:link></li>
                <li>  <g:link controller="home" action="userIdentification"><span class="glyphicon glyphicon-envelope"></span>MESSAGE</g:link> </li>
                <li>
                    <form name="submitForm" method="POST" action="${createLink(controller: 'logout')}">

                        <a id="logout" HREF="javascript:document.submitForm.submit()"> <span class="glyphicon glyphicon-log-out"></span>LOGOUT</a>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <h3>Confirmation</h3>
    <g:if test="${msg.equals("Your purchase was successful.")}">
        <div class="alert alert-success"> <Strong>${msg}</Strong></div>
         <g:link controller="home" action="search">Back to store</g:link>
    </g:if>
    <g:else>
        <Strong>${msg}</Strong> <g:link controller="home" action="wishlist">Back</g:link>
    </g:else>

</div>

</div>
<footer style="text-align: center;">
&copy; Prashant.kumar@jellyfishtechnologies.com
</footer>
</body>
</html>