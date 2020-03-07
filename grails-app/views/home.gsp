<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 7/2/17
  Time: 1:10 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>CarOBar</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>

        .header{
            background-color: white;
            height: 60px;
            width: 100%;
            background-color: white;
            position: fixed;

        }

        .navbar-inverse{
            background-color: white;
            position: fixed;
            margin-top: 60px;
            width: 100%;
            outline: 0px solid white;
            border: 0px solid white;
            box-shadow:0px 1px 2px 0px #2aabd2;

        }

        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 1366px;
           height: 768px;
           margin-top: 115px;
            margin-left: 0px;
        }







        body {
            font: 400 15px/1.8 Lato, sans-serif;
            color: #777;
        }
        h3, h4 {
            margin: 10px 0 30px 0;
            letter-spacing: 10px;
            font-size: 20px;
            color: #111;
        }
        .container {
            padding: 80px 120px;
        }
        .person {
            border: 10px solid transparent;
            margin-bottom: 25px;
            width: 80%;
            height: 80%;
            opacity: 0.7;
        }
        .person:hover {
            border-color: #f1f1f1;
        }
        .carousel-inner img {
           /* -webkit-filter: grayscale(90%);
            filter: grayscale(90%);*/ /* make all photos black and white */
            width: 100%; /* Set width to 100% */
            margin: auto;
        }
        .carousel-caption h3 {
            color: #fff !important;
        }
        @media (max-width: 600px) {
            .carousel-caption {
                display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
            }
        }
        .bg-1 {
            background: #2d2d30;
            color: #bdbdbd;
        }
        .bg-1 h3 {color: #fff;}
        .bg-1 p {font-style: italic;}
        .list-group-item:first-child {
            border-top-right-radius: 0;
            border-top-left-radius: 0;
        }
        .list-group-item:last-child {
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .thumbnail {
            padding: 0 0 15px 0;
            border: none;
            border-radius: 0;
        }
        .thumbnail p {
            margin-top: 15px;
            color: #555;
        }
        .btn {
            padding: 10px 20px;
            background-color: #333;
            color: #f1f1f1;
            border-radius: 0;
            transition: .2s;
        }
        .btn:hover, .btn:focus {
            border: 1px solid #333;
            background-color: #fff;
            color: #000;
        }
        .modal-header, h4, .close {
            background-color: #333;
            color: #fff !important;
            text-align: center;
            font-size: 30px;
        }
        .modal-header, .modal-body {
            padding: 40px 50px;
        }
        .nav-tabs li a {
            color: #777;
        }
        #googleMap {
            width: 100%;
            height: 400px;
            -webkit-filter: grayscale(100%);
            filter: grayscale(100%);
        }
        .navbar {
            font-family: Montserrat, sans-serif;
            margin-bottom: 0;
            background-color: #2d2d30;
            border: 0;
            font-size: 11px !important;
            letter-spacing: 4px;
            opacity: 1;
        }
        .navbar li a, .navbar .navbar-brand {
            color: #d5d5d5;
        }
        .navbar-nav li a:hover {
            color: #fff !important;
        }
        .navbar-nav li.active a {
            color: #fff !important;
            background-color: #29292c !important;
        }
        .navbar-default .navbar-toggle {
            border-color: transparent;
        }
        .open .dropdown-toggle {
            color: #fff;
            background-color: #555 !important;
        }
        .dropdown-menu li a {
            color: #000 !important;
        }
        .dropdown-menu li a:hover {
            background-color: red !important;
        }
        footer {
            background-color: #2d2d30;
            color: #f5f5f5;
            padding: 32px;
        }
        footer a {
            color: #f5f5f5;
        }
        footer a:hover {
            color: #777;
            text-decoration: none;
        }
        .form-control {
            border-radius: 0;
        }
        textarea {
            resize: none;
        }
        .sshow{
            margin-top:-60px;
        }
        .roc{
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            margin: 280px 140px 175px 140px;
            padding : 30px;
            width: 300px;
            height: 200px;
            background-color: white;
            visibility: visible;
            border: 0px solid black;
            border-radius: 4px 4px 4px 4px;
            box-shadow: 2px 2px 4px 2px rgba(1, 1, 1, 0.67);
            z-index: 1;

        }
        #login{
            color: white;
            padding: 15px;
            text-align: center;
        }
        #login a{
            color: white;
            font-weight: bold;
            font-size: large;
        }
        #login:hover{
            cursor: pointer;
        }
        #reg{
            color: white;
            padding: 15px;
            text-align: center;
        }
        #reg a{
            color: white;
            font-weight: bold;
            font-size: large;
        }

        footer{
            margin-top: 50px;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
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
                <li><a href="#myPage"><span class="glyphicon glyphicon-home"></span>HOME</a></li>
                <li><a href="login/auth.gsp">BUY</a></li>
                <li><a href="login/auth.gsp">SELL</a></li>

            </ul>
        </div>
    </div>
</nav>
<div class="sshow">

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators" >
        <li data-target="#myCarousel" data-slide-to="0" class="active" ></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="images/car1.jpg" alt="car1">
        </div>
        <div class="item">
            <img src="images/car2.jpg" alt="car2">
        </div>
        <div class="item">
            <img src="images/car3.jpeg" alt="car3">
        </div>
        <div class="item">
            <img src="images/car4.jpeg" alt="car4">
        </div>
    </div>

    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
</div>
<div class="roc">
    <div id="login" class="navbar">
        <g:link controller="user" action="login">Login</g:link>
    </div><br>
    <div id="reg" class="navbar">
        <g:link controller="user" action="register">Registration</g:link>
    </div>
</div>
<footer>
    &copy;Prashant.kumar@jellyfishtechnologies.com
</footer>
</body>
</html>