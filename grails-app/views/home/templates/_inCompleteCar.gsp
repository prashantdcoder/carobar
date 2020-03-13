<div class="main-content-inner">
    <div class="card-area">
        <div class="row">
            <g:if test="${carList}">

                <g:each in="${carList}" var="car">
                    <div class="col-lg-4 col-md-6 mt-5">
                        <div class="card card-bordered">
                            <img class="card-img-top img-fluid" src="assets/images/card/card-img1.jpg" alt="image">

                            <div class="card-body">
                                <h5 class="title">${car.title}</h5>

                                <p class="card-text">${car.number}</p>

                                <p class="card-text">${car.price}</p>
                                <a href="#" class="btn btn-primary mb-3 blue_btn">Edit</a>
                                <a href="#" class="btn btn-danger mb-3">Remove</a>
                            </div>
                        </div>
                    </div>
                </g:each>
            </g:if>
            <g:else>
                <div class="col-lg-12 col-md-12 mt-5">
                    <div class="card card-bordered">
                        <p>Welcome Admin</p>
                    </div>
                </div>
            </g:else>

        </div>
    </div>
</div>
