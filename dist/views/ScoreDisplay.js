var React, ScoreDisplay, StyleSheet, Text, View, styles,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

React = require('react-native');

StyleSheet = React.StyleSheet, Text = React.Text, View = React.View;

ScoreDisplay = (function(superClass) {
  extend(ScoreDisplay, superClass);

  function ScoreDisplay(properties) {
    ScoreDisplay.__super__.constructor.call(this, properties);
    this.state = {
      score: 0
    };
  }

  ScoreDisplay.prototype.render = function() {
    return React.createElement(Text, {
      "style": styles.score
    }, "Score: ", String(this.state.score));
  };

  return ScoreDisplay;

})(React.Component);

styles = StyleSheet.create({
  score: {
    fontSize: 20,
    color: '#FFFFFF',
    margin: 15
  }
});

module.exports = ScoreDisplay;
