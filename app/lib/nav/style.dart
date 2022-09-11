import 'package:flutter/material.dart';

const double _topPadding = 20;
const double _bottomPadding = _topPadding;
const double _leftPadding = 10;
const double _rightPadding = _leftPadding;

ButtonStyle navBarButtonStyle = TextButton.styleFrom(
  padding: const EdgeInsets.only(
    bottom: _bottomPadding,
    top: _topPadding,
    left: _leftPadding,
    right: _rightPadding,
  ),
);
