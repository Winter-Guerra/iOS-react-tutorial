React = require 'react-native'
{ StyleSheet, Text, View } = React
Reflux = require('reflux')

actions = require('../GameBoardActions')
store = require('../GameBoardStore')

SquareObject = require('./SquareObject')
TouchableSquareObject = require('./TouchableSquareObject')
RespawningSquareObject = require('./RespawningSquareObject')
ScoredSquareObject = require('./ScoredSquareObject')


# Let's define how the gameboard works
GameBoard = React.createClass
  # Connect the data store via flux
  mixins: [Reflux.connect(store)]

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
          <Text style={styles.score}>{this.state.score}</Text>
        </View>

        {# Insert code here}
        {# This is the box}
        {# <SquareObject color='yellow'/> }

        {# This is a touchable box}
        {# <TouchableSquareObject color='orange'/>}

        {# This is an object that will respawn when touched}
        <ScoredSquareObject color='green'/>
        <ScoredSquareObject color='red'/>
        <ScoredSquareObject color='green'/>
        <ScoredSquareObject color='red'/>
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

  score:
    fontSize: 20
    color: '#FFFFFF'
    margin: 15

# GameBoard.defaultProps = {numberOfActiveSquares: 1}


module.exports = GameBoard
