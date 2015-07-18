var React, Reflux, StyleSheet, Text, View;

React = require('react-native');

StyleSheet = React.StyleSheet, Text = React.Text, View = React.View;

Reflux = require('reflux');

module.exports = Reflux.createActions(["squareClick", "squareExpired", "gameOver", "gameBegin"]);
