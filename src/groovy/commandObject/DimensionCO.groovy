package commandObject

import grails.validation.Validateable

@Validateable
class DimensionCO {

    Integer length
    Integer width
    Integer height
    Integer weight
    Integer seatCapacity = 1
    Integer fuelCapacity
    Integer groundClearance
    Integer wheelBase
    Boolean isAdded = false

    static constraints = {
        length max: 9999
        width max: 9999
        height max: 9999
        weight max: 9999
        fuelCapacity max: 100
        groundClearance nullable: true, max: 200
        wheelBase nullable: true, max: 9999
    }
}
