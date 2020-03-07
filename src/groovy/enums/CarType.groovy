package enums

enum CarType {

    HATCHBACK("Hatch-Back"),
    SEDAN("Sedan"),
    SUV("SUV")

    final String value, key

    CarType(String value) {
        this.value = value
        this.key = name()
    }
}