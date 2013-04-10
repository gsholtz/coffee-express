#Libs
coffee = require "coffee-script"
express = require "express"
app = module.exports = express()
mongoose = require "mongoose"
router = require "./router"

User = require "./models/user"

#Configuration
app.set "view engine", "jade"
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser()
app.use express.static(__dirname + "/assets")
app.use app.router

app.listen process.env.PORT or process.env.VMC_APP_PORT or 3000


if process.env.ENVIRONMENT == "production"
  app.settings.env = process.ENVIRONMENT

if app.settings.env == "development"
  mongoose.connect "mongodb://localhost:27017/basic"
else
  console.log "You didn't set a db connection for production"

#Build Commands
if app.settings.env == "development" 
  exec = require("child_process").exec
  exec "coffee -c -o assets/js/ assets/coffee/", (err, stdout, stderr) ->
    if err is not null
      console.log err
    if stderr
      console.log stderr
      console.log "Error on coffee compilation, client-side scripts"

#Server
router.defineRoutes(app)

#Helpers
app.locals
  dateFormat: require "dateformat"

console.log "Server running"
 