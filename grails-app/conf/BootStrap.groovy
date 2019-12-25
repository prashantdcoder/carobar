import groovy.util.logging.Slf4j

@Slf4j
class BootStrap {

    def bootStrapService

    def init = { servletContext ->

        bootStrapService.initRole()
        bootStrapService.initUser()
        bootStrapService.initCar()
    }
    def destroy = {
    }
}
