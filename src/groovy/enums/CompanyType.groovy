package enums

enum CompanyType {
    MARUTI_SUZUKI('Maruti Suzuki'),
    HYUNDAI('Hyundai'),
    HONDA('Honda'),
    TOYOTA('Toyota'),
    TATA('Tata'),
    RENAULT('Renault'),
    FORD('Ford')

    final String value, key

    CompanyType(String value) {
        this.value = value
        this.key = name()
    }

}