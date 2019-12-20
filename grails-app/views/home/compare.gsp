<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 12/4/17
  Time: 2:59 PM
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
</head>
<style>
    .table-responsive table{

        text-align: left;

    }
    .glyphicon-remove{

        color: red;
    }
    .well-sm{
        letter-spacing: 2px;
        color: black;
        font-weight: bolder;
    }

    .innertable{
        border: 1px solid black;
        height: 120px;
    }
</style>
<body>
<g:render template="images/header"/>

<div class="container">

    <h1>Car Comparison</h1>
    <g:if test="${carList}" >

        <div class="well well-sm" style="color: black;font-weight: bolder;"> General Specifications</div>
        <div class="table-responsive">
        <table border="0" width="100%">

            <tr>
              <td width="30%">
                  <table border="0" class="table table-condensed">
                      <tr>
                          <td height="110px">
                            Picture
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <strong><g:message code="commandObject.CarCommand.carTitle.label"></g:message></strong>
                          </td>
                      </tr>
                      <tr>
                          <td>
                             <strong> <g:message code="commandObject.CarCommand.carPrice.label"></g:message></strong>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <strong> <g:message code="commandObject.CarBasicsCommand.year.label"></g:message></strong>
                          </td>
                      </tr>

                  </table>
              </td>
                <g:each in="${carList}" var="car" status="i">
                        <td>
                            <table border="0" class="table table-condensed" >
                                <tr>
                                    <td>
                                        <img id="myImg${i}" height="100px" width="120px" src="${createLink(controller: 'home', action:'renderImage',params: [carNumber:car.carNumber])}"  alt="${car.carTitle}" onclick="">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ${car.carTitle.toUpperCase()}
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        ${car.carPrice}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ${car.getCarBasics().year}
                                    </td>
                                </tr>

                            </table>
                        </td>
                    </g:each>

            </tr>

        </table>
        </div>
        <div class="well well-sm" > Basic Details</div>
        <div class="table-responsive">
            <table border="0" width="100%">

                <tr>
                    <td width="30%">
                        <table border="0" class="table table-condensed">
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarCommand.carBrand.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarCommand.carType.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarBasicsCommand.distance.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarBasicsCommand.fuelType.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarBasicsCommand.city.label"></g:message></strong>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <g:each in="${carList}" var="car">
                        <td>

                            <table border="0" class="table table-condensed" >

                                <tr>

                                    <td>
                                        ${car.carCompany}

                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        ${car.carType}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ${car.getCarBasics().distance}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ${car.getCarBasics().city}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ${car.getCarBasics().fuel}
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </g:each>
                </tr>
            </table>
        </div>
        <div class="well well-sm" > Engine and Transmission</div>
        <div class="table-responsive">
            <table border="0" width="100%">

                <tr>
                    <td width="30%">
                        <table border="0" class="table table-condensed" >
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarEngineCommand.acceleration.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarEngineCommand.topSpeed.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarEngineCommand.engineDescription.label"></g:message></strong><br><br>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarEngineCommand.cylinders.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarEngineCommand.maxPower.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarEngineCommand.maxTorque.label"></g:message></strong>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <g:each in="${carList}" var="car">
                        <td>

                            <table border="0" class="table table-condensed" >

                                <tr>

                                    <td>
                                        ${car.getCarEngineTransmission().acceleration}<br>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        ${car.getCarEngineTransmission().topSpeed}<br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ${car.getCarEngineTransmission().engineDescription}<br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ${car.getCarEngineTransmission().cylinders}<br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ${car.getCarEngineTransmission().maxPower}<br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ${car.getCarEngineTransmission().maxTorque}<br>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </g:each>
                </tr>
            </table>
        </div>
        <div class="well well-sm" >Capacity Details</div>
        <div class="table-responsive">
            <table border="0" width="100%">

                <tr>
                    <td width="30%">
                        <table border="0" class="table table-condensed">
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarCapacity.wheelSize.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarCapacity.weight.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarCapacity.tyreType.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarCapacity.seatCapacity.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarCapacity.fuelCapacity.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarCapacity.height.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarCapacity.length.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarCapacity.width.label"></g:message></strong>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <g:each in="${carList}" var="car">
                        <td valign="top">

                            <table border="0" class="table table-condensed">

                                <tr>
                                    <td>
                                        <g:if test="${car.getCarCapacity().wheelSize.equals(null)}">
                                            -
                                        </g:if>
                                        <g:else>
                                            ${car.getCarCapacity().wheelSize}
                                        </g:else>

                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarCapacity().weight.equals(null)}">
                                          -
                                        </g:if>
                                        <g:else>
                                            ${car.getCarCapacity().weight}
                                        </g:else>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test=" ${car.getCarCapacity().tyreType.equals(null)}">
                                            -
                                        </g:if>
                                        <g:else>
                                            ${car.getCarCapacity().tyreType}
                                        </g:else>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarCapacity().seatCapacity.equals(null)}">
                                            -
                                        </g:if>
                                        <g:else>
                                            ${car.getCarCapacity().seatCapacity}
                                        </g:else>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test=" ${car.getCarCapacity().fuelCapacity.equals(null)}">
                                            -
                                        </g:if>
                                        <g:else>
                                            ${car.getCarCapacity().fuelCapacity}
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarCapacity().height.equals(null)}">
                                            -
                                        </g:if>
                                        <g:else>
                                            ${car.getCarCapacity().height}
                                        </g:else>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarCapacity().length.equals(null)}">
                                            -
                                        </g:if>
                                        <g:else>
                                            ${car.getCarCapacity().length}
                                        </g:else>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test=" ${car.getCarCapacity().width.equals(null)}">
                                            -
                                        </g:if>
                                        <g:else>
                                            ${car.getCarCapacity().width}
                                        </g:else>

                                    </td>
                                </tr>
                            </table>
                        </td>
                    </g:each>
                </tr>
            </table>
        </div>
        <div class="well well-sm" >Comfort Details</div>
        <div class="table-responsive">
            <table border="0" width="100%">

                <tr>
                    <td width="30%">
                        <table border="0" class="table table-condensed" >
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarComfort.transmissionType.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarComfort.powerButton.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarComfort.poweSteering.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarComfort.navigationSystem.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarComfort.ac.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarComfort.audioSystem.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarComfort.bluetooth.label"></g:message></strong>
                                </td>
                            </tr>

                        </table>
                    </td>
                    <g:each in="${carList}" var="car">
                        <td>
                            <table border="0" class="table table-condensed" style="height: 237px;">
                                <tr>
                                    <td>
                                        <g:if test=" ${car.getCarComfort().transmissionType}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarComfort().powerButton}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarComfort().poweSteering}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test=" ${car.getCarComfort().navigationSystem}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span  class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarComfort().ac}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarComfort().audioSystem}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarComfort().bluetooth}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span  class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </g:each>
                </tr>
            </table>
        </div>
        <div class="well well-sm" >Safety Details</div>
        <div class="table-responsive">
            <table border="0" width="100%">
                <tr>
                    <td width="30%">
                        <table border="0" class="table table-condensed">
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarSafety.powerDoorLocks.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarSafety.rearCameras.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarSafety.antiTheftAlarm.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarSafety.crashSensor.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarSafety.airBags.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarSafety.antiLockBreaking.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarSafety.centralLocking.label"></g:message></strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><g:message code="commandObject.CarSafety.parkingSensor.label"></g:message></strong>
                                </td>
                            </tr>

                        </table>
                    </td>
                    <g:each in="${carList}" var="car">
                        <td>

                            <table border="0" class="table table-condensed" style="height: 270px;">
                                <tr>
                                    <td>

                                        <g:if test=" ${car.getCarSafety().powerDoorLocks}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarSafety().rearCameras}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarSafety().antiTheftAlarm}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test=" ${car.getCarSafety().crashSensor}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span  class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarSafety().airBags}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarSafety().antiLockBreaking}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarSafety().centralLocking}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span  class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <g:if test="${car.getCarSafety().parkingSensor}">
                                            <span class="glyphicon glyphicon-ok"></span>
                                        </g:if>
                                        <g:else>
                                            <span  class="glyphicon glyphicon-remove"></span>
                                        </g:else>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </g:each>
                </tr>
            </table>
        </div>
    </g:if>
    <g:else>

    </g:else>
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
</div>
<g:render template="footer"></g:render>
</body>
</html>