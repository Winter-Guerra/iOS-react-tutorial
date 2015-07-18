var React, RespawningSquareObject, ScoredSquareObject, StyleSheet, View, actions, doAndRepeat, ref, repeat, wait, waitUntil,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

React = require('react-native');

StyleSheet = React.StyleSheet, View = React.View;

ref = require('wait'), wait = ref.wait, repeat = ref.repeat, doAndRepeat = ref.doAndRepeat, waitUntil = ref.waitUntil;

RespawningSquareObject = require('./RespawningSquareObject');

actions = require('../GameBoardActions');

ScoredSquareObject = (function(superClass) {
  extend(ScoredSquareObject, superClass);

  function ScoredSquareObject(properties) {
    ScoredSquareObject.__super__.constructor.call(this, properties);
  }

  ScoredSquareObject.prototype.render = function() {
    return ScoredSquareObject.__super__.render.call(this);
  };

  ScoredSquareObject.prototype.handleTouch = function() {
    ScoredSquareObject.__super__.handleTouch.call(this);
    return actions.squareClick(this.props.color);
  };

  return ScoredSquareObject;

})(RespawningSquareObject);

module.exports = ScoredSquareObject;
