<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 9/3/17
  Time: 2:45 PM
--%>

<%@ page import="enums.States; enums.FuelType" contentType="text/html;charset=UTF-8" %>
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
    <asset:javascript src="jquery.min"/>
    <asset:stylesheet href="sellerstyle"/>

    <style>
    .panel-body table{
        width: 700px;
    }
    .panel-body td{
        width: 200px;
    }
</style>

</head>

<body>
<g:render template="images/header"></g:render>
<div class="container">
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <g:if test="${flash.message}">
                    <style>
                        input[type="text"]{
                            box-shadow: 0px 1px 3px 1px rgba(255, 22, 4, 0.65);
                                                    }
                    </style>
                </g:if>
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Basic Details</a>
                </div>
                <div id="collapse1" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <g:uploadForm controller="home" action="additionalDetails">
                            <table align="center" border="0">
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCommand.carTitle.label" /></label>
                                    </td>
                                    <td>
                                        <input type="text" name="carTitle" value="${car.carTitle}"/>
                                        <input type="hidden" name="carId" value="${params.id}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCommand.carNumber.label" /></label>
                                    </td>
                                    <td>
                                        <input type="text" name="carNumber" value="${car.carNumber}"/><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCommand.carPrice.label" /></label>
                                    </td>
                                    <td>
                                        <input type="text" name="carPrice" value="${car.carPrice}" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCommand.carBrand.label"/></label>
                                    </td>
                                    <td>
                                        <g:select name="carCompany" style="margin-left: 100px; width: 210px;" from="${commandObject.CarCompany?.values()}" keys="${commandObject.CarCompany.values()*.name()}" required="" value="${fieldValue(bean: carCompany, field: 'carCompany')}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCommand.carType.label"/></label>
                                    </td>
                                    <td>
                                        <select style="margin-left: 100px;width: 210px;" name="carType">
                                            <option>Hatchbacks</option>
                                            <option>SUVs</option>
                                            <option>Sedan</option>
                                            <option>Mini-SUVs</option>
                                            <option>Luxury</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCommand.carImage.label"/></label>
                                    </td>
                                    <td>
                                        <input type="file" name="carImage"  multiple />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <input type="submit" id="submit1" name="submit" value="Submit" />
                                    </td>
                                </tr>
                            </table>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">General Specifications</a>
                </div>
                <div id="collapse2" class="panel-collapse collapse">
                    <div class="panel-body">
                        <g:uploadForm >
                            <table align="center" border="0">
                             <tr>
                                 <td>
                                   <label> <g:message code="commandObject.CarBasicsCommand.city.label"/></label>
                                 </td>
                                 <td>
                                     <g:select name="city" style="margin-left: 100px;width: 210px;" from="${enums.States?.values()}" keys="${enums.States.values()*.name()}" required="" value="${fieldValue(bean: city, field: 'city')}"/>
                                 </td>
                             </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarBasicsCommand.distance.label"/></label>
                                    </td>
                                    <td>
                                        <input type="text" name="distance" value="${car.distance}" />
                                        <input type="hidden" name="carId" value="${car.id}"/>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label> <g:message code="commandObject.CarBasicsCommand.fuelType.label"/></label>
                                    </td>
                                    <td>
                                        <g:select name="fuel" style="margin-left: 100px;width: 210px;" from="${enums.FuelType?.values()}" keys="${enums.FuelType.values()*.name()}" required="" value="${fieldValue(bean: fuel, field: 'fuel')}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label> <g:message code="commandObject.CarBasicsCommand.year.label"/></label>
                                    </td>
                                    <td>
                                      <span style="margin-left: 70px; width:20px;"><g:datePicker id="year" name="year" precision="year" value="${year}" years="${2017..1980}" /></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <input type="button" name="submit" value="Submit" id="submit2" />
                                    </td>
                                </tr>
                            </table>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Engine and Transmission Details</a>
                </div>
                <div id="collapse3" class="panel-collapse collapse">
                    <div class="panel-body">
                        <g:uploadForm>
                            <table align="center">
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarEngineCommand.topSpeed.label"/></label>
                                    </td>
                                    <td>
                                        <input type="text" name="topSpeed" value="${car.topSpeed}"/>
                                        <g:hasErrors bean="${car}" field="car">
                                            <div class="errors">
                                               %{--<i style="color:red;">  <g:renderErrors bean="${car}" field="car" as="list" /></i>--}%
                                            </div>
                                        </g:hasErrors>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarEngineCommand.acceleration.label"/></label>
                                    </td>
                                    <td>
                                        <input type="text" name="acceleration" value="${car.acceleration}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarEngineCommand.engineDescription.label"/></label>
                                    </td>
                                    <td>
                                        <input type="text" name="engineDescription" value="${car.engineDescription}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarEngineCommand.cylinders.label"/></label>
                                    </td>
                                    <td>
                                        <input type="text" name="cylinders" value="${car.cylinders}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarEngineCommand.maxPower.label"/></label>
                                    </td>
                                    <td>
                                        <input type="text" name="maxPower" value="${car.maxPower}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarEngineCommand.maxTorque.label"/></label>
                                    </td>
                                    <td>
                                        <input type="text" name="maxTorque" value="${car.maxTorque}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <input type="hidden" name="engineDetails" value="engineDetails"/>
                                        <input type="hidden" name="carId" value="${car.id}"/>
                                        <input type="button" name="submit" value="Submit" id="submit3"/>
                                    </td>
                                </tr>
                            </table>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Capacity Details</a>
                </div>
                <div id="collapse4" class="panel-collapse collapse">
                    <div class="panel-body">
                        <g:uploadForm>
                            <table align="center">
                                <tr>
                                <td>
                                    <label><g:message code="commandObject.CarCapacity.fuelCapacity.label"/></label>
                                </td>
                                    <td>
                                        <input type="text" name="fuelCapacity" value="${car.fuelCapacity}"/>
                                        <g:hasErrors bean="${car}" field="car">
                                            <div class="errors">
                                                %{--<i style="color:red;">  <g:renderErrors bean="${car}" field="car" as="list" /></i>--}%
                                            </div>
                                        </g:hasErrors>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCapacity.height.label"/></label>
                                    </td>
                                    <td>

                                        <input type="text" name="height" value="${car.height}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCapacity.length.label"/></label>
                                    </td>
                                    <td>

                                        <input type="text" name="length" value="${car.length}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCapacity.seatCapacity.label"/></label>
                                    </td>
                                    <td>

                                        <input type="text" name="seatCapacity" value="${car.seatCapacity}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCapacity.tyreType.label"/></label>
                                    </td>
                                    <td>

                                        <input type="text" name="tyreType" value="${car.tyreType}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCapacity.weight.label"/></label>
                                    </td>
                                    <td>

                                        <input type="text" name="weight" value="${car.weight}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCapacity.wheelSize.label"/></label>
                                    </td>
                                    <td>

                                        <input type="text" name="wheelSize" value="${car.wheelSize}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarCapacity.width.label"/></label>
                                    </td>
                                    <td>

                                        <input type="text" name="width" value="${car.width}"/>
                                    </td>
                                </tr>
                                <tr>

                                    <td>

                                    </td>
                                    <td>
                                        <input type="hidden" name="capacityDetails" value="capacityDetails"/>
                                        <input type="hidden" name="carId" value="${car.id}"/>
                                        <input type="button" name="submit" value="Submit" id="submit4"/>
                                    </td>

                                </tr>

                            </table>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">

                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Comfort Details</a>

                </div>
                <div id="collapse5" class="panel-collapse collapse">
                    <div class="panel-body">
                        <g:uploadForm >
                            <table align="center">
                                <tr>
                                    <td>
                                       <label><g:message code="commandObject.CarComfort.ac.label" /></label>
                                    </td>
                                    <td>
                                        <input type="radio" name="ac" value="false"/>No
                                        <input type="radio" name="ac" value="true"/>Yes
                                        <g:hasErrors bean="${car}" field="car">
                                            <div class="errors">
                                                %{--<i style="color:red;">  <g:renderErrors bean="${car}" field="car" as="list" /></i>--}%
                                            </div>
                                        </g:hasErrors>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarComfort.audioSystem.label" /></label>
                                    </td>
                                    <td>
                                        <input type="radio" name="audioSystem" value="false"/>No
                                        <input type="radio" name="audioSystem" value="true"/>Yes
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarComfort.bluetooth.label" /></label>
                                    </td>
                                    <td>
                                        <input type="radio" name="bluetooth" value="false"/>No
                                        <input type="radio" name="bluetooth" value="true"/>Yes
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarComfort.navigationSystem.label" /></label>
                                    </td>
                                    <td>
                                        <input type="radio" name="navigationSystem" value="false"/>No
                                        <input type="radio" name="navigationSystem" value="true"/>Yes
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarComfort.poweSteering.label" /></label>
                                    </td>
                                    <td>
                                        <input type="radio" name="poweSteering" value="false"/>No
                                        <input type="radio" name="poweSteering" value="true"/>Yes
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarComfort.powerButton.label" /></label>
                                    </td>
                                    <td>
                                        <input type="radio" name="powerButton" value="false"/>No
                                        <input type="radio" name="powerButton" value="true"/>Yes
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label><g:message code="commandObject.CarComfort.transmissionType.label" /></label>
                                    </td>
                                    <td>
                                        <input type="text" name="transmissionType"/>
                                    </td>
                                </tr>
                                <tr>

                                    <td>

                                    </td>
                                    <td>
                                        <input type="hidden" name="comfortDetails" value="comfortDetails"/>
                                        <input type="hidden" name="carId" value="${car.id}"/>
                                        <input type="button" name="submit" value="Submit" id="submit5"/>
                                    </td>

                                </tr>


                            </table>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
            %{--added code--}%
            <div class="panel panel-default">
    <div class="panel-heading">

        <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Safety Details</a>

    </div>
    <div id="collapse6" class="panel-collapse collapse">
        <div class="panel-body">
            <g:uploadForm>
                <table align="center">
                    <tr>
                        <td>
                          <label><g:message code="commandObject.CarSafety.antiLockBreaking.label"/></label>
                        </td>
                        <td>
                            <input type="radio" name="antiLockBreaking" value="1"/>No
                            <input type="radio" name="antiLockBreaking" value="0"/>Yes

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><g:message code="commandObject.CarSafety.parkingSensor.label"/></label>
                        </td>
                        <td>
                            <input type="radio" name="parkingSensor" value="1"/>No
                            <input type="radio" name="parkingSensor" value="0"/>Yes
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><g:message code="commandObject.CarSafety.centralLocking.label"/></label>
                        </td>
                        <td>
                            <input type="radio" name="centralLocking" value="1"/>No
                            <input type="radio" name="centralLocking" value="0"/>Yes
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><g:message code="commandObject.CarSafety.airBags.label"/></label>
                        </td>
                        <td>
                            <input type="radio" name="airBags" value="1"/>No
                            <input type="radio" name="airBags" value="0"/>Yes
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><g:message code="commandObject.CarSafety.crashSensor.label"/></label>
                        </td>
                        <td>
                            <input type="radio" name="crashSensor" value="1"/>No
                            <input type="radio" name="crashSensor" value="0"/>Yes
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><g:message code="commandObject.CarSafety.antiTheftAlarm.label"/></label>
                        </td>
                        <td>
                            <input type="radio" name="antiTheftAlarm" value="1"/>No
                            <input type="radio" name="antiTheftAlarm" value="0"/>Yes
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><g:message code="commandObject.CarSafety.powerDoorLocks.label"/></label>
                        </td>
                        <td>
                            <input type="radio" name="powerDoorLocks" value="1"/>No
                            <input type="radio" name="powerDoorLocks" value="0"/>Yes
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><g:message code="commandObject.CarSafety.rearCameras.label"/></label>
                        </td>
                        <td>
                            <input type="radio" name="rearCameras" value="1"/>No
                            <input type="radio" name="rearCameras" value="0"/>Yes

                        </td>
                    </tr>
                    <tr>

                        <td>

                        </td>
                        <td>
                            <input type="hidden" name="safetyDetails" value="safetyDetails"/>
                            <input type="hidden" name="carId" value="${car.id}"/>
                            <input type="button" name="submit" value="Submit" id="submit6"/>
                        </td>

                    </tr>


                </table>
            </g:uploadForm>
        </div>
    </div>
