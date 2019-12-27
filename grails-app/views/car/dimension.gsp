<%--
  Created by IntelliJ IDEA.
  User: Prashant
  Date: 12/27/2019
  Time: 2:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Car-O-Bar | Add Capacity</title>
</head>

<body>
<div class="steps_banner">
    <h1>Capacity</h1>
</div>

<div class="car_main_div">
    <g:form controller="car" action="dimension" method="get">
        <div class="register_wrap">
            <g:if test='${savingError}'>
                <div class='alert alert-danger email_link_alert'>${savingError}</div>
            </g:if>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="length">Length(mm)<span class="text_color_red">*</span></label>
                <g:textField class="form-control" name="length" value="${dimensionCO?.length}"/>
                <span><g:fieldError bean="${dimensionCO}" field="length"/></span>
            </div>

            <div class="register_element_wrap">
                <label for="width">Width(mm)<span class="text_color_red">*</span></label>
                <g:textField class="form-control" name="width" value="${dimensionCO?.width}"/>
                <span><g:fieldError bean="${dimensionCO}" field="width"/></span>
            </div>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="height">Height(mm)<span class="text_color_red">*</span></label>
                <g:textField class="form-control" name="height" value="${dimensionCO?.height}"/>
                <span><g:fieldError bean="${dimensionCO}" field="height"/></span>
            </div>

            <div class="register_element_wrap">
                <label for="weight">Weight(kg)<span class="text_color_red">*</span></label>
                <g:textField class="form-control" name="weight" value="${dimensionCO?.weight}"/>
                <span><g:fieldError bean="${dimensionCO}" field="weight"/></span>
            </div>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="seatCapacity">Seat Capacity</label>
                <g:textField class="form-control" name="seatCapacity" value="${dimensionCO?.seatCapacity}"/>
            </div>

            <div class="register_element_wrap">
                <label for="fuelCapacity">Fuel Capacity<span class="text_color_red">*</span></label>
                <g:textField class="form-control" name="fuelCapacity" value="${dimensionCO?.fuelCapacity}"/>
                <span><g:fieldError bean="${dimensionCO}" field="fuelCapacity"/></span>
            </div>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="groundClearance">Ground Clearance</label>
                <g:textField class="form-control" name="groundClearance" value="${dimensionCO?.groundClearance}"/>
                <span><g:fieldError bean="${dimensionCO}" field="groundClearance"/></span>
            </div>

            <div class="register_element_wrap">
                <label for="wheelBase">Wheel Base</label>
                <g:textField class="form-control" name="wheelBase" value="${dimensionCO?.wheelBase}"/>
                <span><g:fieldError bean="${dimensionCO}" field="wheelBase"/></span>
            </div>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <g:hiddenField name="isAdded" value="true"/>
                <input type='submit'
                       id="addDimension"
                       name="addDimension"
                       class="btn btn-default custom_btn"
                       value='next'/>
            </div>
        </div>
    </g:form>
</div>
</body>
</html>