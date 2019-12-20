package commandObject

/**
 * Created by prashantk on 6/3/17.
 */
enum CarCompany {

    Maruti_Suzuki('Maruti_Suzuki'),
    Hyundai('Hyundai'),
    Honda('Honda'),
    Toyota('Toyota'),
    Tata('Tata'),
    Renault('Renault'),
    Ford('Ford')

    String id
    CarCompany(String id){
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