React = require 'react-native'
{ StyleSheet, Text, View } = React

SquareObject = require('./SquareObject')
TouchableSquareObject = require('./TouchableSquareObject')
RespawningSquareObject = require('./RespawningSquareObject')
ScoreDisplay = require('./ScoreDisplay')

# Let's define how the gameboard works
class GameBoard extends React.Component

  constructor: (properties) ->
    super(properties)

    # Fill the gameboard with destroyable squares.
    @state = {
      numberOfActiveSquares: properties.numberOfActiveSquares
    }


  # This is run everytime the gameboard should change
  render: () ->

    return (
      {# This is the background for the screen}
      <View style={styles.container}>


        {# Make the header}
        <View style={styles.headerContainer}>
          {# This is the title}
          <Text style={styles.header}>Tap the squares!</Text>
          {#This displays the current score}
          <ScoreDisplay/>
        </View>

        {# Insert code here}
        {# This is the box}
        <SquareObject color='yellow'/>

        {# This is a touchable box}
        <TouchableSquareObject color='orange'/>

        {# This is an object that will respawn when touched}
        <RespawningSquareObject color='green'/>
      </View>
    )


styles = StyleSheet.create
  container:
    flex: 1
    flexDirection: 'column'
    justifyContent: 'space-around' # Make the title be at the top
    alignItems: 'center'
    backgroundColor: '#512DA8'

  headerContainer:
    flex: 1
    flexDirection: 'row'
    justifyContent: 'space-around' # Make the title be at the top
    # alignItems: 'center'
    backgroundColor: '#512DA8'

  header:
    fontSize: 20
    color: '#FFFFFF'
    margin: 15

GameBoard.defaultProps = {numberOfActiveSquares: 1}


module.exports = GameBoard
