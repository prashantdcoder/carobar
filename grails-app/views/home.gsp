<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 7/2/17
  Time: 1:10 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Car-O-Bar | Re-Incarnation</title>
</head>

<body>
<div class="outer_div">
    <div class="inner_div">
        <g:link controller="login" action="auth">
            <button class="btn btn-default custom_btn">Login</button>
        </g:link>
        <g:link controller="user" action="register">
            <button class="btn btn-default custom_btn black_btn">Registration</button>
        </g:link>
    </div>
</div>
</body>
</html>