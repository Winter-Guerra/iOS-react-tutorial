React = require 'react-native'
{ StyleSheet, TouchableHighlight, View } = React
{wait, repeat, doAndRepeat, waitUntil} = require 'wait'
# Dimensions = require('Dimensions')

TouchableSquareObject = require('./TouchableSquareObject')

getRandomNumberWithRange = (maxValue) ->
  return Math.random() * maxValue

class RespawningSquareObject extends TouchableSquareObject

  constructor: (properties) ->
    super(properties)

    # Spawn the square in a random location on the screen
    @state.x = getRandomNumberWithRange(100)
    @state.y = getRandomNumberWithRange(100)

  render: () ->
    style = StyleSheet.create
      square:
        # flex:1
        position: 'absolute'
        left: @state.x
        bottom: @state.y

    console.log

    return(
      <View style={style.square}>
        {super()}
      </View>
    )

  # Extend the parent class's destructor function to also respawn the object somewhere else
  destroyObject: () ->
    super()

    # Respawn the object immediately
    @setState({
        x: Math.random()*100.0
        y: Math.random()*100.0
        destroyed: false
      })

module.exports = RespawningSquareObject
