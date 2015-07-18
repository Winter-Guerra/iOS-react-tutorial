React = require 'react-native'
{ StyleSheet, TouchableHighlight, View } = React

SquareObject = require('./SquareObject')

actions = require('../GameBoardActions')

# This defines how to instantiate a square on the screen
class TouchableSquareObject extends SquareObject

  constructor: (properties) ->
    super(properties)

  render: () ->
    # Check if the object is destroyed

    return (

      {# Make the square touchable}
      <TouchableHighlight onPress={() => @handleTouch()}>
        { # get the rendered object for a normal square object via our parent class.
          super()}
      </TouchableHighlight>
    )

  # Let's make the square vanish!
  handleTouch: () ->
    # Let's tell the button that is should vanish. Then, the gameboard will remove it from memory on the next gameboard update.
    @setState({
      color: 'black'
      })

    # Tell the action dispatcher that a click event has been made
    actions.squareClick(@props.color)

module.exports = TouchableSquareObject
