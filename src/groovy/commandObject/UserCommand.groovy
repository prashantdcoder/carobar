package commandObject

import grails.validation.Validateable

/**
 * Created by prashantk on 20/2/17.
 */
@Validateable
class UserCommand {


    String username
    Integer number
    String city
    String email
    String confirm_password
    String password
    static constraints = {
        username blank: false, unique: true, nullable: false
        password blank: false, matches: '(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}'
        number blank: false, nullable: false
        city blank: false, nullable: false
        email blank: false, nullable: false, email: true

        confirm_password nullable: false, blank: false, validator: { var, ob ->
            if (ob.password != var)
                return "com.carobar.UserCommand.confirm_password.validator"
        }
    }
}
