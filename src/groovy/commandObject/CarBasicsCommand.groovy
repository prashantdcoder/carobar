package commandObject

import com.carobar.Car


/**
 * Created by prashantk on 14/3/17.
 */
@grails.validation.Validateable
class CarBasicsCommand {
    Date year
    Long distance
    FuelType fuel
    States city

    Car car

    static constraints = {
        year nullable: true
        distance nullable: true
        fuel nullable: true
        city nullable: true
        car nullable: false
    }
}
