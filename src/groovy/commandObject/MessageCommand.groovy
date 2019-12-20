package commandObject

import com.carobar.ThreadMessage
import com.carobar.User

/**
 * Created by prashantk on 25/4/17.
 */
@grails.validation.Validateable
class MessageCommand {
    String sender
    String message
    static constraints = {

    }
}
