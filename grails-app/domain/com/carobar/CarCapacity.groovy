package com.carobar

class CarCapacity {

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
        length nullable: true,blank:true
        width nullable: true,blank:true
        height nullable: true,blank:true
        weight nullable: true,blank:true
        seatCapacity nullable: true,blank:true
        fuelCapacity nullable: true,blank:true
        tyreType nullable: true,blank:true
        wheelSize nullable: true,blank:true
    }
    static belongsTo = [car:Car]
}
