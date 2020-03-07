import com.carobar.Role
import com.carobar.User
import com.carobar.UserRole

class BootStrap {

    def init = { servletContext ->


        if (!Role.findByAuthority('Buyer_ROLE'))
        {
            Role role=new Role(authority: 'Buyer_ROLE')
            role.save(flush: true,failOnError: true)

        }
        if(!Role.findByAuthority('Seller_Role'))
        {
            Role role=new Role(authority: 'Seller_Role')
            role.save(flush: true,failOnError: true)
        }

    }
    def destroy = {
    }
}
