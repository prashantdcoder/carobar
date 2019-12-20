package commandObject

import com.carobar.Car

/**
 * Created by prashantk on 15/3/17.
 */
@grails.validation.Validateable
class CarEngineCommand {
    Integer topSpeed
    Integer acceleration
    Integer maxPower
    Integer maxTorque
    String engineDescription
    Integer cylinders
    Car car

    static constraints = {
        topSpeed nullable: true
        acceleration nullable: true
        maxPower nullable: true
        maxTorque nullable: true
        engineDescription nullable: true
        cylinders nullable: true
        car nullable:false
    }
}

