package com.carobar

class Picture {

    Car car
    String pictureName

    Picture(Car id,String pictureName){
        this.car=id
        this.pictureName=pictureName
    }
    static constraints = {

        pictureName nullable: true
    }
    static belongsTo = [car:Car]
}
