React = require 'react-native'
{ StyleSheet, Text, View } = React

SquareObject = require('./SquareObject')
TouchableSquareObject = require('./TouchableSquareObject')

# Let's define how the gameboard works
class GameBoard extends React.Component

  constructor: (properties) ->
    super(properties)

    # Fill the gameboard with destroyable squares.
    @state = {
      numberOfActiveSquares: properties.numberOfActiveSquares,
      # keysOfActiveSquareObjects: [0...properties.numberOfActiveSquares]
    }

    # Populate the game board with destroyable squares
    @refillGameBoard()

  # This is run everytime the gameboard should change
  render: () ->

    # Let's take the opportunity to update the gameboard
    @pruneGameBoard()
    @refillGameBoard()

    return (
      {# This is the background for the screen}
      <View style={styles.container}>

        {# This is the header}
        <Text style={styles.header}>Make a square!</Text>

        {# Insert code here}
        {# This is the box}
        <SquareObject color='yellow'/>

        {# This is a touchable box}
        <TouchableSquareObject color='orange'/>
      </View>
    )


  # This removes all dead square objects from our gameBoard
  pruneGameBoard: () ->
    return
    # @state.listOfActiveSquareObjects = square for square in @state.listOfActiveSquareObjects if not square.isDestroyed()

  # This adds new square objects to our game board to refill the slots left by the destroyed squares
  refillGameBoard: () ->
    return
    # while len(@state.listOfActiveSquareObjects) < @state.numberOfActiveSquares
    #   # Make a new square
    #   @state.listOfActiveSquareObjects.push( TouchableSquareObject() )


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

GameBoard.defaultProps = {numberOfActiveSquares: 1}


module.exports = GameBoard
