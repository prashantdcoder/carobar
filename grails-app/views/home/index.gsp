<%--
  Created by IntelliJ IDEA.
  User: prashantk
  Date: 14/2/17
  Time: 12:11 PM
--%>

<%@ page import="com.carobar.Picture" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title>Car-O-Bar</title>
    <asset:javascript src="wowslider.js"/>
    <asset:javascript src="script.js"/>
</head>

<body>
<h1>This is index page</h1>

</body>
<script>
    function renderLargeImage(imageId) {
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
    $('#cars').on('click', function () {
        $.ajax({
            type: 'GET',
            url: "${createLink(controller: 'home',action: 'carDetails')}",
            success: function (resp) {
                document.getElementById("tabcontents").innerHTML = resp.htmlContent;
            },
            error: function (jqXHR, exception) {
                alert("Error" + exception);
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

                alert("MSG:" + msg);

            }
        });
    });

    $('#addCars').on('click', function () {
        $.ajax({
            type: 'GET',
            url: "${createLink(controller: 'home',action: 'addCarsByAdmin')}",
            success: function (resp) {
                document.getElementById("tabcontents").innerHTML = resp.htmlContent;
            },
            error: function (exception) {
                alert("ErrorS" + exception);
            }
        });
    });

</script>

</html>