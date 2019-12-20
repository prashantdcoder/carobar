package com.carobar

class CarEngineTransmission {

    Integer topSpeed
    Integer acceleration
    Integer maxPower
    Integer maxTorque
    String engineDescription
    Integer cylinders
    Car car

    static constraints = {
        topSpeed nullable: true,blank:true
        acceleration nullable: true,blank:true
        maxPower nullable: true,blank:true
        maxTorque nullable: true,blank:true
        engineDescription nullable: true,blank:true
        cylinders nullable: true,blank:true

    }
    static belongsTo = [car:Car]
}
