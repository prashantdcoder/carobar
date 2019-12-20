<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 1/5/17
  Time: 3:08 PM
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

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <asset:stylesheet href="mycss"/>

<style>
    .container{
        border: 0px solid black;
        margin-top: 100px;
        height: auto;
        padding: 50px;
        margin-bottom: 15px;

    }
    .message {
        margin-top: 20px;
        width: 20%;
        height: auto;
        max-width: 100%;
        border-radius: 20px;
        border: 1px solid #CCCCCC;
        padding: 10px;
        word-wrap: break-word;


    }
    .container input[type="text"]{
        width: 100%;
        max-width: 100%;
        margin-top: 10px;
        height: 70px;
    }
    .me{
        background-color: cornflowerblue;
        height: 60px;
        width: 60px;
        border-radius: 50%;
        text-align: center;
        padding: 15px;
        color: white;
    }

.message tr td {
    padding: 10px;
}
    .message  p{
        padding: 20px;
       /* border: 1px solid #CCCCCC;*/
        border-radius: 40px;
        background-color: #9077ff;
        color:white;
       /* box-shadow:0px 2px 2px 1px #CCCCCC;*/
    }
input[type="submit"]{
    color: white;
    border: none;
    background: transparent;
}

</style>
</head>

<body>
<g:render template="images/header"/>
<div class="container" >

    <table border="0" width="100%" id="external">

                <g:each in="${messageList}" var="i">

                            <g:if test="${i.getSender().username.equals(user.username)}">
                                <tr>
                                    <td style="float: right;width: auto;">
                                        <table class="message" style=" border:0px solid black; max-width: 500px; width: auto;  word-wrap: break-word;">
                                            <tr>
                                                <td>
                                                    <p style="border-bottom-right-radius: 0px;background-color:#a2ffab;color:black;">
                                                       ${i.message}
                                                    </p>

                                                </td>
                                                <td>
                                                    <div class="me"><span class="glyphicon glyphicon-user"></span>Me</div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </g:if>
                    <g:else>
                        <tr>
                            <td>
                                <table class="message" style="border:0px;max-width: 500px; width: auto;  word-wrap: break-word;">
                                    <tr>
                                        <td>
                                            <div class="me"><span class="glyphicon glyphicon-user"></span></div>
                                        </td>
                                        <td>
                                            <p  style="border-bottom-left-radius: 0px;">
                                               ${i.message}
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </g:else>
                </g:each>
    </table>

    <g:form controller="home" action="buyerReplyMessage">
        <input type="text" name="message" placeholder="Text Something..." autofocus>
        <g:each in="${threadMessage}">
            <input type="hidden" name="thread" value="${it}">
        </g:each>

        <input type="submit" name="submit" id="sendbtn" value="Send">
    </g:form>

</div>
<script>

    $(document).ready(function() {
        $('#sendbtn').attr('disabled','disabled');
        $('input[type="text"]').keyup(function() {
            var currentVal = $(this).val();
            if($.trim(currentVal).length > 0) {
                $('input[type="submit"]').removeAttr('disabled');
            }else{
                $('#sendbtn').attr('disabled','disabled');
            }
        });
    });
</script>
<g:render template="footer"></g:render>

</body>
</html>