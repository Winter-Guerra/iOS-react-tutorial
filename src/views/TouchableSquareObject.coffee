React = require 'react-native'
{ StyleSheet, TouchableHighlight, View } = React

SquareObject = require('./SquareObject')

# This defines how to instantiate a square on the screen
class TouchableSquareObject extends SquareObject

  constructor: (properties) ->
    super(properties)

    # Make the square not die by default
    @state.destroyed = false

  render: () ->
    # Check if the object is destroyed

    return (

      {# Make the square touchable}
      <TouchableHighlight onPress={() => @destroyObject()}>
        { # get the rendered object for a normal square object via our parent class.
          super()}
      </TouchableHighlight>
    )

  # Let's make the square vanish!
  destroyObject: () ->
    # Let's tell the button that is should vanish. Then, the gameboard will remove it from memory on the next gameboard update.
    @setState({
      destroyed: true
      color: 'black'
      })

module.exports = TouchableSquareObject
