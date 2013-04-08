User = require("../models/user")

userController = 
  index: 
    get: (req, res) ->
      User.find (err, users) ->
        if err
          console.log err
        else
          res.render "user/index",
            users: users

  edit:
    get: (req, res) ->
      if req.params.id
        User.find
          _id: req.params.id 
          (err, users) ->
            if err
              console.log err
            else
              res.render "user/edit",
                user: users[0]
      else
        res.redirect "user"

    post: (req, res) ->
      if req.body.id
        User.update
          _id: req.body.id
        ,
          name: req.body.name
          email: req.body.email
          password: req.body.password
          active: req.body.active
        .exec()
        res.redirect "user"

module.exports = userController