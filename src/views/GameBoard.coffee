React = require 'react-native'
{ StyleSheet, Text, View } = React

SquareObject = require('./SquareObject')

# Let's define how the gameboard works
GameBoard = React.createClass

  # This is run everytime the gameboard should change
  render: () ->

    return (
      {# This is the background for the screen}
      <View style={styles.container}>

        {# This is the header}
        <Text style={styles.header}>Make a square!</Text>

        {# Insert code here}
        {# This is the box}
        <SquareObject color='yellow'/>
      </View>
    )

styles = StyleSheet.create
  container:
    flex: 1
    flexDirection: 'column'
    justifyContent: 'space-around' # Make the title be at the top
    alignItems: 'center'
    backgroundColor: '#512DA8'

  header:
    fontSize: 20
    color: '#FFFFFF'
    margin: 15


module.exports = GameBoard
