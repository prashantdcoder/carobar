<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 21/3/17
  Time: 4:56 PM
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
</head>

<body>
<g:render template="/home/images/header"></g:render>
<div class="container">
    <div class="forgotPassword">
        <div class="forgotPassword-heading">Forgot Password</div>

            <g:if test="${flash.message}">
                <div class="alert-danger" style="text-align: center;margin-top: 5px;padding: 5px;">
           <strong> ${flash.message}</strong>
                </div>
        </g:if>
        <g:form controller="user" action="confirmEmail">
            <label>Email:</label><input type="text" name="email"/><br>
            <input type="submit" name="submit" value="Reset Password" style="margin-left: 65px;"/>
        </g:form>

    </div>
</div>
</body>
</html>