mongoose = require "mongoose"

groupSchema = mongoose.Schema
  name: String
  creationDate: Date
  active: Boolean

Group = mongoose.model "Group", groupSchema

module.exports = Group