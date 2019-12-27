package enums

/**
 * Created by prashantk on 15/3/17.
 */
enum FuelType {
    CNG('CNG'),
    PETROL('Petrol'),
    DIESEL('Diesel'),
    ELECTRIC('Electric')

    final String value, key

    FuelType(String value) {
        this.value = value
        this.key = name()
    }

}