<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 6/2/17
  Time: 12:58 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title>Car-O-Bar | Registration</title>
</head>

<body>
<div>
    <g:form controller="user" action="register" method='POST'>
        <div class="register_wrap">
            <g:if test='${flash.message}'>
                <div class='alert alert-success'>${flash.message}</div>
            </g:if>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="username">Username</label>
                <g:textField name="username" class="form-control" onblur="checkAvailability();"/>
                <span><g:fieldError bean="${registerCO}" field="username"/></span>
            </div>

            <div class="register_element_wrap">
                <label for="email">Email</label>
                <g:textField class='form-control' name='email'/>
                <span><g:fieldError bean="${registerCO}" field="email"/></span>
            </div>
        </div>


        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="number">Phone Number</label>
                <g:textField class='form-control' name='number' maxlength="10"/>
                <span><g:fieldError bean="${registerCO}" field="number"/></span>
            </div>

            <div class="register_element_wrap">
                <label for="city">City</label>
                <g:textField class='form-control' name='city'/>
                <span><g:fieldError bean="${registerCO}" field="city"/></span>
            </div>
        </div>


        <div class="register_wrap">
            <div class="register_element_wrap">
                <label for="password">Password</label>
                <g:passwordField class='form-control' name='password'/>
                <span><g:fieldError bean="${registerCO}" field="password"/></span>
            </div>

            <div class="register_element_wrap">
                <label for="confirmPassword">Confirm Password</label>
                <g:passwordField class='form-control' name='confirmPassword'/>
                <span><g:fieldError bean="${registerCO}" field="confirmPassword"/></span>
            </div>
        </div>

        <div class="register_wrap">
            <div class="register_element_wrap">
                <g:hiddenField name="isRegister" value="true"/>
                <input type='submit' id="submit" class="btn btn-default custom_btn" value='Register'/>
            </div>
        </div>

    %{--<div class="register_element_wrap">
        <label>Select Role:</label>
        <g:select multiple="multiple" name="role" from="${com.carobar.Role.list()}" optionKey="authority"
                  optionValue="authority" value="asc" style="color: black; width: 150px"/>

    </div>--}%

    </g:form>

</div>
</body>
</html>