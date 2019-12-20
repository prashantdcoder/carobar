<div class="container" style="margin-top: 50px;">
<sec:ifAnyGranted roles="Buyer_ROLE">
    <g:if test="${carList}">
<g:each in="${carList}" var="car"  status="i">
    <g:if test="${car.soldOut.equals(true)}">
        <style>
        .carCatalogSoldItmes {
            background-color: white;
            display: block;
            width: 65%;
            height: auto;
            position: relative;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            background-color:transparent;
            overflow: hidden;
            width: 100%;
            height: 0;
            transition: 1s ease;
            z-index:1;
            opacity: 1;
            background-position: top right;

        }

        .carCatalogSoldItmes .overlay {
            height: 100%;
            cursor: pointer;
            background-image: url("../images/sold.jpg");
            background-size: 50px 50px;
            background-repeat: no-repeat;
            background-position:top right;
        }
        .carCatalogSoldItmes:hover{

        }

        .text {
            filter:blur(0px);
            white-space: nowrap;
            color: black;
            font-size: 20px;
            position: absolute;
            overflow: hidden;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
        }
        </style>
        <div class="carCatalogSoldItmes">
            <div class="overlay">
                <div class="text"></div>
            </div>

            <img id="myImg${i}" src="${createLink(controller: 'home', action:'renderImage',params: [carNumber:car.carNumber])}"  alt="${carTitle}" onclick="">
            <div class="info">
                <g:link controller="home" action="viewCar" params="[carNumber:car.carNumber]" style="text-decoration: none" ><h2>${car.carCompany} ${car.carTitle}</h2></g:link><br>
                <g:link controller="home" action="viewCar" params="[carNumber:car.carNumber]" style="text-decoration: none;"><h3 style="letter-spacing:1px;">&#x20B9;${car.carPrice}</h3></g:link>
                <ul>

                    <li>${car.carBasics.year}</li>
                    <li>${car.carBasics.distance}Km</li>
                    <li>${car.carBasics.fuel}</li>

                </ul>

            </div>

            <button  data-car-id = "${car.id}" class="btn btn-danger my-cart-btn wishlist1" data-id="1" data-name="product 1" data-summary="summary 1" data-price="10" data-quantity="1" data-image="grails-app/assets/images/img_1.png"><span class="glyphicon glyphicon-shopping-cart"></span>Add to Wishlist</button>
            <input type="hidden" name="carId" value="${car.id}" />
            <div class="compare">
                <g:form class="comparecars" controller="home" action="compareCar">
                    <input type="checkbox" name="compare" value="${car.id}"/>
                    <input type="hidden" name="id" value=""/>
                    <input class="compareButton" id="btn" type="submit" name="submit" value="Compare" />
                    <span class="glyphicon glyphicon-eye-open"><span id="car-count-${car.id}">

                        <script type="text/javascript">

                            var data=null;
                            data=${car.id};

                            $.ajax({

                                type:'GET',
                                data:{carId:data},
                                url: "${createLink(controller: 'home', action:'viewCount')}",

                                success:function(responseData){

                                    var viewcount= Number(responseData.count);
                                    document.getElementById("car-count-"+responseData.carId).innerHTML = viewcount;
                                },
                                error:function(){


                                }
                            });


                        </script>
                    </span> </span>
                </g:form>
            </div>
        </div>
    </g:if>
    <g:else>
        <div class="carCatalog" style="height: auto;">

            <img id="myImg${i}" src="${createLink(controller: 'home', action:'renderImage',params: [carNumber:car.carNumber])}"  alt="${carTitle}" onclick="">
            <div class="info">
                <g:link controller="home" action="viewCar" params="[carNumber:car.carNumber]" style="text-decoration: none" ><h2>${car.carCompany} ${car.carTitle}</h2></g:link><br>
                <g:link controller="home" action="viewCar" params="[carNumber:car.carNumber]" style="text-decoration: none;"><h3 style="letter-spacing:1px;">&#x20B9;${car.carPrice}</h3></g:link>
                <ul>
                    <li>${car.carBasics.year}</li>
                    <li>${car.carBasics.distance}Km</li>
                    <li>${car.carBasics.fuel}</li>
                </ul>

            </div>
            <button  data-car-id = "${car.id}" class="btn btn-danger my-cart-btn wishlist1" data-id="1" data-name="product 1" data-summary="summary 1" data-price="10" data-quantity="1" data-image="grails-app/assets/images/img_1.png"><span class="glyphicon glyphicon-shopping-cart"></span>Add to Wishlist</button>
            <input type="hidden" name="carId" value="${car.id}" />
            <div class="compare">
                <g:form class="comparecars" controller="home" action="compareCar">
                    <input type="checkbox" name="compare" value="${car.id}"/>
                    <input type="hidden" name="id" value=""/>
                    <input class="compareButton" id="btn" type="submit" name="submit" value="Compare" />
                    <span class="glyphicon glyphicon-eye-open"><span id="car-count-${car.id}">

                        <script type="text/javascript">

                            var data=null;
                            data=${car.id};

                            $.ajax({

                                type:'GET',
                                data:{carId:data},
                                url: "${createLink(controller: 'home', action:'viewCount')}",

                                success:function(responseData){

                                    var viewcount= Number(responseData.count);
                                    document.getElementById("car-count-"+responseData.carId).innerHTML = viewcount;
                                },
                                error:function(){


                                }
                            });


                        </script>
                    </span> </span>
                </g:form>

            </div>
        </div>
    </g:else>
