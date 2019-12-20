package commandObject

import grails.validation.Validateable

/**
 * Created by prashantk on 7/4/17.
 */
@Validateable
class CarSearchCO {
    Integer startYear
    Integer endYear
    Integer min
    Integer max
    String company
    String fuel
}
