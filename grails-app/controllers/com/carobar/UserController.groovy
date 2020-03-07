package com.carobar

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.asyncmail.*




import commandObject.UserCommand
@Transactional(readOnly = false)
//@Secured('hasRole("ROLE_ADMIN")')
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    SpringSecurityService  springSecurityService
    AsynchronousMailService asynchronousMailService
    def groovyPageRenderer
    def grailsLinkGenerator
    def userService
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def register(){

    }

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def user_details(UserCommand userCommand){

    def user=new User(params)
    def userName=params.get('username')
    def role=params.list('role')
    def email=params.get('email')


    userCommand.validate()

        if(userCommand.hasErrors())
        {
            userCommand.errors.allErrors.each { log.debug "error while savig register" + it }
            render(view: 'register', model: [userCommand: userCommand])
        }

    else
    {
        userService.user_details(userName,role,email,user)

        flash.message="Verify email to activate your account"
        render(view: 'register')

        return
    }

  }

    def verifyEmailId(){

        User user=User.findById(params.id)
        user.enabled=true
        user.save(flush: true,failOnError: true)
        redirect(controller: 'home')
        return
    }


    @Secured("IS_AUTHENTICATED_FULLY")
    def login(){
        def user = springSecurityService.currentUserId


        redirect controller: 'home' ,action: 'index'

    }
    def index(Integer max) {

    }

    def forgotPassowrd(){
        render(view: 'forgotPassword')
    }
    def confirmEmail(params){
        def email=params.email

        User user=User.findByEmail(email)

        if(user){

            userService.confirmEmail(user)
            flash.message="Your password reset mail has been sent-check your email"
        }
        else {
            flash.message="Invalid email address"
        }

        render(view: 'forgotPassword')
    }

    def updatePassword(){

        User user=User.findByUuid(params.id)

        if(user)
        {
            render(view: 'updatePassword',model: [user: user])
        }
        else
        {
            flash.message="not valid user"
            render view: 'updatePassword'
        }
    }

    def changePassword(){

        User user=User.findByUuid(params.uuid)
        user.password=params.newPassword
        user.save(flush: true,failOnError: true)
        render(view: 'register')
        redirect(controller: 'home')

    }

    def checkAvailability(){

        String username=params.username
        String msg=null
        User user=User.findByUsername(username);

        if(user){
            msg="exist"
        }
        else {
            msg="notexist"
        }
        render msg
    }



    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}





