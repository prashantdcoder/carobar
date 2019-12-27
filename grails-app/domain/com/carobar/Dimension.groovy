package com.carobar

class Dimension {

    Integer length
    Integer width
    Integer height
    Integer weight
    Integer seatCapacity = 0
    Integer fuelCapacity
    Integer groundClearance
    Integer wheelBase

    Boolean isActive = true
    Date dateCreated
    Date lastUpdated

    static belongsTo = [car: Car]

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
