<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 14/2/17
  Time: 12:11 PM
--%>

<%@ page import="com.carobar.Picture" contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title>Admin Panel</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <link rel="stylesheet" href="/home/prashantk/project/carobar/web-app/css/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <asset:stylesheet href="style.css"/>
    <asset:javascript src="jquery.js"/>
    <asset:javascript src="jquery-ui.js"/>
    <asset:stylesheet href="mycss"/>

    <style type="text/css">


        #editButton{
            background-color: white;
            color: black;
            border: none;
            color: cornflowerblue;

        }
       input[type=submit]{
           margin-left: 30%;
           border-radius: 50%;
           height: 120px;
           width: 120px;
           background-color: whitesmoke;
           color:#2aabd2;
           border: none;
       }
    input[type=submit]:hover{
        background-color: #2e6da4;
        color: white;
        transition-duration: 1s;
    }
        #usertab li{
            padding: 5px;
            background-color: white;
            margin: 0px;
        }
        #usertab td{
            height: 100px;
            margin: -10px;
        }
        .usertab{

            background-color: #CCCCCC;
            color: black;
            text-align: center;
            margin: 1px;
            border: 7px solid white;
        }
        .usertab:hover{
            box-shadow: 0px 3px 3px 2px #CCCCCC;
            cursor: pointer;
        }
    #carHover:hover{
        /*box-shadow: 2px 1px 3px 3px rgba(21, 13, 19, 0.05);*/
        -webkit-box-shadow: -1px 5px 16px -2px rgba(105,102,105,1);
        -moz-box-shadow: -1px 5px 16px -2px rgba(105,102,105,1);
        box-shadow: -1px 5px 16px -2px rgba(105,102,105,1);
        cursor: pointer;
        transition-duration: 0.3s;

    }

  </style>
    <script type="text/javascript">
        function showForm() {
            document.getElementById("theform").style.display = "block";
            document.getElementById("theform").style.backgroundColor="red";
        }
    </script>

    <style>
    .container{
        border: none;
        margin-top: 4%;
        margin-left: 23.2%;
        width: 990px;
        padding: 20px;
        /*background-color: rgba(21, 13, 19, 0.05);*/
        background-color: white;

    }
    .nav-side-menu {
        overflow: auto;
        font-family: verdana;
        font-size: 12px;
        font-weight: 200;
        background-color: #2e353d;
        position: fixed;
        top: 0px;
        width: 300px;
        height: 100%;
        color: #e1ffff;
    }
    .nav-side-menu .brand {
        background-color: #23282e;
        line-height: 50px;
        display: block;
        text-align: center;
        font-size: 14px;
    }
    .nav-side-menu .toggle-btn {
        display: none;
    }
    .nav-side-menu ul,
    .nav-side-menu li {
        list-style: none;
        padding: 0px;
        margin: 0px;
        line-height: 35px;
        cursor: pointer;
        /*
          .collapsed{
             .arrow:before{
                       font-family: FontAwesome;
                       content: "\f053";
                       display: inline-block;
                       padding-left:10px;
                       padding-right: 10px;
                       vertical-align: middle;
                       float:right;
                  }
           }
      */
    }
    .nav-side-menu ul :not(collapsed) .arrow:before,
    .nav-side-menu li :not(collapsed) .arrow:before {
        font-family: FontAwesome;
        content: "\f078";
        display: inline-block;
        padding-left: 10px;
        padding-right: 10px;
        vertical-align: middle;
        float: right;
    }
    .nav-side-menu ul .active,
    .nav-side-menu li .active {
        border-left: 3px solid #d19b3d;
        background-color: #4f5b69;
    }
    .nav-side-menu ul .sub-menu li.active,
    .nav-side-menu li .sub-menu li.active {
        color: #d19b3d;
    }
    .nav-side-menu ul .sub-menu li.active a,
    .nav-side-menu li .sub-menu li.active a {
        color: #d19b3d;
    }
    .nav-side-menu ul .sub-menu li,
    .nav-side-menu li .sub-menu li {
        background-color: #181c20;
        border: none;
        line-height: 28px;
        border-bottom: 1px solid #23282e;
        margin-left: 0px;
    }
    .nav-side-menu ul .sub-menu li:hover,
    .nav-side-menu li .sub-menu li:hover {
        background-color: #020203;
    }
    .nav-side-menu ul .sub-menu li:before,
    .nav-side-menu li .sub-menu li:before {
        font-family: FontAwesome;
        content: "\f105";
        display: inline-block;
        padding-left: 10px;
        padding-right: 10px;
        vertical-align: middle;
    }
    .nav-side-menu li {
        padding-left: 0px;
        border-left: 3px solid #2e353d;
        border-bottom: 1px solid #23282e;
    }
    .nav-side-menu li a {
        text-decoration: none;
        color: #e1ffff;
    }
    .nav-side-menu li a i {
        padding-left: 10px;
        width: 20px;
        padding-right: 20px;
    }
    .nav-side-menu li:hover {
        border-left: 3px solid #d19b3d;
        background-color: #4f5b69;
        -webkit-transition: all 1s ease;
        -moz-transition: all 1s ease;
        -o-transition: all 1s ease;
        -ms-transition: all 1s ease;
        transition: all 1s ease;
    }
    @media (max-width: 507px) {
        .nav-side-menu {
            position: relative;
            width: 100%;
            margin-bottom: 10px;
        }
        .nav-side-menu .toggle-btn {
            display: block;
            cursor: pointer;
            position: absolute;
            right: 10px;
            top: 10px;
            z-index: 10 !important;
            padding: 3px;
            background-color: #ffffff;
            color: #000;
            width: 40px;
            text-align: center;
        }
        .brand {
            text-align: left !important;
            font-size: 22px;
            padding-left: 20px;
            line-height: 50px !important;
        }
    }
    @media (min-width: 507px) {
        .nav-side-menu .menu-list .menu-content {
            display: block;
        }
    }
    </style>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

