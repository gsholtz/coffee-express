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
,
  controller: "user"
  type: "get"
  action: "create"
  url: "/user/create"
,
  controller: "user"
  type: "get"
  action: "edit"
  url: "/user/edit/:id"
,
  controller: "user"
  type: "post"
  action: "edit"
  url: "/user/edit"
,
  controller: "user"
  type: "post"
  action: "delete"
  url: "/user/delete"
,
  controller: "group"
  type: "get"
  action: "index"
  url: "/group"
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