React = require 'react-native'
{ StyleSheet, Text, View } = React


class ScoreDisplay extends React.Component

  constructor: (properties) ->
    super(properties)

    @state = {
      score: 0
    }

  render: () ->
    
    return(
      <Text style={styles.score}>Score: {String(this.state.score)}</Text>
    )

styles = StyleSheet.create
  score:
    fontSize: 20
    color: '#FFFFFF'
    margin: 15

module.exports = ScoreDisplay
