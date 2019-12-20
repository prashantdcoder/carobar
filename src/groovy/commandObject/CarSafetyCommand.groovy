package commandObject

import com.carobar.Car

/**
 * Created by prashantk on 15/3/17.
 */
@grails.validation.Validateable
class CarSafetyCommand {
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
        antiLockBreaking nullable: true
        parkingSensor nullable: true
        centralLocking nullable: true
        airBags nullable: true
        crashSensor nullable: true
        antiTheftAlarm nullable: true
        powerDoorLocks nullable: true
        rearCameras nullable: true
    }
}
