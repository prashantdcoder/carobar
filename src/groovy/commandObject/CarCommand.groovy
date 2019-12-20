package commandObject

/**
 * Created by prashantk on 20/2/17.
 */
@grails.validation.Validateable
class CarCommand {

    String carTitle
   /* String carBrand*/
    String carNumber
    String carType
    Integer carPrice
    String carImage
    Long id
    CarCompany carCompany
    def carService
    static constraints = {
        carTitle nullable: true,blank: false
        carType nullable: true,blank: false
        carPrice nullable: true,blank: false,minSize: 6
        carNumber nullable: true,blank: false,matches: '[A-Z]{2}[0-9]{4}$'
        carCompany nullable: true
        carImage nullable: true

    }
}
