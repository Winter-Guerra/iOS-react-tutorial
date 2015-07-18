var App, GameBoard, React;

React = require('react-native');

GameBoard = require('./views/GameBoard');

App = React.createClass({
  render: function() {
    return React.createElement(GameBoard, null);
  }
});

module.exports = App;
