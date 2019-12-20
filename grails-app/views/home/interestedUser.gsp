<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 3/4/17
  Time: 12:08 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>testing</title>


    <style>
    .main{
        border: none;
        width: 400px;
        height: auto;
        margin-left: 200px;
        -moz-box-shadow:    2px 2px 5px 1px rgba(35, 5, 2, 0.38);
        -webkit-box-shadow: 2px 2px 5px 1px rgba(35, 5, 2, 0.38);
        box-shadow: 2px 2px 5px 1px rgba(35, 5, 2, 0.38);
    }
    .heading{
        background-color: rgba(255, 106, 15, 0.75);
        padding: 20px;
        text-align: center;
        color: white;
        font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
        font-weight: bolder;

    }
    .content h2,p{
        text-align: center;
    }
    .content p{
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    }
    .carcontent{
        text-align: center;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        border-top: 2px solid grey;
    }

    </style>
</head>
<body>
<div class="main">
    <div class="heading">
        <h1>User has viewed this car</h1>
    </div>
    <div class="content">
        <h2>${user.username}</h2>
        <p>
            ${user.city}<br>
            ${user.email}<br>
            ${user.number}<br>
        </p>

    </div>
    <div class="carcontent">
        <h2>${car.carTitle}</h2>
        <p>
            ${car.carCompany}<br>
            ${car.carNumber}<br>
            ${car.carPrice}<br>
        </p>

    </div>
</div>
</body>
</html>