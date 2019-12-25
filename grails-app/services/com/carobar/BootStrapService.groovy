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
            roleList << new Role(authority: RoleConstant.ROLE_ADMIN)
            roleList*.save(flush: true, failOnError: true)
        }
    }

    void initUser() {
        if (!User.count()) {
            log.info("... init user")
            List<User> userList = []
            List<UserRole> roleList = []
            userList << new User(email: "buyer@carobar.com", username: "buyer", password: "password", enabled: true)
            userList << new User(email: "seller@carobar.com", username: "seller", password: "password", enabled: true)
            userList << new User(email: "superadmin@carobar.com", username: "superadmin", password: "password", enabled: true)
            userList*.save(flush: true)

            roleList << new UserRole(user: userList.get(0), role: Role.findByAuthority(RoleConstant.ROLE_BUYER))
            roleList << new UserRole(user: userList.get(1), role: Role.findByAuthority(RoleConstant.ROLE_SELLER))
            roleList << new UserRole(user: userList.get(2), role: Role.findByAuthority(RoleConstant.ROLE_ADMIN))
            roleList*.save(failOnError: true)
        }
    }
}
