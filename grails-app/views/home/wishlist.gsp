<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 31/3/17
  Time: 12:15 PM
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

    <asset:stylesheet  href="mycss"/>


</head>

<body>
<g:render template="images/header"></g:render>
<div class="container" >
<div class="content">
   <div class="mywishlist-heading">
       <h1><span class="glyphicon  glyphicon-shopping-cart"></span>My Wishlist</h1>
   </div>
    <div class="mywishlist-body">
        <g:if test="${view.size()>0}">

            <g:each in="${view}" var="car">

                <div class="item">
                    <g:link  controller="home" action="deleteWishlist" params="[carId:car.id]" class="close"></g:link>
                    <table border="0" height="200" width="500">
                        <tr>
                            <td rowspan="3" width="200px">
                                <img width="200px"   src="${createLink(controller: 'home', action:'renderImage',params: [carNumber:car.carNumber])}"  alt="${carTitle}" onclick="">
                            </td>
                            <td><h2>${car.carCompany} ${car.carTitle}</h2></td>
                        </tr>
                        <tr>
                            <td>${car.carNumber}</td>
                        </tr>
                        <tr>
                            <td> &#8377; ${car.carPrice}</td>
                        </tr>
                    </table>

                </div>
            </g:each>
        </g:if>
        <g:else>
           <div class="jumbotron" style="background-color: white;">
               <h1>Oops nothing in wishlist!!</h1>
               <g:uploadForm controller="home" action="search" >
                   <input type="submit" name="back" value="Back" class="btn btn-primary"/>
               </g:uploadForm>

           </div>
        </g:else>
    </div>
</div>
<g:form controller="checkout" action="index" params="[carIdentificationNumber: view.id]">
    <input type="submit" name="submit" value="Checkout">
</g:form>
</div>
<g:render template="footer"></g:render>
</body>
</html>