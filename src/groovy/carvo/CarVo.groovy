package carvo

import com.carobar.Car
/*import com.google.common.collect.Constraints*/
import commandObject.CarCompany
import commandObject.FuelType
import commandObject.States

/**
 * Created by prashantk on 20/3/17.
 */
@grails.validation.Validateable
class CarVo {

    String carTitle
    String carNumber
    String carType
    Integer carPrice
    String carImage
    Long id
    CarCompany carCompany

    Date year
    Long distance
    FuelType fuel
    States city

    Integer topSpeed
    Integer acceleration
    Integer maxPower
    Integer maxTorque
    String engineDescription
    Integer cylinders

    Integer length
    Integer width
    Integer height
    Integer weight
    Integer seatCapacity
    Integer fuelCapacity
    String tyreType
    String wheelSize

    Boolean ac
    Boolean poweSteering
    Boolean powerButton
    String transmissionType
    Boolean navigationSystem
    Boolean audioSystem
    Boolean bluetooth



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
        carTitle nullable: true,blank: true
        carNumber nullable: true,blank: true
        carPrice nullable: true,blank:true
        carImage nullable: true,blank: true
        distance nullable: true, blank:true
    }

}
