import "package:flutter/material.dart";

import 'base.dart';

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
    IconThemeData actionsThemeData = widget.actionsThemeData ??
        IconThemeData(
          color: Colors.white,
          size: 34.0,
        );

    Widget actions;

    if (widget.isGroup == true && widget.actions.length > 3) {
      var leading = widget.actions[0];
      var title = widget.actions[1];
      widget.actions.removeAt(0);
      widget.actions.removeAt(1);
      var others = widget.actions;
      actions = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          leading,
          title,
          SpaceRow(
            space: 5,
            children: others,
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

    actions = IconTheme.merge(data: actionsThemeData, child: actions);

    return Container(
      color: Color.fromRGBO(235, 83, 34, 1),
      height: 100.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: actions,
    );
  }
}