</div>
        </div>
    %{--</div>--}%

</div>

<script>

    $(document).ready(function(){
        $('#submit2').on('click',function(e) {

            var company=document.getElementsByName("carCompany")[0].value;
            var carid=document.getElementsByName("carId")[1].value;
            var distance=document.getElementsByName("distance")[0].value;
            var city=document.getElementsByName("city")[0].value;
            var year = document.getElementsByName("year_year")[0].value;
            var fuel=document.getElementsByName("fuel")[0].value;
            var data={carId:carid,year:year,distance:distance,city:city,fuel:fuel};

            $.ajax({
                type:'GET',
                url: "${createLink(controller: 'home', action:'addGeneralSpecifications')}",
                data: data,
                success: function(result){
                    alert("General Specifications have been inserted")
                },
                error: function(jqXHR, exception){
                    alert("error:"+exception);


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
        return false;

    })
    $(document).ready(function(){
        $('#submit3').on('click',function(e) {

                var topSpeed=document.getElementsByName("topSpeed")[0].value;
                var acceleration=document.getElementsByName("acceleration")[0].value;
                var engineDescription=document.getElementsByName("engineDescription")[0].value;
                var cylinders=document.getElementsByName("cylinders")[0].value;
                var maxPower=document.getElementsByName("maxPower")[0].value;
                var maxTorque=document.getElementsByName("maxTorque")[0].value;
                var carid=document.getElementsByName("carId")[2].value;

                var data={topSpeed:topSpeed,
                            acceleration:acceleration,
                            engineDescription:engineDescription,
                            cylinders:cylinders,
                            maxPower:maxPower,
                            maxTorque:maxTorque,
                            carId:carid}
            $.ajax({
                type:'GET',
                url: "${createLink(controller: 'home', action:'addEngineDetails')}",
                data: data,
                success: function(result){
                    alert("Engine and transmission details have been inserted")
                },
                error: function(jqXHR, exception){
                    alert("error:"+exception);


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
        return false;

    })
    $(document).ready(function(){
        $('#submit4').on('click',function(e) {

            var carid=document.getElementsByName("carId")[3].value;

            var fuelCapacity=document.getElementsByName("fuelCapacity")[0].value;
            var length=document.getElementsByName("length")[0].value;
            var width=document.getElementsByName("width")[0].value;
            var height=document.getElementsByName("height")[0].value;
            var weight=document.getElementsByName("weight")[0].value;
            var seatCapacity=document.getElementsByName("seatCapacity")[0].value;
            var tyreType=document.getElementsByName("tyreType")[0].value;
            var wheelSize=document.getElementsByName("wheelSize")[0].value;
            var data={ carId:carid,
                        fuelCapacity:fuelCapacity,
                        length:length,
                        width:width,
                        height:height,
                        weight:weight,
                        seatCapacity:seatCapacity,
                        tyreType:tyreType,
                        wheelSize:wheelSize
                }

            $.ajax({
                type:'GET',
                url: "${createLink(controller: 'home', action:'addCapacityDetails')}",
                data: data,
                success: function(result){
                    alert("Capcity details have been inserted")
                },
                error: function(jqXHR, exception){
                    alert("error:"+exception);


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
        return false;

    })
    $(document).ready(function(){
        $('#submit5').on('click',function(e) {

            var carid=document.getElementsByName("carId")[4].value;
            var ac=document.getElementsByName("ac")[0].value;
            var poweSteering=document.getElementsByName("poweSteering")[0].value;
            var powerButton=document.getElementsByName("powerButton")[0].value;
            var transmissionType=document.getElementsByName("transmissionType")[0].value;
            var navigationSystem=document.getElementsByName("navigationSystem")[0].value;
            var audioSystem=document.getElementsByName("audioSystem")[0].value;
            var bluetooth=document.getElementsByName("bluetooth")[0].value;
            var data={ carId:carid,
                        ac:ac,
                        poweSteering:poweSteering,
                        powerButton:powerButton,
                        transmissionType:transmissionType,
                        navigationSystem:navigationSystem,
                        audioSystem:audioSystem,
                        bluetooth:bluetooth  };

            $.ajax({
                type:'GET',
                url: "${createLink(controller: 'home', action:'addComfortDetails')}",
                data: data,
                success: function(result){
                    alert("Capcity details have been inserted")
                },
                error: function(jqXHR, exception){
                    alert("error:"+exception);


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
        return false;

    })
    $(document).ready(function(){
        $('#submit6').on('click',function(e) {

            var carid=document.getElementsByName("carId")[5].value;
            var antiLockBreaking=document.getElementsByName("antiLockBreaking")[0].value;
            var parkingSensor=document.getElementsByName("parkingSensor")[0].value;
            var centralLocking=document.getElementsByName("centralLocking")[0].value;
            var airBags=document.getElementsByName("airBags")[0].value;
            var crashSensor=document.getElementsByName("crashSensor")[0].value;
            var antiTheftAlarm=document.getElementsByName("antiTheftAlarm")[0].value;
            var powerDoorLocks=document.getElementsByName("powerDoorLocks")[0].value;
            var rearCameras=document.getElementsByName("rearCameras")[0].value;

            var data={ carId:carid,
                antiLockBreaking:antiLockBreaking,
                parkingSensor:parkingSensor,
                centralLocking:centralLocking,
                airBags:airBags,
                crashSensor:crashSensor,
                antiTheftAlarm:antiTheftAlarm,
                powerDoorLocks:powerDoorLocks,
                rearCameras:rearCameras };

            $.ajax({
                type:'GET',
                url: "${createLink(controller: 'home', action:'addSafetyDetails')}",
                data: data,
                success: function(result){
                    alert("Safety details have been inserted")
                },
                error: function(jqXHR, exception){
                    alert("error:"+exception);


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
        return false;

    })

</script>
</body>


</html>