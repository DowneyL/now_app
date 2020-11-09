import "package:flutter/material.dart";
import 'package:now_app/theme/now_theme.dart';
import 'package:now_app/ui/now_ui.dart';

import "extension/double.dart";

class SolidRoundedButton extends StatelessWidget {
  final EdgeInsetsGeometry _defaultPadding = EdgeInsets.all(24.0.px);

  final double width;
  final String text;
  final TextStyle textStyle;
  final Color color;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  SolidRoundedButton({
    @required this.onPressed,
    this.width = double.infinity,
    this.text = "",
    this.textStyle,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: width,
      onPressed: onPressed,
      color: color,
      padding: padding ?? _defaultPadding,
      child: Text(text, style: NowTheme.textTheme().button.merge(textStyle)),
      shape: StadiumBorder(),
    );
  }
}

class HollowRoundedButton extends StatelessWidget {
  final double width;
  final String text;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final Color borderSideColor;

  HollowRoundedButton({
    @required this.onPressed,
    this.width = double.infinity,
    this.text,
    this.textStyle,
    this.padding,
    this.borderSideColor,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: width,
      onPressed: onPressed,
      color: Colors.transparent,
      padding: padding ?? EdgeInsets.all(24.0.px),
      child: Text(text, style: NowTheme.textTheme().button.merge(textStyle)),
      shape: StadiumBorder(
        side: BorderSide(
          color: borderSideColor ?? Color.fromRGBO(255, 255, 255, .5),
        ),
      ),
    );
  }
}

class BarIconButton extends StatelessWidget {
  BarIconButton({
    Key key,
    this.iconSize = 26.0,
    @required this.icon,
    @required this.onPressed,
    this.padding = const EdgeInsets.all(14.0),
  }) : super(key: key);

  BarIconButton.svgAsset(
    String assetName, {
    Key key,
    this.iconSize = 26.0,
    @required this.onPressed,
    this.padding = const EdgeInsets.all(14.0),
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