</g:each>
    </g:if>
    <g:else>
        <div class="carCatalog" style="box-shadow: none;padding: 50px;">
            <h2>We couldn't find your matches</h2>
            <h5>Try modifying your search for more options.</h5>
        </div>
    </g:else>
<script>
    var totalValue= 0;
    var count=0;

    $('.compareButton').attr('disabled','disabled');
    $( ".comparecars input" ).change(function() {
        totalValue = "";

        $( ".comparecars input:checked").each(function(){

          if(this.checked){
              count++;

          }
            if(count<=3){
                totalValue+=$(this).val()+",";
                if(count>=2) {
                    $('.compareButton').removeAttr('disabled');
                }
                else{
                    $('.compareButton').attr('disabled','disabled');
                }
            }
            else{
                alert("Maximum 3 cars can be selected");

            }
        })
        count=0;


    }).change();


    $( ".compareButton" ).click(function() {

        $("input:hidden").val(totalValue);
    });
</script>
</sec:ifAnyGranted>
    <sec:ifAnyGranted roles="Seller_Role">

        <g:each in="${sellercar}" var="car"  status="i">


            <div class="carCatalog">

                <img id="myImg${i}" src="${createLink(controller: 'home', action:'renderImage',params: [carNumber:car.carNumber])}"  alt="${carTitle}" onclick="">
                <div class="info">
                    <g:link controller="home" action="viewCar" params="[carNumber:car.carNumber]" style="text-decoration: none" ><h2>${car.carCompany} ${car.carTitle}</h2></g:link><br>
                    <g:link controller="home" action="viewCar" params="[carNumber:car.carNumber]" style="text-decoration: none;"><h3 style="letter-spacing:1px;">&#x20B9;${car.carPrice}</h3></g:link>

                    <span class="glyphicon glyphicon-pencil"></span><g:link controller="home" action="editOtherDetails" params="[id: car.id]">Edit</g:link>
                    <span class="glyphicon delete"></span><span class="glyphicon glyphicon-trash"></span><g:link controller="home" action="deleteOtherDetails" params="[id: car.id]" >Delete</g:link>

                </div>


                <a href="#" class="btn btn-info btn-lg" style="float: right;">
                    Add To Wishlist
                </a>


            </div>

        </g:each>

    </sec:ifAnyGranted>
</div>

