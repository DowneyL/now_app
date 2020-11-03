import 'package:flutter/material.dart';

const defaultUnderlineColor = Colors.grey;
const defaultTextColor = Colors.white;
const defaultPadding = EdgeInsets.all(0);

class SpacedRow extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double space;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline textBaseline;
  final List<Widget> children;

  SpacedRow({
    Key key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.children = const <Widget>[],
    this.space = 0,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> spacedChildren = <Widget>[];
    if (children.length > 1) {
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
    );
  }
}

class SpacedColumn extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double space;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline textBaseline;
  final List<Widget> children;

  SpacedColumn({
    Key key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.children = const <Widget>[],
    this.space = 0,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> spacedChildren = <Widget>[];
    if (children.length > 1) {
      for (var child in children) {
        spacedChildren.add(child);
        spacedChildren.add(SizedBox(height: space));
      }
      spacedChildren.removeLast();
    } else {
      spacedChildren = children;
    }
    return Column(
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
