userController = 
  index: 
    get: (req, res) ->
      res.render "user/index", 
        text: "User list"

module.exports = userController