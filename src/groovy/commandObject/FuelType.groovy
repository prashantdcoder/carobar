package commandObject

/**
 * Created by prashantk on 15/3/17.
 */
enum FuelType {
    Cng('CNG'),
    Petrol('Petrol'),
    Diesel('Diesel'),
    Electric('Electric')
    String id
    FuelType(String id){
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