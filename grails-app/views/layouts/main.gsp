<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <link rel="icon" href="/images/favicon.ico">
    <title><g:layoutTitle default="Car-O-Bar"/></title>
    <asset:javascript src="jquery-3.3.1.min.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="custom.css"/>
    <asset:stylesheet src="style.css"/>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <g:layoutHead/>
</head>

<body>
<div class="container-fluid">
    <g:render template="/layouts/header"/>
    <div class="wrap">
        <g:layoutBody/>
    </div>
    <g:render template="/layouts/footer"/>
</div>
</body>
</html>
