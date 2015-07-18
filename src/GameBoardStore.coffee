React = require 'react-native'
{ StyleSheet, Text, View } = React

# Import our dispatcher library
Reflux = require 'reflux'

actions = require('./GameBoardActions')

Store = Reflux.createStore
  listenables: actions

  init: () ->
    @state=@getInitialState()

  getInitialState: () ->
    return {score: 0, gameRunning: true}

  onSquareClick: (squareColor) ->
    if squareColor is 'green'
      @state.score += 10
    else
      @state.score -= 10

    @trigger(@state)

  onSquareExpired: (squareColor) ->
    if squareColor is 'green'
      @state.score -= 10
    else
      @state.score += 10

    @trigger(@state)

  onGameOver: () ->
    @state.gameRunning = false
    @trigger(@state)

  onGameBegin: () ->
    @state.gameRunning = true
    @trigger(@state)

module.exports = Store
