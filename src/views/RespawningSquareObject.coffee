React = require 'react-native'
{ StyleSheet, TouchableHighlight, View } = React
{wait, repeat, doAndRepeat, waitUntil} = require 'wait'
Dimensions = require('Dimensions')

TouchableSquareObject = require('./TouchableSquareObject')

getRandomNumberWithRange = (maxValue) ->
  return Math.random() * maxValue

screenWidth = Dimensions.get('window').width - 25
screenHeight = Dimensions.get('window').height - 25

class RespawningSquareObject extends TouchableSquareObject

  constructor: (properties) ->
    super(properties)

    # Spawn the square in a random location on the screen
    @state.x = getRandomNumberWithRange(screenWidth)
    @state.y = getRandomNumberWithRange(screenHeight)


  render: () ->
    style = StyleSheet.create
      square:
        # flex:1
        position: 'absolute'
        left: @state.x
        bottom: @state.y

    return(
      <View style={style.square}>
        {super()}
      </View>
    )

  # Extend the parent class's destructor function to also respawn the object somewhere else
  handleTouch: () ->
    super()

    # Respawn the object immediately
    @setState({
        x: getRandomNumberWithRange(screenWidth)
        y: getRandomNumberWithRange(screenHeight)
        color: @props.color
      })

    # console.log @state

module.exports = RespawningSquareObject
