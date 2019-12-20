
<g:hasErrors bean="${carCommand}">
    <i style="color: red"> <g:renderErrors bean="${carCommand}" as="list" ></g:renderErrors></i>
</g:hasErrors>
<div class="modal-dialog">

    <div class="modal-content">
        <div class="modal-header">
           <g:link controller="home" action="index"> <button type="button" class="close" data-dismiss="modal">&times;</button></g:link>
            <h4 class="modal-title">Car Details</h4>
        </div>
        <div class="modal-body">
            <g:uploadForm controller="home" action="editCarDetails" >
                <label>Title:   </label>
                <input type="text" name="carTitle" value="${car?.carTitle}" /><br>
                <label>Brand:</label>

                <select name="carCompany">
                    <option name="maruti_suzuki">Maruti_Suzuki</option>
                    <option name="hyundai">Hyundai</option>
                    <option name="chevrolet">Chevrolet</option>
                    <option name="honda">Honda</option>
                    <option name="toyota">Toyota</option>
                    <option name="tata">Tata</option>
                    <option name="renault">Renault</option>
                </select><br>
                <label>Number:</label>
                <input type="text" name="carNumber" value="${car?.carNumber}" /><br>
                <label>Type</label>

                <select name="carType">
                    <option name="hatchback">Hatchbacks</option>
                    <option name="suv">SUVs</option>
                    <option name="sedan">Sedan</option>
                    <option name="minisuv">Mini-SUVs</option>
                    <option name="luxury">Luxury</option>
                </select><br>
                <input type="hidden" name="id" value="${car?.id}"/>

                <label>Photo:</label><input type="file" name="carImage" multiple /><br>
                <label>Price:</label>
                <input type="text" name="carPrice" value="${car?.carPrice}"/>
                <input type="submit" value="Submit" class="btn btn-default"/>
.
            </g:uploadForm>

        </div>
    </div>


</div>
