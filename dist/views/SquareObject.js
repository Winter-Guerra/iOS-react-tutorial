var React, SquareObject, StyleSheet, Text, View,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

React = require('react-native');

StyleSheet = React.StyleSheet, Text = React.Text, View = React.View;

SquareObject = (function(superClass) {
  extend(SquareObject, superClass);

  function SquareObject(properties) {
    SquareObject.__super__.constructor.call(this, properties);
    this.state = {
      color: properties.color
    };
  }

  SquareObject.prototype.render = function() {
    var squareStyle;
    squareStyle = {
      width: 50,
      height: 50,
      backgroundColor: this.state.color
    };
    return React.createElement(View, {
      "style": squareStyle
    });
  };

  return SquareObject;

})(React.Component);

SquareObject.defaultProps = {
  color: 'green'
};

module.exports = SquareObject;
