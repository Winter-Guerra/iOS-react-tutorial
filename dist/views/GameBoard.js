var GameBoard, React, RespawningSquareObject, SquareObject, StyleSheet, Text, TouchableSquareObject, View, styles,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

React = require('react-native');

StyleSheet = React.StyleSheet, Text = React.Text, View = React.View;

SquareObject = require('./SquareObject');

TouchableSquareObject = require('./TouchableSquareObject');

RespawningSquareObject = require('./RespawningSquareObject');

GameBoard = (function(superClass) {
  extend(GameBoard, superClass);

  function GameBoard(properties) {
    GameBoard.__super__.constructor.call(this, properties);
    this.state = {
      numberOfActiveSquares: properties.numberOfActiveSquares
    };
    this.refillGameBoard();
  }

  GameBoard.prototype.render = function() {
    this.pruneGameBoard();
    this.refillGameBoard();
    return React.createElement(View, {
      "style": styles.container
    }, React.createElement(Text, {
      "style": styles.header
    }, "Make a square!"), React.createElement(SquareObject, {
      "color": 'yellow'
    }), React.createElement(TouchableSquareObject, {
      "color": 'orange'
    }), React.createElement(RespawningSquareObject, {
      "color": 'green'
    }));
  };

  GameBoard.prototype.pruneGameBoard = function() {};

  GameBoard.prototype.refillGameBoard = function() {};

  return GameBoard;

})(React.Component);

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

GameBoard.defaultProps = {
  numberOfActiveSquares: 1
};

module.exports = GameBoard;
