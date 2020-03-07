package viewObject

import com.carobar.Car

class CarVO {

    String title
    String number
    String type
    String company
    Double price
    Integer year
    String fuelType

    CarVO(Car car) {
        this.title = car.title
        this.number = car.number
        this.type = car.type.value
        this.price = car.price
        this.year = car.year
        this.company = car.companyType.value
        this.fuelType = car.fuelType.value
    }
}
