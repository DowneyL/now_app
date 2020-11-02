import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'base.dart';
import 'extension/double.dart';

class ImageCard extends StatelessWidget {
  static double _defaultTitleAndFootSpace = 30.0.px;

  final String coverImage;
  final String title;
  final TextStyle textStyle;
  final double height;
  final EdgeInsetsGeometry padding;
  final SpaceBetweenCardFoot foot;
  final double titleAndFootSpace;

  ImageCard({
    @required this.title,
    @required this.coverImage,
    this.textStyle,
    this.padding,
    this.height,
    this.foot,
    this.titleAndFootSpace,
  });

  Widget _buildFirstTopicBackground() {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(coverImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFirstTopicTitle(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle defaultTextStyle;
    if (textStyle == null) {
      defaultTextStyle = theme.textTheme.headline4.copyWith(
        color: Colors.white,
        height: 1.6,
        fontWeight: FontWeight.w700,
        fontSize: 40.0.px,
      );
    } else {
      defaultTextStyle = textStyle;
    }

    return Padding(
      padding: EdgeInsets.only(right: 120.0.px),
      child: Text(
        title,
        style: defaultTextStyle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildFirstTopicBackground(),
        Container(
          height: height,
          child: Padding(
            padding: padding ?? defaultPadding,
            child: SpacedColumn(
              space: titleAndFootSpace ?? _defaultTitleAndFootSpace,
              children: [_buildFirstTopicTitle(context), foot],
            ),
          ),
        )
      ],
    );
  }
}

class SpaceBetweenCardFoot extends StatelessWidget {
  final double actionSpace;
  final List<Widget> startActions;
  final List<Widget> endActions;

  SpaceBetweenCardFoot({
    @required this.startActions,
    @required this.endActions,
    this.actionSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpacedRow(space: actionSpace, children: startActions),
        SpacedRow(space: actionSpace, children: endActions),
      ],
    );
  }
}

class SvgIconText extends StatelessWidget {
  static double _defaultIconTextSpace = 2.0.px;
  static double _defaultIconSize = 28.0.px;

  final double space;
  final String assetName;
  final double iconSize;
  final Color iconColor;
  final String text;
  final Color textColor;

  SvgIconText({
    @required this.assetName,
    @required this.text,
    this.space,
    this.iconSize,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SpacedRow(
      space: space ?? _defaultIconTextSpace,
      children: [
        SvgPicture.asset(
          assetName,
          height: iconSize ?? _defaultIconSize,
          color: iconColor,
        ),
        Text(
          text,
          style: theme.textTheme.bodyText2.copyWith(color: textColor),
        ),
      ],
    );
  }
}

class CustomUnderlineText extends StatelessWidget {
  final double space;
  final String text;
  final double fontSize;
  final Color textColor;
  final Color underlineColor;
  final EdgeInsetsGeometry underlinePadding;

  CustomUnderlineText({
    @required this.text,
    this.underlinePadding,
    this.space,
    this.fontSize,
    this.textColor,
    this.underlineColor,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return IntrinsicWidth(
      child: SpacedColumn(
        space: space,
        children: [
          Text(
            text,
            style: theme.textTheme.bodyText2.copyWith(
              fontSize: fontSize,
              color: textColor ?? defaultTextColor,
            ),
          ),
          Padding(
            padding: underlinePadding ?? defaultPadding,
            child: Container(
              height: 1,
              color: underlineColor ?? defaultUnderlineColor,
            ),
          )
        ],
      ),
    );
  }
}
