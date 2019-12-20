%{--
<div>
   <h3>Car list</h3>
        <table class="table table-striped" >
            <thead>
            <tr>
                <th>Serial No.</th>
                <th>Photo</th>
                <th>Title</th>
                <th>Brand</th>
                <th>Number</th>
                <th>Price(&#8377;)</th>
                <th>Edit/Delete</th>
            </tr>
            </thead>
            <tbody >
<g:each in="${carList}" var="car"  status="i">
    <tr>
        <td>
            <h3>${i+1}</h3>
        </td>
        <td>
            <div id="wowslider-container1">
                <div class="ws_images">
                    <ul>
                        <li>
                            <img id="myImg${i}" src="${createLink(controller: 'home', action:'renderImage',params: [carNumber:car.carNumber])}" style="height: 50px;width: 50px;" alt="${carTitle}" onclick="">
                    </ul>
                </div>
            </div>
        </td>
        <td>
            <h3>${car.carTitle}</h3>
        </td>
        <td>
            <h3>${car.carCompany}</h3>
        </td>
        <td>
            <h3>${car.carNumber}</h3>
        </td>
        <td>
            <h3>${car.carPrice}</h3>
        </td>
        <td>
            <g:link controller="home"  params="[carId:car.id]" action="deleteCar"><span class="glyphicon glyphicon-trash"></span>Delete</g:link> |<g:link controller="home" action="editCar" params="[id: car?.id]" >Edit</g:link>

             </td>
        </tr>
        </g:each>
        </tbody>
    </table>
    <ul class="pagination">
        <li> <g:paginate  controller="home" action="index" total="${carsCount}" max="5"/></li>
    </ul>
</div>--}%

<div>
    <table class="table  table-responsive" height="500px" >
    <tr>
        <g:each var="it" status="i" in="${carList}">
            <g:if test="${ i > 0 && i % 4 == 0 }"></tr><tr></g:if>
            <td style="border:none;">
                <div id="carHover" class="panel panel-default">
                    <div class="panel panel-heading">
                        ${it.carCompany} ${it.carTitle}
                    </div>
                    <div class="panel panel-body">
                        <img id="myImg${i}" src="${createLink(controller: 'home', action:'renderImage',params: [carNumber:it.carNumber])}" style="height: 160px;width: 180px;" alt="${carTitle}" onclick="">
                    </div>
                    <div class="panel panel-body">
                        <strong>&#8377;${it.carPrice}</strong><br>
                        <ul style="list-style: none; text-align: left;margin-right: 2px;">
                            <li><small>${it.carNumber}</small></li>
                            <li><small>${it.carBasics.year}</small></li>
                            <li><small>${it.carBasics.distance}Km</small></li>
                            <li><small>${it.carBasics.fuel}</small></li>
                            <li><g:link controller="home"  params="[carId:it.id]" action="deleteCar"><span class="glyphicon glyphicon-trash"></span>Delete</g:link>|<g:link controller="home" action="editOtherDetails" params="[id: it?.id]" >Edit</g:link></li>
                        </ul>
                    </div>
                </div>
            </td>
        </g:each>
    </tr>
    </table>
</div>