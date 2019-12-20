<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 11/5/17
  Time: 3:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Stripe Checkout</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <link rel="stylesheet" href="/home/prashantk/project/carobar/web-app/css/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <asset:javascript src="stripe"></asset:javascript>
    <asset:stylesheet href="mycss"/>
    <style type="text/css">
    .container{
        padding:30px;
    }
    .form-group{
        margin:10px 0px;;
    }
    label{
        display:block;
        font-weight:bold;
    }
    label span{
        font-size:11px;
        font-weight:normal;
        display:block;
    }
    .payment-table{
        width: auto;
        height: 300px;
        border: 1px solid #CCCCCC;
    }
    .payment-table td{
        padding: 8px;
    }

    .payment-table input[type=text]{
        width: 300px;
        border: 1px solid #CCCCCC;
        height: 35px;
        border-radius: 3px;
        letter-spacing: 1px;

    }
    .payment-table  input[type=text]:focus{
        border: 1px solid #2e6da4;
        box-shadow: 0px 0px 1px 1px  #2aabd2;
    }
    .payment-table input[type=submit]{
        width: 300px;
        border: 1px solid #CCCCCC;
        height: 47px;
    }
    .payment-table input[type=submit]:hover{
        background-color: #2aabd2;
        color: white;
    }

    #payment-header{

        background-color: #2aabd2;
        padding: 2px;
        color: white;
        border-top-right-radius: 3px;
        border-top-left-radius: 3px;
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
        height: 84px;
        width: 510px;
    }
    #payment-header h2{
        margin-top: 0px;

    }
    #payment-header span{
        left: 46%;
    }

    #card-number{
        width: 300px;
        letter-spacing: 1px;
    }

    </style>
    <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
    <script>
        Stripe.setPublishableKey("${grailsApplication.config.grails.plugins.stripe.publishableKey}");

        var payment=false;
        function stripeResponseHandler(status, response) {

            if (response.error) {
                $(".payment-errors").html(response.error.message);
            } else {
                var token = response['id'];
                document.forms["f1"]["stripeToken"].value=token;
                var hidval=document.forms["f1"]["stripeToken"].value;
                payment=true;

               $("#payment-form").submit();
                return payment;
            }
        }

        $(document).ready(function() {
            $("input[type=submit]").click(function(event) {
                var chargeAmount = 1000;
                Stripe.createToken({
                    number: $('.card-number').val(),
                    cvc: $('.card-cvc').val(),
                    exp_month: $('.card-expiry-month').val(),
                    exp_year: $('.card-expiry-year').val()
                }, chargeAmount, stripeResponseHandler);


                if(payment === true){
                    $("#payment-form").submit();
                    return true;
                }else
                {
                    return false
                }
            });

        });

        if (window.location.protocol === 'file:') {
            alert("stripe.js does not work when included in pages served over file:// URLs.");
        }

    </script>

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
                    <li>  <g:link controller="home" action="redirectionPage"><span class="glyphicon glyphicon-home"></span>HOME</g:link> </li>
                    <li>  <g:link controller="home" action="addCars"><span class="glyphicon glyphicon-shopping-cart"></span>SELL</g:link></li>
                    <li>  <g:link controller="home" action="feedback"><span class="glyphicon glyphicon-pencil"></span>FEEDBACK</g:link></li>
                    <li>  <g:link controller="home" action="userIdentification"><span class="glyphicon glyphicon-envelope"></span>MESSAGE</g:link> </li>
                    <li>
                        <form name="submitForm" method="POST" action="${createLink(controller: 'logout')}">

                            <a id="logout" HREF="javascript:document.submitForm.submit()"> <span class="glyphicon glyphicon-log-out"></span>LOGOUT</a>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<div class="container" style="margin-top: 40px; border: 0px solid black; width: 500px;">
<div id="payment-header">
    <h2 ><span class="glyphicon glyphicon-credit-card"></span></h2>
    <h4 style="background-color: transparent;">Cards</h4>
</div>
    <g:form action="charge" method="POST" id="payment-form" name="f1">
        <table class="payment-table" align="center" >
            <div class="form-row">
                <tr>
                    <td>

                    </td>
                    <td>
                        <span class="payment-errors" style="color: red"> </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><g:message code="Amount(INR).label"></g:message></label>
                    </td>
                    <td>
                        <input type="text" size="30" autocomplete="off" id="amount" name="amount"/>
                    </td>
                </tr>
            </div>
            <div class="form-row">
                <tr>
                    <td>
                        <label> <g:message code="cardNumber.label"></g:message> </label>
                    </td>
                    <td>
                        <input id="card-number" maxlength="16" type="text" size="20" data-stripe="number" class="card-number"/>

                    </td>
                </tr>
            </div>
            <div class="form-row">
                <tr>
                    <td>
                        <label> <g:message code="cardHolderName.label"></g:message></label>
                    </td>
                    <td>

                        <input  maxlength="16" type="text" size="20" data-stripe="name" class="cardholder-name"/>
                    </td>
                </tr>
            </div>
            <div class="form-row">
                <tr>
                    <td>
                        <label><g:message code="cvv.label"></g:message></label>
                    </td>
                    <td>
                        <input type="text" size="4" maxlength="3" data-stripe="cvc" class="card-cvc" style="width: 100px;"/>
                    </td>
                </tr>
            </div>
            <div class="form-row">
                <tr>
                    <td>
                        <label><g:message code="expiration.label"></g:message></label>
                    </td>
                    <td>
                        <input type="text" size="2" data-stripe="exp-month" class="card-expiry-month" style="width: 100px;" />
                        <input type="text" size="4" data-stripe="exp-year" class="card-expiry-year" style="width: 100px;"/>
                    </td>
                </tr>
            </div>
            <tr>
                <td>

                </td>
                <td>
                    <input type="hidden" name="stripeToken"/>


                    <g:if test="${carIdAsList}">
                        <g:each in="${carIdAsList}" var="x">
                            <input type="hidden" name="carIdentificationNumberAsList" value="${x}"/>
                        </g:each>
                    </g:if>
                    <g:else>
                        <input type="hidden" name="carIdentificationNumberAsString" value="${carIdAsString}"/>
                    </g:else>

                    <input type="submit" name="submit" value="Pay"/>
                </td>
            </tr>
        </table>
    </g:form>

</div>
<footer style="text-align: center;">
&copy; Prashant.kumar@jellyfishtechnologies.com
</footer>

</body>
</html>