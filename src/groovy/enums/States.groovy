package enums

/**
 * Created by prashantk on 15/3/17.
 */
enum States {
    ANDHRA_PRADESH('Andhra Pradesh'),
    ARUNACHAL_PRADESH('Arunanchal Pradesh'),
    ASSAM('Assam'),
    BIHAR('Bihar'),
    CHANDIGARH('Chandigarh'),
    CHHATTISGARH('Chhattisgarh'),
    DADRA_NAGAR('Dadra Nagar'),
    DELHI('Delhi/NCR'),
    GOA('Goa'),
    GUJARAT('Gujarat'),
    HARYANA('Haryana'),
    HIMACHAL_PRADESH('Himachal Pradesh'),
    JAMMU('Jammu Kashmir'),
    JHARKHAND('Jharkhand'),
    KARNATAKA('Karnataka'),
    KERALA('Kerala'),
    LAKSHADWEEP('Lakshadweep'),
    MADHYA_PRADESH('Madhya Pradesh'),
    MAHARASHTRA('Maharashtra'),
    MANIPUR('Manipur'),
    MEGHALAYA('Meghalaya'),
    MIZORAM('Mizoram'),
    NAGALAND('Nagaland'),
    ODISHA('Odisha'),
    PUDUCHERRY('Puducherry'),
    PUNJAB('Punjab'),
    RAJASTHAN('Rajasthan'),
    SIKKIM('Sikkim'),
    TAMIL_NADU('Tamil Nadu'),
    TELANGANA('Telangana'),
    TRIPURA('Tripura'),
    UTTAR_PRADESH('Uttar Pradesh'),
    UTTARAKHAND('Uttarakhand'),
    WEST_BENGAL('West Bengal')

    final String value

    States(String value) {
        this.value = value
    }

}