import 'package:flutter/material.dart';
import 'package:now_app/ui/now_ui.dart';

class MenusModel {
  static double _defaultIconSize = 20.0.px;

  final String assetName;
  final String title;
  final double iconSize;
  final Widget page;

  MenusModel({
    @required this.assetName,
    @required this.title,
    @required this.page,
    double iconSize,
  }) : iconSize = iconSize ?? _defaultIconSize;
}
