var React, Reflux, Store, StyleSheet, Text, View, actions;

React = require('react-native');

StyleSheet = React.StyleSheet, Text = React.Text, View = React.View;

Reflux = require('reflux');

actions = require('./GameBoardActions');

Store = Reflux.createStore({
  listenables: actions,
  init: function() {
    return this.state = this.getInitialState();
  },
  getInitialState: function() {
    return {
      score: 0,
      gameRunning: true
    };
  },
  onSquareClick: function(squareColor) {
    if (squareColor === 'green') {
      this.state.score += 10;
    } else {
      this.state.score -= 10;
    }
    return this.trigger(this.state);
  },
  onSquareExpired: function(squareColor) {
    if (squareColor === 'green') {
      this.state.score -= 10;
    } else {
      this.state.score += 10;
    }
    return this.trigger(this.state);
  },
  onGameOver: function() {
    this.state.gameRunning = false;
    return this.trigger(this.state);
  },
  onGameBegin: function() {
    this.state.gameRunning = true;
    return this.trigger(this.state);
  }
});

module.exports = Store;
