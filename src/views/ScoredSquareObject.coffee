React = require 'react-native'
{ StyleSheet, View } = React
{wait, repeat, doAndRepeat, waitUntil} = require 'wait'

RespawningSquareObject = require('./RespawningSquareObject')

actions = require('../GameBoardActions')

class ScoredSquareObject extends RespawningSquareObject

  constructor: (properties) ->
    super(properties)

    # Let us slowly making the square vanish via animated fading
    # console.log Animated
    # @state.opacity = new Animated.Value(0)
    # @state.animation = undefined

  render: () ->

    # This outer view dynamically takes in opacity from the animation going on in the background
    return super()



  handleTouch: () ->
    super()

    # Tell the scoreboard that a click event has been made
    actions.squareClick(@props.color)

    # Stop the fading animation
    # @state.animation.stop()

module.exports = ScoredSquareObject
