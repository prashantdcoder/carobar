<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 25/4/17
  Time: 1:43 PM
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
    #count{
        color: white;
        background: red;
        border-radius: 50%;
        width: 30px;
        height: 30px;
        padding: auto;
        text-align: center;


    }

</style>
</head>

<body>
<g:render template="images/header"/>
<div class="container">
    <h5 style="color: red;">
        <g:hasErrors bean="${messageCommand}">
            <g:renderErrors bean="${messageCommand}" as="list">
            </g:renderErrors>
    </g:hasErrors>
</h5>



<sec:ifAnyGranted roles="Buyer_ROLE">
    <table class="table table-striped  table-responsive" >
        <tr>
            <th>Car</th>
            <th>Message</th>
            <th>Delete</th>
        </tr>
        <g:each in="${message1}" var="parentmessage">
            <tr>
                <td>
                    <img width="200px" height="100px" id="myImg${i}" src="${createLink(controller: 'home', action:'renderImage',params: [carNumber:parentmessage.carImage])}"  alt="title" onclick="">
                </td>
                <td>
                    <table class="table  table-responsive">
                        <g:each in="${parentmessage}" var="reply">
                            <tr>
                                <td width="12%">
                                    <div class="user" style="border-radius: 50%;">
                                        <span class="glyphicon glyphicon-user"></span><br>
                                        <g:if test="${parentmessage.sender.username.equals(parentmessage.sender.username)}">
                                            Me
                                        </g:if>
                                    </div>

                                </td>
                                <td width="44%">
                                   <g:link controller="home" action="conversations" params="[threadMessage:reply.getThreadMessage().id]">
                                       ${reply.getMessage()}
                                   </g:link>

                                    <script>
                                        $(document).ready(function(){

                                            var data={threadId:${reply.threadMessage.id}};
                                            $.ajax({
                                                type:'GET',
                                                data:data,
                                                url:"${createLink(controller: 'home',action: 'countUnseenMessages')}",
                                                success:function(result){


                                                    if(Number(result)>0){
                                                        document.getElementById("count_${reply.threadMessage.id}").innerHTML = Number(result);
                                                        $("#count_${reply.threadMessage.id}").attr("style","color:white;" +
                                                                "background-color:red;" +
                                                                "border-radius:50%;" +
                                                                "width:30px;" +
                                                                "height:30px;" +
                                                                "padding:auto;" +
                                                                "text-align:center;" +
                                                                "font-weight:bold");
                                                    }


                                                },
                                                error:function(exception){
                                                    alert("Error"+exception)
                                                }


                                            });

                                        })
                                    </script>
                                </td>
                                <td width="10%">
                                    <div id="count_${reply.threadMessage.id}" style=""></div>
                                </td>
                                <td>
                                    ${reply.date.toGMTString()}
                                </td>
                            </tr>
                        </g:each>
                    </table>
                </td>
                <td  style="text-align: center;padding-top: 5%;">
                    <g:link controller="home" action="deleteMessage" params="[threadId:parentmessage.threadMessage.id]"><span class="glyphicon glyphicon-trash"></span></g:link>
                </td>
            </tr>
        </g:each>
    </table>
</sec:ifAnyGranted>

<sec:ifAnyGranted roles="Seller_Role">

    <g:if test="${message1}">
        <table class="table table-striped table-responsive">
            <tr>
                <th>Car</th>
                <th>Messages</th>
                <th>Delete</th>
            </tr>
            <g:each in="${message1}" var="parentmessage">
                <tr>
                    <td>
                        <img width="200px" height="100px" id="myImg${i}" src="${createLink(controller: 'home', action:'renderImage',params: [carNumber:parentmessage.carImage])}"  alt="title" onclick="">
                    </td>
                    <td>
                        <table class="table table-responsive">
                            <g:each in="${parentmessage}" var="reply">
                                <tr>
                                    <td width="12%">
                                        <span class="glyphicon glyphicon-user"></span><br>
                                            <g:if test="${parentmessage.sender.username.equals(parentmessage.sender.username)}">
                                                ${parentmessage.sender.username}
                                            </g:if>
                                    </td>
                                    <td width="46%">
                                        <g:link controller="home" action="conversations" params="[threadMessage:reply.getThreadMessage().id]"> ${reply.getMessage()}</g:link>
                                        <script>
                                            $(document).ready(function(){

                                                var data={threadId:${reply.threadMessage.id}};
                                                $.ajax({
                                                    type:'GET',
                                                    data:data,
                                                    url:"${createLink(controller: 'home',action: 'countUnseenMessages')}",
                                                    success:function(result){


                                                        if(Number(result)>0){
                                                            document.getElementById("count_${reply.threadMessage.id}").innerHTML = Number(result);
                                                            $("#count_${reply.threadMessage.id}").attr("style","color:white;" +
                                                                    "background-color:red;" +
                                                                    "border-radius:50%;" +
                                                                    "width:30px;" +
                                                                    "height:30px;" +
                                                                    "padding:auto;" +
                                                                    "text-align:center;" +
                                                                    "font-weight:bold");
                                                        }


                                                    },
                                                    error:function(exception){
                                                        alert("Error"+exception)
                                                    }


                                                });

                                            })
                                        </script>

                                    </td>
                                    <td width="10%">
                                        <div id="count_${reply.threadMessage.id}" style=""></div>
                                    </td>
                                    <td>
                                       ${reply.getDate().toGMTString()}
                                    </td>
                                </tr>
                            </g:each>
                        </table>
                    </td>
                    <td style="text-align: center;padding-top: 5%;">
                       <g:link controller="home" action="deleteMessage" params="[threadId:parentmessage.threadMessage.id]"><span class="glyphicon glyphicon-trash"></span></g:link>
                    </td>
                </tr>
            </g:each>
        </table>
    </g:if>
    <g:else>
        <h3>No Messages</h3 >
    </g:else>
</sec:ifAnyGranted>
</div>
<g:render template="footer"></g:render>

</body>
</html>