package enums

enum CarType {

    HATCHBACK("Hatch-Back"),
    SEDAN("Sedan"),
    SUV("SUV")

    final String value

    CarType(String value) {
        this.value = value
    }
}