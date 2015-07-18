var React, RespawningSquareObject, ScoredSquareObject, StyleSheet, View, actions,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

React = require('react-native');

StyleSheet = React.StyleSheet, View = React.View;

RespawningSquareObject = require('./RespawningSquareObject');

actions = require('../GameBoardActions');

ScoredSquareObject = (function(superClass) {
  extend(ScoredSquareObject, superClass);

  function ScoredSquareObject(properties) {
    ScoredSquareObject.__super__.constructor.call(this, properties);
    this.setTimer();
  }

  ScoredSquareObject.prototype.setTimer = function() {
    var selfDestruct;
    selfDestruct = (function(_this) {
      return function() {
        actions.squareExpired(_this.props.color);
        return _this.setNewRandomLocation();
      };
    })(this);
    return this.state.timer = setInterval(selfDestruct, 5000);
  };

  ScoredSquareObject.prototype.render = function() {
    return ScoredSquareObject.__super__.render.call(this);
  };

  ScoredSquareObject.prototype.handleTouch = function() {
    ScoredSquareObject.__super__.handleTouch.call(this);
    actions.squareClick(this.props.color);
    clearInterval(this.state.timer);
    return this.setTimer();
  };

  return ScoredSquareObject;

})(RespawningSquareObject);

module.exports = ScoredSquareObject;
