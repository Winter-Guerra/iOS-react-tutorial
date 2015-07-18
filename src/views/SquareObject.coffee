React = require 'react-native'
{ StyleSheet, View } = React

# This defines how to instantiate a square on the screen
class SquareObject extends React.Component

  constructor: (properties) ->
    super(properties)
    @state = {
      color: properties.color
  }

  render: () =>
    # Style the square in size and color
    squareStyle =
      width: 50
      height: 50
      backgroundColor: @state.color

    # Render the square
    return <View style={squareStyle}/>

# Define the default starting state for our square
SquareObject.defaultProps = {color:'green'}

module.exports = SquareObject
