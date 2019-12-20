package com.carobar

class ViewCount {

    User user
    Car car
    static constraints = {
    }

    static hasMany = [car:Car]
}
