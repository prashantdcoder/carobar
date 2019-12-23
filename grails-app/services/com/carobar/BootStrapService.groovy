package com.carobar

import constants.RoleConstant
import grails.transaction.Transactional

@Transactional
class BootStrapService {

    void initRole() {
        if (!Role.count()) {
            log.info("... init roles")
            List<Role> roleList = []
            roleList << new Role(authority: RoleConstant.ROLE_BUYER)
            roleList << new Role(authority: RoleConstant.ROLE_SELLER)
            roleList*.save(flush: true, failOnError: true)
        }
    }

    void initUser() {
        if (!User.count()) {
            log.info("... init user")
            List<User> userList = []
            userList << new User(email: "buyer@carobar.com", username: "buyer", password: "password", enabled: true)
            userList << new User(email: "admin@carobar.com", username: "admin", password: "password", enabled: true)
            userList*.save(flush: true)
        }
    }
}
