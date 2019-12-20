package com.carobar
import grails.plugin.springsecurity.annotation.Secured

@Secured('hasAnyRole(\'Admin_Role1\',\'ROLE_ADMIN\')')
class SecureController {



    def index() {

        render "Secure sucess only"
      //  redirect(controller: User,action: 'register')
    }
}
