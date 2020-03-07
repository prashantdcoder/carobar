<%--
  Created by IntelliJ IDEA.
  User: Prashant
  Date: 12/27/2019
  Time: 11:11 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Car-O-Bar | Add Pictures</title>
</head>

<body>
<g:render template="/template/steps" model="[step: 'Images']"/>
<g:uploadForm controller="car" action="uploadImage">
    <div class="register_wrap">
        <div class="register_element_wrap">
            <div class="">
                <div class="custom-file">
                    <input type="file"
                           class="custom-file-input"
                           id="image1"
                           name="image1"
                           aria-describedby="inputGroupFileAddon01">
                    <label class="custom-file-label" for="image1">Choose file</label>
                    <span><g:fieldError bean="${imageCO}" field="image1"/></span>
                </div>
            </div>
        </div>

        <div class="register_element_wrap">
            <div class="">
                <div class="custom-file">
                    <input type="file"
                           class="custom-file-input"
                           id="image2"
                           name="image2"
                           aria-describedby="inputGroupFileAddon01">
                    <label class="custom-file-label" for="image2">Choose file</label>
                    <span><g:fieldError bean="${imageCO}" field="image2"/></span>
                </div>
            </div>
        </div>
    </div>

    <div class="register_wrap">
        <div class="register_element_wrap">
            <div class="">
                <div class="custom-file">
                    <input type="file"
                           class="custom-file-input"
                           id="image3"
                           name="image3"
                           aria-describedby="inputGroupFileAddon01">
                    <label class="custom-file-label" for="image3">Choose file</label>
                    <span><g:fieldError bean="${imageCO}" field="image3"/></span>
                </div>
            </div>
        </div>

        <div class="register_element_wrap">
            <div class="">
                <div class="custom-file">
                    <input type="file"
                           class="custom-file-input"
                           id="image4"
                           name="image4"
                           aria-describedby="inputGroupFileAddon01">
                    <label class="custom-file-label" for="image4">Choose file</label>
                    <span><g:fieldError bean="${imageCO}" field="image4"/></span>
                </div>
            </div>
        </div>
    </div>

    <div class="register_wrap">
        <g:hiddenField name="isUploaded" value="true"/>
        <g:submitButton
                class="btn btn-default custom_btn"
                name="upload" value="upload"/>
    </div>

</g:uploadForm>
</body>
</html>
