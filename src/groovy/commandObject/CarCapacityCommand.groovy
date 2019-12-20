package commandObject

import com.carobar.Car

/**
 * Created by prashantk on 15/3/17.
 */
@grails.validation.Validateable
class CarCapacityCommand {
    Integer length
    Integer width
    Integer height
    Integer weight
    Integer seatCapacity
    Integer fuelCapacity
    String tyreType
    String wheelSize

    Car car
    static constraints = {
        length nullable: true
        width nullable: true
        height nullable: true
        weight nullable: true
        seatCapacity nullable: true
        fuelCapacity nullable: true
        tyreType nullable: true
        wheelSize nullable:true
    }
}
