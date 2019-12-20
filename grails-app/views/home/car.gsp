<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 3/3/17
  Time: 6:11 PM
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
    <asset:stylesheet  href="mycss"/>

    <style>
   .container td,g:link{
        text-decoration: none;

    }


   .carsearch{
       margin: 50px 0px 0px 200px;
       text-align: center;
       height: auto;
       border-radius: 4px;
       border: 1px solid rgba(0, 0, 0, 0.19);
       box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
       width: 24%;
       margin-left: -10px;
       position: fixed;
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

   #viewCar i{
       font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;


   }

   #viewCar #recent-view{
       margin-left: 5px;
       height: 15px;
       padding: 2px;


    }

</style>


</head>

<body>

<g:render template="images/header"></g:render>

<sec:ifAnyGranted roles="Buyer_ROLE">
    <div class="wishlist" >

        <g:link controller="home" action="wishlist">
            <span class="glyphicon glyphicon-shopping-cart"></span>
            <span id="clicks">
            </span>
        </g:link>

    </div><!-- wish list end -->
<div class="mycollapse">
    <form id="form-brand">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Search by Budget</a>
                </h4>
            </div>
            <div id="collapse1" class="panel-collapse collapse in">
                <div class="panel-body">
                    <p>

                        <label for="amount"></label>
                        <input type="text" id="amount" readonly style="border:0;font-weight:bold;">
                    </p>

                    <div id="slider-range"></div>
                </div>

            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Search by Brand</a>
                </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
                <div class="panel-body">

                       <input type="checkbox" name="company" value="Maruti_Suzuki"/><label>Maruti Suzuki</label> <br>
                       <input type="checkbox" name="company" value="Hyundai"/><label>Hyundai</label> <br>
                       <input type="checkbox" name="company" value="Honda"/><label> Honda</label> <br>
                       <input type="checkbox" name="company" value="Toyota"/><label> Toyota</label> <br>
                       <input type="checkbox" name="company" value="Tata"/><label> Tata</label> <br>
                       <input type="checkbox" name="company" value="Renault"/><label> Renault</label> <br>
                       <input type="checkbox" name="company" value="Ford"/><label> Ford</label> <br>

                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Search by Model Year</a>
                </h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>

                        <label for="year"></label>
                        <input type="text" id="year" readonly style="border:0;font-weight:bold;">
                    </p>

                    <div id="year-range"></div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Search by Fuel Type</a>
                </h4>
            </div>
            <div id="collapse4" class="panel-collapse collapse">
                <div class="panel-body">

                    <input type="checkbox" name="fuel" value="Petrol"/><label>Petrol</label><br>
                    <input type="checkbox" name="fuel" value="Diesel"/><label>Diesel</label><br>
                    <input type="checkbox" name="fuel" value="Cng"/><label>CNG</label><br>
                </div>
            </div>
        </div>


    </div>
    </form>
</div>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="Seller_Role">
    <div class="container">
        <div class="carsearch">
        <div class="option" id="addcars" ><span class="glyphicon glyphicon-plus"></span><g:link controller="home" action="addCars">Add Cars</g:link></div>
    </div>
    </div>
</sec:ifAnyGranted>


<div id="listingOfCars">
<g:render template="listingOfCars"/>

</div>
<div class="scrollup">
    <a href="#"></a>

</div>

<script type="text/javascript">
    $(document).ready(function(){
        $(window).scroll(function(){

            if ($(this).scrollTop() > 100) {

                $('.scrollup').fadeIn();

            } else {

                $('.scrollup').fadeOut();

            }

        });

        $('.scrollup').click(function(){

            $("html, body").animate({ scrollTop: 0 }, 600);

            return false;
        });
    });

</script>
<div style="border: none;position: relative;max-width: 100%; ">
    <g:render template="footer"/>
</div>
<script>

        var clicks = 0;
        var minimum=0;
        var maximum=0;
        var startYear=1980;
        var endYear=2017;
        var totalValue = "";
        var viewcount=0;
        var fueltype=""

        $( "#slider-range" ).slider({

            range: true,
            type:'GET',
            min: 0,
            max: 100,
            values: [ 0, 100 ],
            slide: function( event, ui ) {
                $( "#amount" ).val(  ui.values[ 0 ]+ "Lac - "   + ui.values[ 1 ] + " Lac" );
                minimum=ui.values[ 0 ];
                maximum=ui.values[ 1 ];
            },
            stop:function(){
                search(totalValue,fueltype);


            }
        });

        $( "#amount" ).val( "Lac " + $( "#slider-range" ).slider( "values", 0 ) +
                " - Lac " + $( "#slider-range" ).slider( "values", 1 ) );

        $( "#year-range" ).slider({

            range: true,
            type:'GET',
            min: 1980,
            max: 2017,
            values: [ 1980, 2017 ],
            slide: function( event, ui ) {
                $( "#year" ).val(  ui.values[ 0 ]+ " - "   + ui.values[ 1 ] + " " );
                startYear=ui.values[ 0 ];
                endYear=ui.values[ 1 ];
            },
            stop:function(){
                search(totalValue,fueltype);


            }
        });

        $( "#year" ).val(  $( "#year-range" ).slider( "values", 0 ) +
                " - " + $( "#year-range" ).slider( "values", 1 ) );



        $( "#form-brand input[name=company]" ).change(function() {
            var $input = $( this );
            totalValue = "";
            $( "#form-brand input:checked").each(function(){
                totalValue+=$(this).val()+",";
            })

            search(totalValue,fueltype)

        }).change();

        $("#form-brand input[name=fuel]").change(function(){

            var fuel=$(this);
            fueltype="";

            $( "#form-brand input[name=fuel]:checked").each(function(){
                fueltype+=$(this).val()+",";
            })

            search(totalValue,fueltype)
        }).change();


        function search(totalValue,fueltype){

           if(totalValue === 0){
               totalValue="";
           }

            $.ajax({
                type:'GET',
                url: "${createLink(controller: 'home', action:'listingOfCars')}",
                data: {min: minimum,max:maximum,company:totalValue,startYear:startYear,endYear:endYear,fuel:fueltype},
                success: function(result) {
                    $("#listingOfCars").html(result)


                },
                error: function(jqXHR, exception){
                   alert("error:"+exception);
                }

            });
        }

    $(document).ready(function(){

        $.ajax({

            type:'GET',
            url: "${createLink(controller: 'home', action:'countWishlist')}",

            success:function(result){
                clicks= Number(result);
                document.getElementById("clicks").innerHTML = clicks;
            },
            error:function(){

            }
        });


    });

    $(document).on('click', '.wishlist1', function() {

        var carId  = $(this).attr("data-car-id")
        var data={carId:carId}
        $.ajax({
            type:'GET',
            url: "${createLink(controller: 'home', action:'addToWishlist')}",
            data:data,
            success: function(responsedata){

                if(responsedata === "exists") {

                }
                else
                {
                    clicks += 1;

                    document.getElementById("clicks").innerHTML = clicks;

                }
            },
            error: function(){

            }

        });
    });

</script>




</body>
</html>