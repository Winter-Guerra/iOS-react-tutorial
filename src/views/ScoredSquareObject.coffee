React = require 'react-native'
{ StyleSheet, View } = React
# {wait, repeat, doAndRepeat, waitUntil} = require 'wait'
# tweenState = require('react-tween-state')

RespawningSquareObject = require('./RespawningSquareObject')

actions = require('../GameBoardActions')

class ScoredSquareObject extends RespawningSquareObject

  constructor: (properties) ->
    super(properties)

    # Let us put a time to live timer on the blocks
    # console.log wait
    @setTimer()

  setTimer: () ->

    selfDestruct = () =>
      actions.squareExpired(@props.color)
      @setNewRandomLocation()

    @state.timer = setInterval( selfDestruct, 5000)

  render: () ->

    # This outer view dynamically takes in opacity from the animation going on in the background
    return super()



  handleTouch: () ->
    super()

    # Tell the scoreboard that a click event has been made
    actions.squareClick(@props.color)

    # restart the timer
    clearInterval(@state.timer)
    @setTimer()


module.exports = ScoredSquareObject
