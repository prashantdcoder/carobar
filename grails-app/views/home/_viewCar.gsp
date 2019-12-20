<div class="container">
    <div id="sample-1" class="ma5slider outside-navs outside-dots anim-horizontal loop-mode">
        <div class="slides" style="position: relative;">

            <g:each in="${imageArray}" var="image">
                <img id="myImg" src="${image}" />
            </g:each>
        </div>
    </div>
<div>
    <div class="well well-sm" style="color: black;font-weight: bolder;"> ${grailsApplication.config.keyspecifications}  ${car.carTitle}</div>
    <div class="table">
        <table class="table table-condensed">
            <tbody>
            <tr>
                <td><g:message code="commandObject.CarCommand.carPrice.label"></g:message>  </td>
                <td> <strong> ${car.carPrice}</strong> </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarBasicsCommand.fuelType.label"></g:message> </td>
                <td>  <strong> ${carBasics.fuel}</strong> </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarEngineCommand.topSpeed.label"></g:message> </td>
                <td> <strong> ${carEngineTransmission.topSpeed}</strong></td>
            </tr>

            </tbody>
        </table>
    </div>
</div>
    <div class="well well-sm" style="color: black;font-weight: bolder;"> General Specifications</div>
    <div class="table">
        <table class="table table-condensed">
            <tbody>
            <tr>
                <td><g:message code="commandObject.CarBasicsCommand.year.label"></g:message> </td>
                <td> <strong> ${carBasics.year}</strong> </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarBasicsCommand.distance.label"></g:message> </td>
                <td>  <strong> ${carBasics.distance}</strong> </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarBasicsCommand.fuelType.label"></g:message> </td>
                <td> <strong> ${carBasics.fuel}</strong></td>
            </tr>

            <tr>
                <td><g:message code="commandObject.CarBasicsCommand.city.label"></g:message> </td>
                <td> <strong> ${carBasics.city}</strong></td>
            </tr>

            </tbody>
        </table>
    </div>
    <div class="well well-sm" style="color: black;font-weight: bolder;">Engine Specifications</div>
    <div class="table">
        <table class="table table-condensed">
            <tbody>
            <tr>
                <td><g:message code="commandObject.CarEngineCommand.topSpeed.label"></g:message></td>
                <td> <strong> ${carEngineTransmission.topSpeed}</strong> </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarEngineCommand.acceleration.label"></g:message></td>
                <td>  <strong> ${carEngineTransmission.acceleration}</strong> </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarEngineCommand.maxPower.label"></g:message></td>
                <td> <strong> ${carEngineTransmission.maxPower}</strong></td>
            </tr>

            <tr>
                <td><g:message code="commandObject.CarEngineCommand.maxTorque.label"></g:message></td>
                <td> <strong> ${carEngineTransmission.maxTorque}</strong></td>
            </tr>

            <tr>
                <td><g:message code="commandObject.CarEngineCommand.engineDescription.label"></g:message> </td>
                <td> <strong> ${carEngineTransmission.engineDescription}</strong></td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarEngineCommand.cylinders.label"></g:message> </td>
                <td> <strong> ${carEngineTransmission.cylinders}</strong></td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="well well-sm" style="color: black;font-weight: bolder;">Capacity</div>
    <div class="table">
        <table class="table table-condensed">
            <tbody>
            <tr>
                <td><g:message code="commandObject.CarCapacity.length.label"></g:message> </td>
                <td> <strong> ${carCapacity.length}</strong> </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarCapacity.width.label"></g:message> </td>
                <td>  <strong> ${carCapacity.width}</strong> </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarCapacity.height.label"></g:message> </td>
                <td> <strong> ${carCapacity.height}</strong></td>
            </tr>

            <tr>
                <td><g:message code="commandObject.CarCapacity.weight.label"></g:message> </td>
                <td> <strong> ${carCapacity.weight}</strong></td>
            </tr>

            <tr>
                <td><g:message code="commandObject.CarCapacity.seatCapacity.label"></g:message> </td>
                <td> <strong> ${carCapacity.seatCapacity}</strong></td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarCapacity.fuelCapacity.label"></g:message> </td>
                <td> <strong> ${carCapacity.fuelCapacity}</strong></td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarCapacity.tyreType.label"></g:message> </td>
                <td> <strong> ${carCapacity.tyreType}</strong></td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarCapacity.wheelSize.label"></g:message> </td>
                <td> <strong> ${carCapacity.wheelSize}</strong></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="well well-sm" style="color: black;font-weight: bolder;">Comfort</div>
    <div class="table">
        <table class="table table-condensed">
            <tbody>
            <tr>
                <td><g:message code="commandObject.CarComfort.ac.label"></g:message> </td>
                <td> <strong>
                   <g:if test="${carComfort.ac}">
                       <span class="glyphicon glyphicon-ok"></span>
                    </g:if>
                    <g:else>
                        <span style="color: red;" class="glyphicon glyphicon-remove"></span>
                    </g:else>
                </strong>
                </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarComfort.poweSteering.label"></g:message> </td>
                <td><strong>
                    <g:if test="${carComfort.poweSteering}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>
                    <g:else>
                        <span style="color: red;" class="glyphicon glyphicon-remove"></span>
                    </g:else>
                </strong> </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarComfort.powerButton.label"></g:message> </td>
                <td><strong>
                    <g:if test=" ${carComfort.powerButton}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>

                </strong>
                </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarComfort.transmissionType.label"></g:message> </td>
                <td><strong>
                    ${carComfort.transmissionType}
                </strong>
                </td>
            </tr>

            <tr>
                <td><g:message code="commandObject.CarComfort.navigationSystem.label"></g:message> </td>
                <td> <strong>
                <g:if test=" ${carComfort.navigationSystem}">
                    <span class="glyphicon glyphicon-ok"></span>
                </g:if>

                </strong></td>
            </tr>

            <tr>
                <td><g:message code="commandObject.CarComfort.audioSystem.label"></g:message> </td>
                <td> <strong>
                    <g:if test=" ${carComfort.audioSystem}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>

                </strong>
                </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarComfort.bluetooth.label"></g:message> </td>
                <td> <strong>
                    <g:if test="  ${carComfort.bluetooth}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>

                </strong>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="well well-sm" style="color: black;font-weight: bolder;">Safety</div>
    <div class="table">
        <table class="table table-condensed">
            <tbody>
            <tr>
                <td><g:message code="commandObject.CarSafety.antiLockBreaking.label"></g:message> </td>
                <td> <strong>
                    <g:if test="${carSafety.antiLockBreaking}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if></strong>
                </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarSafety.parkingSensor.label"></g:message> </td>
                <td><strong>
                    <g:if test="${carSafety.parkingSensor}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>
                </strong> </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarSafety.centralLocking.label"></g:message> </td>
                <td><strong>
                    <g:if test=" ${carSafety.centralLocking}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>

                </strong>
                </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarSafety.airBags.label"></g:message> </td>
                <td><strong>
                    <g:if test="${carSafety.airBags}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>

                </strong>
                </td>
            </tr>

            <tr>
                <td><g:message code="commandObject.CarSafety.crashSensor.label"></g:message> </td>
                <td> <strong>
                    <g:if test=" ${carSafety.crashSensor}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>

                </strong></td>
            </tr>

            <tr>
                <td><g:message code="commandObject.CarSafety.antiTheftAlarm.label"></g:message></td>
                <td> <strong>
                    <g:if test="${carSafety.antiTheftAlarm}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>

                </strong>
                </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarSafety.powerDoorLocks.label"></g:message></td>
                <td> <strong>
                    <g:if test="${carSafety.powerDoorLocks}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>

                </strong>
                </td>
            </tr>
            <tr>
                <td><g:message code="commandObject.CarSafety.rearCameras.label"></g:message></td>
                <td> <strong>

                    <g:if test="${carSafety.rearCameras}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </g:if>

                </strong>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="contact-to-seller">

            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-envelope"></span> Contact Seller</button>

            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" >
                            <h4 class="modal-title" style="font-size: 20px;">Your message </h4>
                        </div>
                        <div class="modal-body">
                            <p>
                                <g:form controller="home" action="message">
                                    <textarea name="message" rows="5" cols="40"></textarea><br>
                                    <input type="hidden" name="sender" value="${carBasics.getCar().getUser().username}" >
                                    <input type="hidden" name="carnumber" value="${carBasics.getCar().carNumber}">
                                    <input type="submit" name="submit" value="Send" style="width: 100px;"/>
                                </g:form>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        </div>
</div>
