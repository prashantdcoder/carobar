package com.carobar

import constants.RoleConstant
import enums.CarType
import enums.CompanyType
import enums.FuelType
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

    void initCar() {
        if (!Car.count()) {
            log.info("... init car")
            List<Car> carList = []
            carList << new Car(title: 'Baleno', number: 'DL10421', type: CarType.HATCHBACK, price: 630000, companyType: CompanyType.MARUTI_SUZUKI, year: 2018, fuelType: FuelType.PETROL, seller: User.findByUsername("seller"))
            carList << new Car(title: 'City', number: 'HR78452', type: CarType.SEDAN, price: 250000, companyType: CompanyType.HONDA, year: 2009, fuelType: FuelType.CNG, seller: User.findByUsername("seller"))
            carList << new Car(title: '800', number: 'PB63633', type: CarType.HATCHBACK, price: 360000, companyType: CompanyType.MARUTI_SUZUKI, year: 2014, fuelType: FuelType.DIESEL, seller: User.findByUsername("seller"))
            carList*.save(failOnError: true)
        }
    }
}
