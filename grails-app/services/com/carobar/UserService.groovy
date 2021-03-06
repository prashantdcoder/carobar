package com.carobar

import commandObject.RegisterCO
import constants.MessageConstant
import constants.RoleConstant
import dto.ResponseDTO
import grails.transaction.Transactional

@Transactional
class UserService {
    def groovyPageRenderer

    def grailsLinkGenerator

    ResponseDTO saveUser(RegisterCO registerCO) {
        ResponseDTO responseDTO = new ResponseDTO()
        if (User.findByEmailOrUsername(registerCO.email, registerCO.username)) {
            responseDTO.setFailureResponse(MessageConstant.EMAIL_EXISTS)
        } else {
            User user = new User(
                    username: registerCO.username,
                    email: registerCO.email,
                    number: registerCO.number,
                    city: registerCO.city,
                    password: registerCO.password,
                    enabled: true
            )
            user.save(failOnError: true)
            UserRole userRole = new UserRole(user: user, role: Role.findByAuthority(RoleConstant.ROLE_BUYER))
            userRole.save(failOnError: true)
            //TODO : Sending e-mail to verify account
            responseDTO.setSuccessResponse(null, MessageConstant.VERIFICATION_LINK_SENT)
        }
        return responseDTO
    }

    void user_details(String userName, def role, String email, User user) {

        user.save(flush: true, failOnError: true)
        User userid = User.findByUsername(userName)

        role.each {
            Role userole = Role.findByAuthority(it)
            UserRole userRole = new UserRole(user: userid.id, role: userole.id)
            userRole.save(flush: true, failOnError: true)
        }


        User user1 = User.findByEmail(email)
        String content = groovyPageRenderer.render(view: "/user/verifyEmail", model: [path: grailsLinkGenerator.serverBaseURL, id: user1.id])

        /*asynchronousMailService.sendMail {
            to email
            subject 'CaroBar';
            html content
        }*/

    }


    def confirmEmail(User user) {

        UUID uuid = UUID.randomUUID();
        def email = user.email
        user.uuid = uuid
        user.save(flush: true, failOnError: true)

        String content = groovyPageRenderer.render(view: "/user/confirmEmail", model: [uuid: uuid, path: grailsLinkGenerator.serverBaseURL])
        /*asynchronousMailService.sendMail {
            to email
            subject 'CaroBarTest';

            html content
        }*/


    }
}
