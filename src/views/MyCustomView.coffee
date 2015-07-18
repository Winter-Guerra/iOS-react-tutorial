React = require 'react-native'
{ StyleSheet, Text, View } = React

MyCustomView = React.createClass
  render: () ->

    {# This is the background for the screen}
    <View style={styles.container}>

      {# This is the header}
      <Text style={styles.header}>
        Make a square!
      </Text>

      {# Insert code here}
      {# This is the box}
      <View style={styles.square}/>
    </View>


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

  square:
    width: 50
    height: 50
    backgroundColor: 'red'


module.exports = MyCustomView
