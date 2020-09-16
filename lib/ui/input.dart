import "package:flutter/material.dart";
import "extension/double.dart";

class Input extends StatelessWidget {
  final String text;
  final Widget icon;
  final bool obscureText;
  final TextEditingController controller;
  final double width;
  final EdgeInsetsGeometry padding;

  Input({
    this.text,
    this.icon,
    this.controller,
    bool obscureText,
    double width,
    EdgeInsetsGeometry padding,
  })  : width = width ?? double.infinity,
        obscureText = obscureText ?? false,
        padding = padding ??
            EdgeInsets.symmetric(horizontal: 36.0.px, vertical: 14.0.px);

  final TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0.px,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: width,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, .1),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Padding(
        padding: padding,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          enableInteractiveSelection: false,
          cursorWidth: 1.0,
          cursorColor: Color.fromRGBO(255, 255, 255, .5),
          style: textStyle,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: text,
            hintStyle: textStyle,
            icon: icon,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0.px),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
