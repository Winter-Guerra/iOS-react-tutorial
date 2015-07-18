var GameBoard, React, Reflux, RespawningSquareObject, ScoredSquareObject, SquareObject, StyleSheet, Text, TouchableSquareObject, View, actions, store, styles;

React = require('react-native');

StyleSheet = React.StyleSheet, Text = React.Text, View = React.View;

Reflux = require('reflux');

actions = require('../GameBoardActions');

store = require('../GameBoardStore');

SquareObject = require('./SquareObject');

TouchableSquareObject = require('./TouchableSquareObject');

RespawningSquareObject = require('./RespawningSquareObject');

ScoredSquareObject = require('./ScoredSquareObject');

GameBoard = React.createClass({
  mixins: [Reflux.connect(store)],
  render: function() {
    return React.createElement(View, {
      "style": styles.container
    }, React.createElement(View, {
      "style": styles.headerContainer
    }, React.createElement(Text, {
      "style": styles.header
    }, "Tap the squares!"), React.createElement(Text, {
      "style": styles.score
    }, this.state.score)), React.createElement(ScoredSquareObject, {
      "color": 'green'
    }), React.createElement(ScoredSquareObject, {
      "color": 'red'
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
  headerContainer: {
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'space-around',
    backgroundColor: '#512DA8'
  },
  header: {
    fontSize: 20,
    color: '#FFFFFF',
    margin: 15
  },
  score: {
    fontSize: 20,
    color: '#FFFFFF',
    margin: 15
  }
});

module.exports = GameBoard;
