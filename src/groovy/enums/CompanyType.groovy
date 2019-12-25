package enums

enum CompanyType {
    MARUTI_SUZUKI('Maruti Suzuki'),
    HYUNDAI('Hyundai'),
    HONDA('Honda'),
    TOYOTA('Toyota'),
    TATA('Tata'),
    RENAULT('Renault'),
    FORD('Ford')

    String value

    CompanyType(String value) {
        this.value = value
    }

}