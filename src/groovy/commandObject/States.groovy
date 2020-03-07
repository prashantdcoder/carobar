package commandObject

/**
 * Created by prashantk on 15/3/17.
 */
enum States {
    Andhra_Pradesh('Andhra Pradesh'),
    Arunachal_Pradesh('Arunanchal Pradesh'),
    Assam('Assam'),
    Bihar('Bihar'),
    Chandigarh('Chandigarh'),
    Chhattisgarh('Chhattisgarh'),
    Dadra_Nagar('Dadra Nagar'),
    Delhi('Delhi/NCR'),
    Goa('Goa'),
    Gujarat('Gujarat'),
    Haryana('Haryana'),
    Himachal_Pradesh('Himachal Pradesh'),
    Jammu_and_Kashmir('Jammu Kashmir'),
    Jharkhand('Jharkhand'),
    Karnataka('Karnataka'),
    Kerala('Kerala'),
    Lakshadweep('Lakshadweep'),
    Madhya_Pradesh('Madhya Pradesh'),
    Maharashtra('Maharashtra'),
    Manipur('Manipur'),
    Meghalaya('Meghalaya'),
    Mizoram('Mizoram'),
    Nagaland('Nagaland'),
    Odisha('Odisha'),
    Puducherry('Puducherry'),
    Punjab('Punjab'),
    Rajasthan('Rajasthan'),
    Sikkim('Sikkim'),
    Tamil_Nadu('Tamil Nadu'),
    Telangana('Telangana'),
    Tripura('Tripura'),
    Uttar_Pradesh('Uttar Pradesh'),
    Uttarakhand('Uttarakhand'),
    West_Bengal('West Bengal')

    String id
    States(String id){
        this.id=id
    }

    public String getValue(){
        return this.id
    }
    @Override
    public String toString() {
        return this.id
    }
}