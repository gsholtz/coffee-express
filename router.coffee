routes = [
  controller: "main"
  type: "get"
  action: "index"
  url: "/"
,
  controller: "user"
  type: "get"
  action: "index"
  url: "/user"
]

router = 
  defineRoutes: (app) ->
    routes.forEach (route) ->
      #TODO: Validar rota
      app[route.type] route.url, (req,res) ->
        useController(route.controller)[route.action][route.type](req, res)

useController = (controller) ->
  require("./controllers/#{controller}Controller")   

module.exports = router   