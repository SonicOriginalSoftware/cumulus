import 'package:code_repository/shell/body.dart';
import 'package:flutter/material.dart';

void drawerPressCallback(Widget widget, BuildContext context) {
  Navigator.of(context).pop();
  bodyController.sink.add(widget);
}
