var GameBoard, React, SquareObject, StyleSheet, Text, View, styles;

React = require('react-native');

StyleSheet = React.StyleSheet, Text = React.Text, View = React.View;

SquareObject = require('./SquareObject');

GameBoard = React.createClass({
  render: function() {
    return React.createElement(View, {
      "style": styles.container
    }, React.createElement(Text, {
      "style": styles.header
    }, "Make a square!"), React.createElement(SquareObject, {
      "color": 'yellow'
    }));
  }
});

styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'space-around',
    alignItems: 'center',
    backgroundColor: '#512DA8'
  },
  header: {
    fontSize: 20,
    color: '#FFFFFF',
    margin: 15
  }
});

module.exports = GameBoard;
