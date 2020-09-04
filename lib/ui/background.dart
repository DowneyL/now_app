import "package:flutter/material.dart";

class Mask extends StatelessWidget {
  final List<Color> colors;

  Mask({List<Color> colors})
      : this.colors = colors ??
            [
              Color.fromRGBO(235, 83, 34, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
    );
  }
}

class ImageBackground extends StatelessWidget {
  final String url;

  ImageBackground(this.url);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      fit: BoxFit.cover,
    );
  }
}
