package com.carobar


import enums.CarType
import enums.CompanyType
import enums.FuelType

class Car {

    String title
    String number
    CarType type
    Double price
    Integer year

    CompanyType companyType
    FuelType fuelType

    User seller
    User buyer

    Boolean isActive = true
    Boolean isSold = false
    Date dateCreated
    Date lastUpdated

    static constraints = {
        comfort nullable: true
        basic nullable: true
        safety nullable: true
        capacity nullable: true
        engine nullable: true
        buyer nullable: true
        seller nullable: true
    }

    static hasMany = [images: Picture]

    static hasOne = [
            capacity: CarCapacity,
            comfort : CarComfort,
            engine  : CarEngineTransmission,
            safety  : CarSafety,
            basic   : CarBasics
    ]

    static List<Car> findAllActiveCarList() {
        List<Car> carList = createCriteria().listDistinct {
            eq('isActive', true)
        } as List<Car>
        return carList ?: []
    }

}
