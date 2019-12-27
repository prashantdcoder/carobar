class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "/home")
        "/basic"(controller: 'car', action: 'index')
        "/capacity"(controller: 'car', action: 'dimension')
        "500"(view: '/error')
        "404"(view: 'error/pageNotFound')
    }
}
