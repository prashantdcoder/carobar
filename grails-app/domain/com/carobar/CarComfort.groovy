package com.carobar

class CarComfort {

    Boolean ac
    Boolean poweSteering
    Boolean powerButton
    String transmissionType
    Boolean navigationSystem
    Boolean audioSystem
    Boolean bluetooth

    Car car
    static constraints = {
        ac nullable: true,blank:true
        powerButton nullable: true,blank:true
        poweSteering nullable: true,blank:true
        transmissionType nullable: true,blank:true
        navigationSystem nullable: true,blank:true
        audioSystem nullable: true,blank:true
        bluetooth nullable: true,blank:true

    }
    static belongsTo = [car:Car]
}
