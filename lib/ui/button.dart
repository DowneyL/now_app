import "package:flutter/material.dart";
import "extension/double.dart";

class SolidButton extends StatelessWidget {
  final double width;
  final String text;
  final Color color;
  final VoidCallback onPressed;

  SolidButton({
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
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0.px,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class HollowButton extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback onPressed;

  HollowButton({
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
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.0.px,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
