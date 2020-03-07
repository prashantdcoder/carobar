package com.carobar

import enums.FuelType
import enums.States

class CarBasics {

    Integer year
    Long distance
    FuelType fuel
    States city
    Car car

    static constraints = {
        year nullable: true
        distance nullable: true, blank: true
        fuel nullable: true
        city nullable: true
        car nullable: true
    }
    static belongsTo = [car: Car]
}
