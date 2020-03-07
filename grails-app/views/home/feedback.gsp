<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 9/5/17
  Time: 12:22 PM
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


</head>

<body>
<g:render template="images/header"></g:render>
<sec:ifAnyGranted roles="Seller_Role,Buyer_ROLE">
    <div class="container">
        <div class="feedback">
            <table border="0" width="60px" height="200px">
                <tr>
                    <td>
                        <img style="height: 300px; width: 600px;"src="${resource(dir:'images', file:'feedback.jpg')}" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span>Write feedback</button>
                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header" >
                                        <h4 class="modal-title" style="font-size: 20px;">Your Feedback </h4>
                                    </div>
                                    <div class="modal-body">
                                        <g:form controller="home" action="feedback">
                                            <g:hasErrors bean="${feedbackCommand}">
                                                <i style="color:red;"> <g:renderErrors bean="${feedbackCommand}" as="list" ></g:renderErrors></i>
                                            </g:hasErrors>
                                            <input type="text" name="heading" placeholder="Heading" ><br>
                                            <textarea id="post" name="content" rows="5" cols="40" placeholder="What's on your mind?" maxlength="250"></textarea>
                                            <small id="characterLength" style="float: right;color: red;">250</small><br>
                                            <input type="submit" name="submit" value="Submit" class="btn btn-default">
                                        </g:form>
                                        <script>
                                            $("#post").keyup(function(){

                                                var textlength=document.getElementById("post").value;
                                                var remainingCharacter=250-textlength.length;
                                                document.getElementById("characterLength").innerHTML=remainingCharacter
                                            });
                                        </script>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <g:if test="${flash.message}">
                            <div class="alert alert-success">
                                <strong>Success!</strong> ${flash.message}
                            </div>
                        </g:if>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</sec:ifAnyGranted>
<sec:ifAllGranted roles="Admin_Role1">
    <div class="container">
        <h1>Feedback Posts</h1>
       <table class="table table-responsive">
           <g:each in="${feedbackList}" var="feedback">
               <tr>
                   <td width="10%">
                       <div class="user">
                           <span class="glyphicon glyphicon-user"></span>
                       </div>
                   </td>
                   <td>
                       <strong>${feedback.getHeading()}</strong><br>
                       <small>${feedback.getUser().username} | <span class="glyphicon glyphicon-time"></span> ${feedback.date}</small><br>
                       <p style="max-width: 700px; word-break: break-all;">
                           ${feedback.content}
                       </p>
                   </td>
               </tr>
           </g:each>
       </table>
        <ul class="pagination">
            <li><g:paginate  controller="home" action="feedback" total="${feedbackCount}" max="5"/></li>
        </ul>
    </div>
</sec:ifAllGranted>

<g:render template="footer"></g:render>
</body>
</html>