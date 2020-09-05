import 'package:flutter/material.dart';

class SpaceRow extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final double space;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline textBaseline;
  final List<Widget> children;

  SpaceRow({
    Key key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.children = const <Widget>[],
    this.space = 0,
  });

  @override
  Widget build(BuildContext context) {
    var count = children.length;
    List<Widget> spacedChildren = <Widget>[];
    if (count > 1) {
      for (var child in children) {
        spacedChildren.add(child);
        spacedChildren.add(SizedBox(width: space));
      }
      spacedChildren.removeLast();
    } else {
      spacedChildren = children;
    }
    return Row(
      children: spacedChildren,
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
    );
  }
}
