import "package:flutter/material.dart";
import 'package:now_app/theme/now_theme.dart';
import 'package:now_app/ui/now_ui.dart';

import "extension/double.dart";

class SolidRoundedButton extends StatelessWidget {
  final double width;
  final String text;
  final Color color;
  final VoidCallback onPressed;

  SolidRoundedButton({
    @required this.onPressed,
    double width,
    String text,
    this.color,
  })  : width = width ?? double.infinity,
        text = text ?? "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        child: RaisedButton(
          onPressed: onPressed,
          color: color,
          padding: EdgeInsets.all(24.0.px),
          child: Text(text, style: NowTheme.textTheme().button),
        ),
      ),
    );
  }
}

class HollowRoundedButton extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback onPressed;

  HollowRoundedButton({
    @required this.onPressed,
    double width,
    String text,
  })  : width = width ?? double.infinity,
        text = text ?? "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(255, 255, 255, .5),
        ),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      child: FlatButton(
        onPressed: onPressed,
        color: Colors.transparent,
        padding: EdgeInsets.all(24.0.px),
        child: Text(text, style: NowTheme.textTheme().button),
      ),
    );
  }
}

class SvgIconButton extends StatelessWidget {
  SvgIconButton({
    Key key,
    this.iconSize = 26.0,
    @required this.icon,
    @required this.onPressed,
    this.padding = const EdgeInsets.all(12.0),
  }) : super(key: key);

  SvgIconButton.asset(
    String assetName, {
    Key key,
    this.iconSize = 26.0,
    @required this.onPressed,
    this.padding = const EdgeInsets.all(12.0),
  })  : icon = SvgPicture.asset(assetName),
        super(key: key);

  final double iconSize;
  final Widget icon;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(
      padding: padding,
      child: SizedBox(
        width: iconSize.px,
        height: iconSize.px,
        child: icon,
      ),
    );
    return InkResponse(
      onTap: onPressed,
      child: child,
    );
  }
}
