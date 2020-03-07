class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "/home")
        "/car-basic"(controller: 'car', action: 'index')
        "/car-capacity"(controller: 'car', action: 'dimension')
        "/car-picture"(controller: 'car', action: 'uploadImage')
        "500"(view: '/error')
        "404"(view: 'error/pageNotFound')
    }
}