</head>

<body>
<g:render template="images/header"></g:render>


<div class="nav-side-menu" style="font: inherit;">
    <div class="brand">Brand Logo</div>
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
    <div class="menu-list">
        <ul id="menu-content" class="menu-content collapse out">
            <li>
                <a href="#">
                    <i class="fa fa-dashboard fa-lg"></i> Dashboard
                </a>
            </li>
            <li data-toggle="collapse" data-target="#service" class="collapsed">
                <a href="#"><i class="fa fa-globe fa-lg"></i> Services <span class="arrow"></span></a>
            </li>
            <ul class="sub-menu collapse" id="service">
                <li><a id="addCars">Add Cars</a></li>
                <li><a id="cars">Cars</a></li>
                <li>Notifications</li>
                    <li>Feedback</li>
            </ul>
            <li data-toggle="collapse" data-target="#new" class="collapsed">
                <a href="#">  <i class="fa fa-users fa-lg"></i>User <span class="arrow"></span></a>
            </li>
            <ul class="sub-menu collapse" id="new">
                <li>Buyer</li>
                <li>Seller</li>
            </ul>
            <li>
                <a href="#">
                    <i class="fa fa-user fa-lg"></i> Profile
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="container" id="tabcontents">
   <h1>Welcome admin</h1><br>
    <div class="news-feed">
      <div class="news-feed-heading" id="content">
            <strong>News feed</strong>

      </div>
      <g:each in="${0..5}">
          <div class="news-feed-content">
              <table>
                  <tr>
                      <td>
                          <div>
                              <span class="glyphicon glyphicon-user"></span>
                          </div>
                      </td>
                      <td>
                          <Strong>Username</Strong>&nbsp;<small>has joined carobar</small>
                      </td>
                  </tr>
              </table>
          </div>
      </g:each>
  </div>
</div>







%{--

<div class="container">
    <h1>Welcome Admin
    </h1>
    <div class="container" style="border: 0px solid black;width: 50%; height: auto;">
        <table id="usertab" border="0" width="300px">
            <tr>
                <td colspan="2">
                    <g:form controller="home" action="addCars">
                        <input type="submit"  name="submit" value="Add cars"  />
                    </g:form>
                </td>
            </tr>
            <tr>
                <td class="usertab">
                    Buyer
                </td>
                <td class="usertab">
                     Seller
                </td>
            </tr>
        </table>
    </div>
</div>

<div class="container" style="margin-top: -100px;border: 0px solid black;">
    <div id="fetch" >
    <h3>Car list</h3>
        <table class="table table-striped" >
            <thead>
            <tr>
                <th>Serial No.</th>
                <th>Photo</th>
                <th>Title</th>
                <th>Brand</th>
                <th>Number</th>
                <th>Price(&#8377;)</th>
                <th>Edit/Delete</th>
            </tr>
            </thead>
            <tbody >
            <g:each in="${carList}" var="car"  status="i">
            <tr>
                <td>
                    <h3>${i+1}</h3>
                </td>
                <td>
                    <div id="wowslider-container1">
                        <div class="ws_images">
                            <ul>
                                <li>
                                    <img id="myImg${i}" src="${createLink(controller: 'home', action:'renderImage',params: [carNumber:car.carNumber])}" style="height: 50px;width: 50px;" alt="${carTitle}" onclick="">
                            </ul>
                        </div>
                    </div>
                </td>
                <td>
                    <h3>${car.carTitle}</h3>
                </td>
                <td>
                    <h3>${car.carCompany}</h3>
                </td>
                <td>
                    <h3>${car.carNumber}</h3>
                </td>
                <td>
                    <h3>${car.carPrice}</h3>
                </td>
                <td>
                    <g:link controller="home"  params="[carId:car.id]" action="deleteCar"><span class="glyphicon glyphicon-trash"></span>Delete</g:link> |
                    <g:link controller="home" action="editCar" params="[id: car?.id]" >Edit</g:link>
                    <g:link controller="home" action="editOtherDetails" params="[id: car?.id]" >Edit</g:link>
                 </td>
            </tr>
            </g:each>
            </tbody>
        </table>
        <ul class="pagination">
            <li> <g:paginate  controller="home" action="index" total="${carsCount}" max="5"/></li>
        </ul>
    </div>
</div>--}%
<script>

    function renderLargeImage(imageId)
    {
        var modal = document.getElementById('mModal');


        var img = document.getElementById(imageId);
        var modalImg = document.getElementById(imageId);
        var captionText = document.getElementById("caption");
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            captionText.innerHTML = this.alt;
        }


    }
</script>
<script>

    $('#cars').on('click',function() {
        $.ajax({
            type:'GET',
            url:"${createLink(controller: 'home',action: 'carDetails')}",
            success: function(resp){
                document.getElementById("tabcontents").innerHTML=resp.htmlContent;
            },
            error:function(jqXHR,exception){
                alert("Error"+exception);
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

                alert("MSG:"+msg);

            }
        });
    });

    $('#addCars').on('click',function() {
        $.ajax({
            type:'GET',
            url:"${createLink(controller: 'home',action: 'addCarsByAdmin')}",
            success: function(resp){
                document.getElementById("tabcontents").innerHTML=resp.htmlContent;
            },
            error:function(exception){
                alert("ErrorS"+exception);
            }
        });
    });

</script>

<asset:javascript src="wowslider.js"/>
<asset:javascript src="script.js"/>
<g:render template="footer"></g:render>
</body>
</html>