import "package:flutter/material.dart";

import 'base.dart';
import "extension/double.dart";

class TopBar extends StatefulWidget {
  final List<Widget> actions;
  final IconThemeData actionsThemeData;
  final bool isGroup;

  TopBar({@required this.actions, this.actionsThemeData, this.isGroup});

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    Widget actions;

    if (widget.isGroup == true && widget.actions.length > 3) {
      var leading = widget.actions[0];
      var title = widget.actions[1];
      widget.actions.removeAt(0);
      widget.actions.removeAt(1);
      var others = widget.actions;
      actions = Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Stack(
            children: [leading],
            alignment: AlignmentDirectional.bottomStart,
          ),
          Stack(
            children: [title],
            alignment: AlignmentDirectional.bottomCenter,
          ),
          Stack(
            children: [
              SpacedRow(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                space: 5.0.px,
                children: others,
              )
            ],
            alignment: AlignmentDirectional.bottomEnd,
          ),
        ],
      );
    } else {
      actions = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: widget.actions,
      );
    }

    if (widget.actionsThemeData != null) {
      actions = IconTheme.merge(data: widget.actionsThemeData, child: actions);
    }

    return Container(
      color: Color(0xFFF96332),
      height: 100.0.px,
      padding: EdgeInsets.symmetric(horizontal: 20.0.px, vertical: 15.0.px),
      child: actions,
    );
  }
}
