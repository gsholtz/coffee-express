mongoose = require "mongoose"

userSchema = mongoose.Schema
  name: String
  age: Number
  email: String
  password: String
  creationDate: Date
  active: Boolean

User = mongoose.model "User", userSchema

module.exports = User