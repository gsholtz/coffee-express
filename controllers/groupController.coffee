Group = require "../models/group"

groupController = 
  index: 
    get: (req, res) ->
      Group.find (err, groups) ->
        if err
          console.log err
        else
          res.render "group/index",
            groups: groups

module.exports = groupController