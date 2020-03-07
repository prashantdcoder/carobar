package commandObject

import enums.CarType
import enums.CompanyType
import enums.FuelType
import enums.States
import grails.validation.Validateable

@Validateable
class CarCO {
    String title
    String number
    CarType carType
    Double price
    Integer year
    States city
    Boolean isAdded = false

    CompanyType companyType
    FuelType fuelType

    static constraints = {
        title nullable: false, blank: false
        number nullable: false, blank: false
        price nullable: false
        year nullable: false
        carType nullable: true
        companyType nullable: false
        fuelType nullable: false
    }
}
