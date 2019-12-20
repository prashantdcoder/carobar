package com.carobar

class Wishlist {

    User user
    Car car
    static constraints = {
    }
    static hasMany = [car:Car]
}
