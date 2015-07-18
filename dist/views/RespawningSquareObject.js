var Dimensions, React, RespawningSquareObject, StyleSheet, TouchableHighlight, TouchableSquareObject, View, getRandomNumberWithRange, screenHeight, screenWidth,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

React = require('react-native');

StyleSheet = React.StyleSheet, TouchableHighlight = React.TouchableHighlight, View = React.View;

Dimensions = require('Dimensions');

TouchableSquareObject = require('./TouchableSquareObject');

getRandomNumberWithRange = function(maxValue) {
  return Math.random() * maxValue;
};

screenWidth = Dimensions.get('window').width - 25;

screenHeight = Dimensions.get('window').height - 25;

RespawningSquareObject = (function(superClass) {
  extend(RespawningSquareObject, superClass);

  function RespawningSquareObject(properties) {
    RespawningSquareObject.__super__.constructor.call(this, properties);
    this.state.x = getRandomNumberWithRange(screenWidth);
    this.state.y = getRandomNumberWithRange(screenHeight);
  }

  RespawningSquareObject.prototype.render = function() {
    var style;
    style = StyleSheet.create({
      square: {
        position: 'absolute',
        left: this.state.x,
        bottom: this.state.y
      }
    });
    return React.createElement(View, {
      "style": style.square
    }, RespawningSquareObject.__super__.render.call(this));
  };

  RespawningSquareObject.prototype.handleTouch = function() {
    RespawningSquareObject.__super__.handleTouch.call(this);
    return this.setState({
      x: getRandomNumberWithRange(screenWidth),
      y: getRandomNumberWithRange(screenHeight),
      color: this.props.color
    });
  };

  return RespawningSquareObject;

})(TouchableSquareObject);

module.exports = RespawningSquareObject;
