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
<section class="cat_product_area">
    <div class="row">
        <div class="col-lg-3">
            <div class="left_sidebar_area">
                <aside class="left_widgets p_filter_widgets sidebar_box_shadow">
                    <div class="l_w_title">
                        <h3 class="banner_red_color">Product filters</h3>
                    </div>

                    <div class="widgets_inner">
                        <ul class="list">
                            <p>Brands</p>
                            <li>
                                <input type="radio" aria-label="Radio button for following text input">
                                <a href="#">Maruti Suzuki</a>
                            </li>
                            <li>
                                <input type="radio" aria-label="Radio button for following text input">
                                <a href="#">Hyundai</a>
                            </li>
                            <li class="active">
                                <input type="radio" aria-label="Radio button for following text input">
                                <a href="#">Honda</a>
                            </li>
                            <li>
                                <input type="radio" aria-label="Radio button for following text input">
                                <a href="#">Ford</a>
                            </li>
                        </ul>
                        <ul class="list">
                            <p>color</p>
                            <li>
                                <input type="radio" aria-label="Radio button for following text input">
                                <a href="#">Black</a>
                            </li>
                            <li>
                                <input type="radio" aria-label="Radio button for following text input">
                                <a href="#">Red</a>
                            </li>
                            <li>
                                <input type="radio" aria-label="Radio button for following text input">
                                <a href="#">White</a>
                            </li>
                            <li>
                                <input type="radio" aria-label="Radio button for following text input">
                                <a href="#">Silver</a>
                            </li>
                            <li>
                                <input type="radio" aria-label="Radio button for following text input">
                                <a href="#">Gray</a>
                            </li>
                        </ul>
                    </div>
                </aside>

                <aside class="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow">
                    <div class="l_w_title">
                        <h3 class="banner_red_color">Price Filter</h3>
                    </div>

                    <div class="widgets_inner">
                        <div class="range_item">
                            <!-- <div id="slider-range"></div> -->
                            <input type="text" class="js-range-slider" value=""/>

                            <div class="d-flex align-items-center">
                                <div class="price_text">
                                    <p>Price :</p>
                                </div>

                                <div class="price_value d-flex justify-content-center">
                                    <input type="text" class="js-input-from" id="amount" readonly/>
                                    <span>to</span>
                                    <input type="text" class="js-input-to" id="amount" readonly/>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>

        <div class="col-lg-9">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product_top_bar d-flex justify-content-between align-items-center">
                        <div class="single_product_menu product_bar_item">
                            <h2>Available</h2>
                        </div>

                        <div class="product_top_bar_iner product_bar_item d-flex">
                            <div class="product_bar_single">
                                <select class="wide">
                                    <option data-display="Default sorting">Default sorting</option>
                                    <option value="1">Some option</option>
                                    <option value="2">Another option</option>
                                    <option value="3">Potato</option>
                                </select>
                            </div>

                            <div class="product_bar_single">
                                <select>
                                    <option data-display="Show 12">Show 12</option>
                                    <option value="1">Show 20</option>
                                    <option value="2">Show 30</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <g:each in="${carList}" var="car">
                    <div class="col-lg-4 col-sm-6">
                        <div class="single_category_product">
                            <div class="single_category_img">
                                <img src="https://dummyimage.com/255X280/ede6ed/121fe0.png&text=Car">

                                <div class="category_social_icon">
                                    <ul>
                                        <li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a></li>
                                        <li><a href="#"><i class="ti-bag"></i></a></li>
                                    </ul>
                                </div>

                                <div class="category_product_text product_description">
                                    <span>${car.company}-${car.title}</span>
                                    <span>${car.year}</span>
                                    <span>${car.price}</span>
                                    <span>${car.type}</span>
                                    <span>${car.fuelType}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:each>



                <div class="col-lg-12 text-center">
                    <a href="#" class="btn_2">More Items</a>
                </div>
            </div>
        </div>
    </div>

</section>
</body>
</html>