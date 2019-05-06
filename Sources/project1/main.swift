import Kitura
import LoggerAPI
import HeliumLogger
import KituraStencil

HeliumLogger.use(.info)

let router = Router()
router.setDefault(templateEngine: StencilTemplateEngine())
router.all("/") {
    request, response, next in
    try response.render("home", context: [:])
    next()
}

router.get("/staff") {
    request, response, next in
    response.send("Meet our great team")
    next()
}

router.get("/contact") {
    request, response, next in
    response.send("Holla at us")
    next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Log.info("Thicc")
Kitura.run()
