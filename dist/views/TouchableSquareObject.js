var React, SquareObject, StyleSheet, TouchableHighlight, TouchableSquareObject, View, actions,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

React = require('react-native');

StyleSheet = React.StyleSheet, TouchableHighlight = React.TouchableHighlight, View = React.View;

SquareObject = require('./SquareObject');

actions = require('../GameBoardActions');

TouchableSquareObject = (function(superClass) {
  extend(TouchableSquareObject, superClass);

  function TouchableSquareObject(properties) {
    TouchableSquareObject.__super__.constructor.call(this, properties);
  }

  TouchableSquareObject.prototype.render = function() {
    return React.createElement(TouchableHighlight, {
      "onPress": ((function(_this) {
        return function() {
          return _this.handleTouch();
        };
      })(this))
    }, TouchableSquareObject.__super__.render.call(this));
  };

  TouchableSquareObject.prototype.handleTouch = function() {
    this.setState({
      color: 'black'
    });
    return actions.squareClick(this.props.color);
  };

  return TouchableSquareObject;

})(SquareObject);

module.exports = TouchableSquareObject;
