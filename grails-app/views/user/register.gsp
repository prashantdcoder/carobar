<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 6/2/17
  Time: 12:58 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Registeration</title>
  %{--  <meta name="layout" content="main"/>--}%
    <link rel="stylesheet" href="web-app/css/mycsss.css" type="text/css"/>
    <link rel="stylesheet" href="css/mycss.css" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <asset:stylesheet href="mycss"/>

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
                <li>  <g:link controller="home" action="index"><span class="glyphicon glyphicon-home"></span>HOME</g:link> </li>
                <li>  <g:link controller="home" action="index"><span class="glyphicon glyphicon-shopping-cart"></span>SELL</g:link></li>
                <li>  <g:link controller="home" action="index"><span class="glyphicon glyphicon-pencil"></span>FEEDBACK</g:link></li>
                <li>  <g:link controller="home" action="index"><span class="glyphicon glyphicon-envelope"></span>MESSAGE</g:link> </li>
            </ul>
        </div>
    </div>
</nav>
<div id='login'>
    <div class='inner'>
        <div class='fheader'>Registration Form</div>

        <g:if test='${flash.message}'>
            <div class='login_message' style="color: yellowgreen">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${userCommand}">
          <i style="color: #f1ff1d;"> <g:renderErrors bean="${userCommand}" as="list" ></g:renderErrors></i>

        </g:hasErrors>


         <form action="user_details" method='POST' id='loginForm' class='cssform' autocomplete='off'>
            <p>


                <label> Username:</label>
                <input type='text' class='text_' name='username' id='full_name' onblur="checkAvailability();"/><span id="user-availability-status" style="color:yellow;margin-left: 0px;"></span>

            </p>

            <p>
                <label>Email:</label>
                <input type='email' class='text_' name='email' id='email'/>

            </p>


            <p>
                <label>Phone Number:</label>
                <input type='number' class='text_' name='number' id='number' maxlength="10"/>


            </p>

            <p>
                <label>City:</label>
                <input type='text' class='text_' name='city' id='city'/>

            </p>

            <p>
                <label>Password:</label>
                <input type='password' class='text_' name='password' id='password'/>

            </p>

            <p>
                <label>Confirm Password:</label>
                <input type='password' class='text_' name='confirm_password' id='confirm_password'/>

            </p>

            <p>
                <label>Select Role: </label>
                <g:select multiple="multiple" name="role" from="${com.carobar.Role.list()}" optionKey="authority" optionValue="authority" value="asc" style="color: black; width: 150px"   />

            </p>

            <p>
                <input type='submit' id="submit" value='Submit'/>
            </p>
        </form>
    </div>
</div>

<footer style="text-align: center;">
&copy; Prashant.kumar@jellyfishtechnologies.com
</footer>

<script>
    function checkAvailability() {

        var username=document.getElementById("full_name").value;
        var data={username:username};
        jQuery.ajax({
            type: "GET",
            url: "${createLink(controller: 'user', action:'checkAvailability')}",
            data:data,

            success:function(result){
                var status='';
                if(result === 'exist'){

                    status="Username is not available"
                    $("#user-availability-status").html(status);
                    $("#full_name").focus();

                }
                else {
                    status="Username is available";
                    $("#user-availability-status").html(status);

                }
            },
            error: function (jqXHR, exception) {
                var msg = '';
                if (jqXHR.status === 0) {
                    msg = 'Not connect.\n Verify Network.';
                } else if (jqXHR.status == 404) {
                    msg = 'Requested page not found. [404]';
                } else if (jqXHR.status == 500) {
                    msg = 'Internal Server Error [500].';
                } else if (exception === 'parsererror') {
                    msg = 'Requested JSON parse failed.';
                } else if (exception === 'timeout') {
                    msg = 'Time out error.';
                } else if (exception === 'abort') {
                    msg = 'Ajax request aborted.';
                } else {
                    msg = 'Uncaught Error.\n' + jqXHR.responseText;
                }
                alert(("msg: "+msg))
            }
        });
    return false;
    }
</script>
</body>
</html>