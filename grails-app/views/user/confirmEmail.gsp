<html>
<head>
<asset:stylesheet href="mycss"/>
</head>
<body>
<div class="container">
    <div class="forgotPassword" style="width: 600px;margin-left: 100px;">
        <div class="forgotPassword-heading"><h1>CaroBar</h1></div>
        <div class="emailcontent">
            <h1>Welcome user</h1>
            <g:link style="font-weight:bold;background: none repeat scroll 0 0 #60c693;border-radius: 5px;border:1px solid #707478;font-size:20px;color: #707478;float: left;
	height: auto;margin: 0;padding: 2% 8%;width: auto;transition:all ease 0.5s;text-decoration:none;" controller="user" action="updatePassword" id="${uuid}"
                    base="${path}">Reset Password</g:link>


        </div>
    </div>
</div>


</body>
</html>
