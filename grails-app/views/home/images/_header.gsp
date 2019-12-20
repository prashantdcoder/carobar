<%@ page import="com.carobar.User" %>
<nav class="navbar navbar-default navbar-fixed-top" style="z-index: 999;">
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
                %{--<li>
                    <form name="submitForm" method="POST" action="${createLink(controller: 'logout')}">
                        <a id="logout" HREF="javascript:document.submitForm.submit()"> <span class="glyphicon glyphicon-log-out"></span>LOGOUT</a>
                    </form>
                </li>--}%
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Profile</a></li>
                        <li><form name="submitForm" method="POST" action="${createLink(controller: 'logout')}">
                            <a id="logout" HREF="javascript:document.submitForm.submit()"> <span class="glyphicon glyphicon-log-out"></span>LOGOUT</a>
                        </form></li>
                    </ul>
                </li>
            </ul>

        </div>
    </div>
</nav>
