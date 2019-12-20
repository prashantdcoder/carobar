<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 11/4/17
  Time: 2:59 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:stylesheet href="mycss"/>
</head>
<body>
<div class="container">
    <div class="forgotPassword" style="width: 600px;margin-left: 100px;">
        <div class="forgotPassword-heading"><h1>CaroBar</h1></div>
        <div class="emailcontent">
            <h1>Click on link to verify your email</h1>
            <g:link style="font-weight:bold;background: none repeat scroll 0 0 #60c693;border-radius: 5px;border:1px solid #707478;font-size:20px;color: #707478;float: left;
	height: auto;margin: 0;padding: 2% 8%;width: auto;transition:all ease 0.5s;text-decoration:none;" controller="user" action="verifyEmailId" id="${id}"
                    base="${path}">Verify Email</g:link>


        </div>
    </div>
</div>


</body>
</html>
