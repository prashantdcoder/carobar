package com.carobar

import commandObject.CarCompany


class Car {

    String carTitle
    String carNumber
    String carType
    Integer carPrice
    String carImage
    User user
    CarCompany carCompany
    Boolean soldOut
    User buyer
    CarComfort carComfort
    CarBasics carBasics
    CarCapacity carCapacity
    CarEngineTransmission carEngineTransmission
    CarSafety carSafety

    static constraints = {
        carTitle nullable: false,blank: false
        carNumber nullable: false,blank: false
        carType nullable: false,blank: false
        carPrice nullable: false,blank: false
        carComfort nullable: true
        carBasics nullable: true
        carSafety nullable: true
        carCapacity nullable: true
        carEngineTransmission nullable: true
        carImage nullable: false
        buyer nullable: true

    }

    static  hasMany = [pictures :Picture]
    static hasOne = [carCapacity:CarCapacity,carComfort:CarComfort,carEngineTransmission:CarEngineTransmission,carSafety:CarSafety,carBasics:CarBasics]
    static belongsTo = [user:User]



}
