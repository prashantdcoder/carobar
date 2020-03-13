<%--
  Created by IntelliJ IDEA.
  User: Prashant
  Date: 12/25/2019
  Time: 7:48 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title>Car-O-Bar | Home</title>
</head>

<body>

<g:render template="templates/loader"/>
<g:render template="templates/leftPanel"/>

<div class="page-container">
    <div class="main-content">
        <div class="header-area">
            <div class="row align-items-center">
                <div class="col-md-6 col-sm-8 clearfix display_only_flex">
                    <div class="nav-btn pull-left" id="leftSlider">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>

                    <div class="search-box pull-left">
                        <form action="#">
                            <input type="text" name="search" placeholder="Search" required>
                            <i class="ti-search"></i>
                        </form>
                    </div>
                </div>

                <div class="col-md-6 col-sm-4 clearfix">
                    <ul class="notification-area float_right">
                        <li id="full-view-exit"><i class="ti-zoom-out"></i></li>
                        <li class="dropdown">
                            <i class="ti-bell dropdown-toggle" data-toggle="dropdown">
                                <span>2</span>
                            </i>

                            %{--<div class="dropdown-menu bell-notify-box notify-box">
                                <span class="notify-title">You have 3 new notifications <a href="#">view all</a></span>

                                <div class="nofity-list">
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb"><i class="ti-key btn-danger"></i></div>

                                        <div class="notify-text">
                                            <p>You have Changed Your Password</p>
                                            <span>Just Now</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb"><i class="ti-comments-smiley btn-info"></i></div>

                                        <div class="notify-text">
                                            <p>New Commetns On Post</p>
                                            <span>30 Seconds ago</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb"><i class="ti-key btn-primary"></i></div>

                                        <div class="notify-text">
                                            <p>Some special like you</p>
                                            <span>Just Now</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb"><i class="ti-comments-smiley btn-info"></i></div>

                                        <div class="notify-text">
                                            <p>New Commetns On Post</p>
                                            <span>30 Seconds ago</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb"><i class="ti-key btn-primary"></i></div>

                                        <div class="notify-text">
                                            <p>Some special like you</p>
                                            <span>Just Now</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb"><i class="ti-key btn-danger"></i></div>

                                        <div class="notify-text">
                                            <p>You have Changed Your Password</p>
                                            <span>Just Now</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb"><i class="ti-key btn-danger"></i></div>

                                        <div class="notify-text">
                                            <p>You have Changed Your Password</p>
                                            <span>Just Now</span>
                                        </div>
                                    </a>
                                </div>
                            </div>--}%
                        </li>
                        <li class="dropdown">
                            <i class="ti-email dropdown-toggle" data-toggle="dropdown"><span>3</span></i>

                            %{--<div class="dropdown-menu notify-box nt-enveloper-box">
                                <span class="notify-title">You have 3 new notifications <a href="#">view all</a></span>

                                <div class="nofity-list">
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb">
                                            <img src="assets/images/author/author-img1.jpg" alt="image">
                                        </div>

                                        <div class="notify-text">
                                            <p>Aglae Mayer</p>
                                            <span class="msg">Hey I am waiting for you...</span>
                                            <span>3:15 PM</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb">
                                            <img src="assets/images/author/author-img2.jpg" alt="image">
                                        </div>

                                        <div class="notify-text">
                                            <p>Aglae Mayer</p>
                                            <span class="msg">When you can connect with me...</span>
                                            <span>3:15 PM</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb">
                                            <img src="assets/images/author/author-img3.jpg" alt="image">
                                        </div>

                                        <div class="notify-text">
                                            <p>Aglae Mayer</p>
                                            <span class="msg">I missed you so much...</span>
                                            <span>3:15 PM</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb">
                                            <img src="assets/images/author/author-img4.jpg" alt="image">
                                        </div>

                                        <div class="notify-text">
                                            <p>Aglae Mayer</p>
                                            <span class="msg">Your product is completely Ready...</span>
                                            <span>3:15 PM</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb">
                                            <img src="assets/images/author/author-img2.jpg" alt="image">
                                        </div>

                                        <div class="notify-text">
                                            <p>Aglae Mayer</p>
                                            <span class="msg">Hey I am waiting for you...</span>
                                            <span>3:15 PM</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb">
                                            <img src="assets/images/author/author-img1.jpg" alt="image">
                                        </div>

                                        <div class="notify-text">
                                            <p>Aglae Mayer</p>
                                            <span class="msg">Hey I am waiting for you...</span>
                                            <span>3:15 PM</span>
                                        </div>
                                    </a>
                                    <a href="#" class="notify-item">
                                        <div class="notify-thumb">
                                            <img src="assets/images/author/author-img3.jpg" alt="image">
                                        </div>

                                        <div class="notify-text">
                                            <p>Aglae Mayer</p>
                                            <span class="msg">Hey I am waiting for you...</span>
                                            <span>3:15 PM</span>
                                        </div>
                                    </a>
                                </div>
                            </div>--}%
                        </li>
                        <li class="settings-btn">
                            <i class="ti-settings"></i>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- page title area start -->
        <div class="page-title-area">
            <div class="row align-items-center">
                <div class="col-sm-6">
                    <div class="breadcrumbs-area clearfix">
                        <h4 class="page-title pull-left">Dashboard</h4>
                        <ul class="breadcrumbs pull-left">
                            <li><a href="index.html">Home</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-sm-6 clearfix">
                    <div class="user-profile pull-right">
                        <img class="avatar user-thumb" src="${assetPath(src: 'avatar/avatar.png')}" alt="avatar">
                        <h4 class="user-name dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            ${username}
                            <i class="ti-angle-down"></i></h4>

                        <div class="dropdown-menu logout_dropdown" x-placement="bottom-start">
                            <a class="dropdown-item" href="#">Profile</a>
                            <a class="dropdown-item" href="#">Reset Password</a>
                            <a class="dropdown-item" href="#">Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- page title area end -->
        <g:render template="templates/inCompleteCar" model="[carList: carList]"/>
    </div>

</div>
</body>
</html>