React = require 'react-native'

GameBoard = require './views/GameBoard'

App = React.createClass
  render: ->
    return(<GameBoard/>)

module.exports = App
