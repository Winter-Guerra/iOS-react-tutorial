React = require 'react-native'
{ Animated, StyleSheet, View } = React
# {wait, repeat, doAndRepeat, waitUntil} = require 'wait'

RespawningSquareObject = require('./RespawningSquareObject')

actions = require('../GameBoardActions')

class ScoredSquareObject extends RespawningSquareObject

  constructor: (properties) ->
    super(properties)

    # Let us slowly making the square vanish via animated fading
    console.log Animated
    @state.opacity = new Animated.Value(0)
    @state.animation = undefined

  render: () ->

    # This outer view dynamically takes in opacity from the animation going on in the background
    return(
      <View style={@getStyle()}>
        super()
      </View>
    )

  getStyle: () ->
    return{
      transform: [{opacity: @state.opacity}]
    }

  # This function runs once the object is rendered. This is when our animation should start.
  componentDidMount: () ->
    @state.opacity.setValue(1) # Start at full opacity

     # Give us 5 seconds to click the button
    @state.animation = Animated.timing( @state.opacity, {toValue:0, duration:5000} )

    @state.animation.start (result) =>
      # This function is run after the animation is finished or stopped.
      if result.finished
        # Tell the scoreboard that we did not touch the square in time.
        actions.squareExpired(@props.color)

  handleTouch: () ->
    super()

    # Tell the scoreboard that a click event has been made
    actions.squareClick(@props.color)

    # Stop the fading animation
    @state.animation.stop()

module.exports = ScoredSquareObject
