package com.carobar

import commandObject.CarCO
import commandObject.DimensionCO
import commandObject.ImageCO
import constants.MessageConstant
import constants.RoleConstant
import dto.ResponseDTO
import grails.plugin.springsecurity.annotation.Secured

class CarController {

    CarService carService

    def springSecurityService

    @Secured(RoleConstant.ROLE_SELLER)
    def index(CarCO carCO) {
        User seller = springSecurityService.currentUser as User
        render(view: 'index', model: [username: seller.username])
        /*User seller = springSecurityService.currentUser as User
        Car incompleteCar = carService.fetchRecentIncompleteCar(seller)
        if (!carCO.isAdded) {
            carCO.title = incompleteCar?.title
            carCO.number = incompleteCar?.number
            carCO.carType = incompleteCar?.type
            carCO.fuelType = incompleteCar?.fuelType
            carCO.companyType = incompleteCar?.companyType
            carCO.price = incompleteCar?.price
            carCO.city = incompleteCar?.city
            carCO.id = incompleteCar.id
            render(view: 'index', model: [carCO: carCO])
        } else {
            if (!carCO.validate()) {
                render(view: 'index', model: [carCO: carCO])
            } else {
                ResponseDTO responseDTO = carService.addBasicDetails(carCO, incompleteCar, seller)
                if (!responseDTO.status) {
                    render(view: 'index', model: [savingError: MessageConstant.BASIC_DETAILS_UNSAVED])
                } else {
                    redirect(controller: 'car', action: 'dimension')
                }
            }
        }*/
    }

    @Secured(RoleConstant.ROLE_SELLER)
    def dimension(DimensionCO dimensionCO) {
        if (!dimensionCO.isAdded) {
            render(view: 'dimension')
        } else {
            if (!dimensionCO.validate()) {
                render(view: 'dimension', model: [dimensionCO: dimensionCO])
            } else {
                User seller = springSecurityService.currentUser as User
                ResponseDTO responseDTO = carService.addDimension(dimensionCO, seller)
                if (!responseDTO) {
                    render(view: 'dimension', model: [savingError: MessageConstant.DIMENSION_UNSAVED])
                } else {
                    redirect(controller: 'car', action: 'uploadImage')
                }
            }
        }
    }

    @Secured(RoleConstant.ROLE_SELLER)
    def uploadImage(ImageCO imageCO) {
        if (!imageCO.isUploaded) {
            render(view: 'image')
        } else {
            if (!imageCO.validate()) {
                render(view: 'image', model: [imageCO: imageCO])
            } else {
                ResponseDTO responseDTO = carService.uploadImage(imageCO)
                if (responseDTO.status) {
                    render(view: 'thankYou')
                }
            }
        }
    }

}
