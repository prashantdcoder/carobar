package com.carobar

import commandObject.CarCO
import constants.MessageConstant
import constants.RoleConstant
import dto.ResponseDTO
import grails.plugin.springsecurity.annotation.Secured

class CarController {

    def carService

    @Secured(RoleConstant.ROLE_SELLER)
    def index(CarCO carCO) {
        if (!carCO.isAdded) {
            render(view: 'index')
        } else {
            if (!carCO.validate()) {
                render(view: 'index', model: [carCO: carCO])
            } else {
                ResponseDTO responseDTO = carService.addBasicDetails(carCO)
                responseDTO.status ? render(view: 'index', model: [savingError: "Basic details have been saved"]) : render(view: 'index', model: [savingError: MessageConstant.BASIC_DETAILS_UNSAVED])
            }
        }
    }


}
