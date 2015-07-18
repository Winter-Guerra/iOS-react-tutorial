React = require 'react-native'
{ StyleSheet, TouchableHighlight, View } = React

SquareObject = require('./SquareObject')

# This defines how to instantiate a square on the screen
class TouchableSquareObject extends SquareObject

  constructor: (properties) ->
    super(properties)

  render: () ->
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

module.exports = TouchableSquareObject
