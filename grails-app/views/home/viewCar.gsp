<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 7/3/17
  Time: 1:13 PM
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

    <asset:stylesheet  href="mycss"/>
    %{--<asset:stylesheet href="main.min.css"/>--}%
    <asset:stylesheet href="ma5slider.min.css"/>
    <asset:javascript src="run_prettify.js"/>
    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="jquery-ui.min.js"/>
    <asset:javascript src="jquery.ui.touch-punch.min.js"/>
    <asset:javascript src="functions.js"/>
    <asset:javascript src="ma5slider.min.js"/>
    <script>
        $(window).on('load', function () {
            $('.ma5slider').ma5slider();
        });
    </script>
    <style>
    table td{
        width: 300px;
    }


    </style>
</head>

<body>
<g:render template="images/header"></g:render>

<g:render template="viewCar" model="[carComfort:carComfort,
                                     carSafety:carSafety,
                                     carCapacity:carCapacity,
                                     carEngineTransmission:carEngineTransmission,
                                     carBasics:carBasics]"></g:render>
<g:render template="footer"/>
</body>
</html>