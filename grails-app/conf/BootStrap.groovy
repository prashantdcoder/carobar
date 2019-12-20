import com.carobar.Role
import constants.RoleConstant
import groovy.util.logging.Slf4j

@Slf4j
class BootStrap {

    def init = { servletContext ->
        if (!Role.count()) {
            log.info("... init roles")
            List<Role> roleList = []
            roleList << new Role(authority: RoleConstant.ROLE_BUYER)
            roleList << new Role(authority: RoleConstant.ROLE_SELLER)
            roleList*.save(flush: true, failOnError: true)
        }
    }
    def destroy = {
    }
}
