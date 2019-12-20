<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 3/3/17
  Time: 11:45 AM
--%>

<%@ page import="com.carobar.Car; commandObject.CarCompany" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Carobar</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <link rel="stylesheet" href="/home/prashantk/project/carobar/web-app/css/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <asset:stylesheet  href="mycss"/>

<style>
    .carsearch{
        margin: 50px 0px 0px 200px;
        text-align: center;
        height: auto;
        border-radius: 4px;
        border: 1px solid rgba(0, 0, 0, 0.19);
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        width: 40%;
        margin-left: -10px;
    }
    .carsearch ul li{
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: white;
        width: 125px;
        border-radius: 6px;
    }
    .carsearch  h1 {
        color: black;

    }
    .carsearch  li {
        float: left;

    }

    .carsearch  li a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: larger;
        font-weight: bolder;
        color: #2d2d30;

    }
    .carsearch li a:hover{
        background-color: red;
        cursor: pointer;
        color: white;

        -moz-transition-duration:200ms;


    }
    .carsearch li {
        background-color: #2e6da4;
    }
    .carsearch select{
        margin-top: 10px;
        width: 300px;
        height: 55px;
    }
    .carsearch input[type="submit"]{
        margin-top: 20px;
        width: 300px;
        height: 60px;
        border-radius: 2px;
        border: none;
        background-color: #ff3b0f;
        color: white;
        font-weight: bolder;
        font-size: larger;
    }
    .option{
        background-color: whitesmoke;
        height: 100px;
        margin: 20px;
        padding: 30px;
        border-radius: 2px;
        color: black;
        font-weight: bolder;
        cursor: pointer;

    }
    .option a{
        text-decoration: none;
    }

</style>
    <script type="text/javascript">
       function submitform(){
           document.getElementById("form1").submit();
       }
    </script>
</head>

<body>
<g:render template="images/header"></g:render>
<div class="container">
    <div class="carsearch">

        <sec:ifAnyGranted roles="Buyer_ROLE">
            <h1>Search</h1>
            <ul>
                <li>
                    <a href="#" style="background-color: red;color: white">New Car</a>
                </li>
                <li>
                    <a href="#">Used Car</a>
                </li>
            </ul>
            <g:form controller="home" action="search">
        <select name="price">
            <option>--Select Budget--</option>
            <option name="price">1Lac-5Lac</option>
            <option name="price">5Lac-10Lac</option>
            <option name="price">10Lac-15Lac</option>

        </select>

                <g:select name="carCompany" from="${commandObject.CarCompany?.values()}" keys="${commandObject.CarCompany.values()*.name()}" required="" value="${fieldValue(bean: carCampany, field: 'carCompany')}"/>

                <g:submitButton name="search" value="Search"/>
            </g:form>
        </sec:ifAnyGranted>

     </div>



</div>
</body>
</html>