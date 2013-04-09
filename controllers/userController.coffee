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

  create:
    get: (req, res) ->
      res.render "user/edit",
        user: new User
          _id: 0

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
      if req.body.id != ""
        User.update
          _id: req.body.id
        ,
          name: req.body.name
          email: req.body.email
          password: req.body.password
          active: req.body.active
        .exec()
      else
        user = new User(req.body)
        user.creationDate = new Date()
        user.save()
      res.redirect "user"

  delete:
    post: (req, res) ->
      if req.body.id
        User.find
          _id: req.body.id
          (err, users) ->
            if users.length > 0
              users[0].remove()
              res.json
                removed: true,
                id: req.body.id



module.exports = userController