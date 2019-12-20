package commandObject

import com.carobar.Car

/**
 * Created by prashantk on 15/3/17.
 */
@grails.validation.Validateable
class CarComfortCommand {
    Boolean ac
    Boolean poweSteering
    Boolean powerButton
    String transmissionType
    Boolean navigationSystem
    Boolean audioSystem
    Boolean bluetooth

    Car car
    static constraints = {
        ac nullable: true
        powerButton nullable: true
        poweSteering nullable: true
        transmissionType nullable: true
        navigationSystem nullable: true
        audioSystem nullable: true
        bluetooth nullable: true
    }
}
