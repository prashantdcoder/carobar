<%--
  Created by IntelliJ IDEA.
  User: Prashant
  Date: 12/25/2019
  Time: 11:02 PM
--%>

<%@ page import="enums.States; enums.CompanyType; enums.FuelType; commandObject.CarCompany; enums.CarType" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Car-O-Bar | Add Basic</title>
    <asset:javascript src="bootstrap-datepicker.js"/>
    <asset:stylesheet src="bootstrap-datepicker.css"/>
    <asset:javascript src="custom.js"/>
</head>

<body>
<g:render template="/template/steps" model="[step: 'Basic']"/>

<div class="car_main_div">
    <g:form controller="car" action="index" method="get">
        <div class="register_wrap">
            <g:if test='${savingError}'>
                <div class='alert alert-danger email_link_alert'>${savingError}</div>
            </g:if>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="title">Title<span class="text_color_red">*</span></label>
                <g:textField name="title" class="form-control" value="${carCO?.title}"/>
                <span><g:fieldError bean="${carCO}" field="title"/></span>
            </div>

            <div class="register_element_wrap">
                <label for="number">Identification Number<span class="text_color_red">*</span></label>
                <g:textField name="number" class="form-control" value="${carCO?.number}"/>
                <span><g:fieldError bean="${carCO}" field="number"/></span>
            </div>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="carType">Type</label>
                <g:select class="form-control"
                          name="carType"
                          from="${CarType.values()}"
                          optionKey="key"
                          noSelection="['': 'Select type']"
                          value="key"/>
            </div>

            <div class="register_element_wrap">
                <label for="fuelType">Fuel<span class="text_color_red">*</span></label>
                <g:select class="form-control"
                          name="fuelType"
                          from="${FuelType.values()}"
                          noSelection="['': 'Select Fuel']"
                          optionKey="key"
                          value="key"/>
                <span><g:fieldError bean="${carCO}" field="fuelType"/></span>
            </div>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="companyType">Company<span class="text_color_red">*</span></label>
                <g:select class="form-control"
                          name="companyType"
                          from="${CompanyType.values()}"
                          optionKey="key"
                          noSelection="['': 'Select Company']"
                          value="key"/>
                <span><g:fieldError bean="${carCO}" field="companyType"/></span>
            </div>

            <div class="register_element_wrap">
                <label for="year">Year<span class="text_color_red">*</span></label>
                <g:textField name="year" class="form-control"/>
                <span><g:fieldError bean="${carCO}" field="year"/></span>
            </div>

        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="year">Price<span class="text_color_red">*</span></label>
                <g:textField name="price" class="form-control" value="${carCO?.price}"/>
                <span><g:fieldError bean="${carCO}" field="price"/></span>
            </div>

            <div class="register_element_wrap">
                <label for="city">City*</label>
                <g:select class="form-control"
                          name="city"
                          from="${States.values()}"
                          optionValue="value"
                          noSelection="['': 'Select City']"/>
                <span><g:fieldError bean="${carCO}" field="city"/></span>
            </div>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <g:hiddenField name="isAdded" value="true"/>
                <input type='submit' id="add" name="add" class="btn btn-default custom_btn" value='next'/>
            </div>
        </div>
    </g:form>
</div>
</body>
</html>