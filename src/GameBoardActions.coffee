React = require 'react-native'
{ StyleSheet, Text, View } = React

# Import our dispatcher library
Reflux = require 'reflux'

module.exports = Reflux.createActions(
  [ "squareClick",
    "squareExpired",
    "gameOver",
    "gameBegin"
  ])
