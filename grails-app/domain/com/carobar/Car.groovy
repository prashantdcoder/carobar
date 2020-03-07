package com.carobar


import enums.CarType
import enums.CompanyType
import enums.FuelType
import enums.States

class Car {

    String title
    String number
    CarType type
    Double price
    Integer year
    States city

    CompanyType companyType
    FuelType fuelType

    User seller
    User buyer

    Boolean isCompleted = false
    Boolean isActive = true
    Boolean isSold = false
    Date dateCreated
    Date lastUpdated

    static constraints = {
        capacity nullable: true
        comfort nullable: true
        engine nullable: true
        safety nullable: true
        basic nullable: true
        dimension nullable: true
        buyer nullable: true
        seller nullable: true
        city nullable: true
    }

    static hasMany = [images: Picture]

    static hasOne = [
            capacity : CarCapacity,
            comfort  : CarComfort,
            engine   : CarEngineTransmission,
            safety   : CarSafety,
            basic    : CarBasics,
            dimension: Dimension
    ]

    static List<Car> findAllActiveCarList() {
        List<Car> carList = createCriteria().listDistinct {
            eq('isActive', true)
        } as List<Car>
        return carList ?: []
    }

    static List<Car> findAllActiveCarBySeller(User seller) {
        List<Car> carList = createCriteria().listDistinct {
            eq('seller', seller)
        } as List<Car>
        return carList ?: []
    }
}
