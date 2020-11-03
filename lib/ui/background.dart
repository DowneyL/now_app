import 'dart:ui';

import "package:flutter/material.dart";
import 'package:now_app/theme/now_theme.dart';

class Mask extends StatelessWidget {
  final List<Color> colors;

  Mask({List<Color> colors})
      : this.colors = colors ??
            [
              NowTheme.orange.shade600,
              Colors.black,
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

class FrostedGlassMask extends StatelessWidget {
  final List<Color> colors;

  FrostedGlassMask({List<Color> colors})
      : this.colors = colors ??
            [
              NowTheme.orange.shade600.withOpacity(.8),
              Colors.black.withOpacity(.8),
            ];

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageBackground extends StatelessWidget {
  final String url;
  final Color color;

  ImageBackground({@required this.url, this.color});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Image.asset(
        url,
        fit: BoxFit.cover,
        color: color,
      ),
    );
  }
}
