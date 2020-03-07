package commandObject

import grails.validation.Validateable

@Validateable
class RegisterCO {

    String username
    String email
    Integer number
    String city
    String password
    String confirmPassword
    Boolean isRegister = false

    static constraints = {
        username blank: false, nullable: false
        password blank: false, matches: '(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}'
        number blank: false, nullable: false
        city blank: false, nullable: false
        email blank: false, nullable: false, email: true
        confirmPassword nullable: false, blank: false, validator: { var, ob ->
            if (ob.password != var)
                return "com.carobar.UserCommand.confirm_password.validator"
        }
    }
}
