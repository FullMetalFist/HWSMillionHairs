import Kitura
import LoggerAPI
import HeliumLogger
import KituraStencil

HeliumLogger.use(.info)

let router = Router()
router.setDefault(templateEngine: StencilTemplateEngine())
router.all("/") {
    request, response, next in
    defer { next() }
    try response.render("home", context: [:])
}

router.get("/staff") {
    request, response, next in
    defer { next() }
    try response.render("staff", context: [:])
}

router.get("/contact") {
    request, response, next in
    defer { next() }
    try response.render("contact", context: [:])
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Log.info("Thicc")
Kitura.run()
