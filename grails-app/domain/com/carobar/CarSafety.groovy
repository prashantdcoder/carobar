package com.carobar

import com.sun.org.apache.xpath.internal.operations.Bool

class CarSafety {

    Boolean antiLockBreaking
    Boolean parkingSensor
    Boolean centralLocking
    Boolean airBags
    Boolean crashSensor
    Boolean antiTheftAlarm
    Boolean powerDoorLocks
    Boolean rearCameras

    Car car

    static constraints = {
        antiLockBreaking nullable: true,blank:true
        parkingSensor nullable: true,blank:true
        centralLocking nullable: true,blank:true
        airBags nullable: true,blank:true
        crashSensor nullable: true,blank:true
        antiTheftAlarm nullable: true,blank:true
        powerDoorLocks nullable: true,blank:true
        rearCameras nullable: true,blank:true
    }
    static belongsTo = [car:Car]
}
