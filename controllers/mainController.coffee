mainController = 
  index: 
    get: (req, res) ->
      res.render "main/index", 
        title: "Basic Application with Express"
        text: "Hello from coffee and express"

module.exports = mainController