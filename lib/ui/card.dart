import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'base.dart';
import 'extension/double.dart';
import 'extension/int.dart';

enum ArrowDirection {
  right,
  left,
  up,
  down,
}

class BackgroundImageCard extends StatelessWidget {
  static double _defaultTitleAndFootSpace = 30.0.px;

  final String background;
  final String title;
  final TextStyle textStyle;
  final double height;
  final EdgeInsetsGeometry padding;
  final Widget foot;
  final double titleAndFootSpace;

  BackgroundImageCard({
    @required this.title,
    @required this.background,
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
          image: AssetImage(background),
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
  final TextStyle textStyle;
  final bool fillWidth;

  SvgIconText({
    @required this.assetName,
    @required this.text,
    this.space,
    this.iconSize,
    this.iconColor,
    this.textStyle,
    this.fillWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SpacedRow(
      space: space ?? _defaultIconTextSpace,
      mainAxisSize: fillWidth ? MainAxisSize.max : MainAxisSize.min,
      children: [
        SvgPicture.asset(
          assetName,
          height: iconSize ?? _defaultIconSize,
          color: iconColor,
        ),
        Text(
          text,
          style: theme.textTheme.bodyText2.merge(textStyle ?? null),
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

class ArrowImageCard extends StatelessWidget {
  static double defaultArrowSize = 18.0.px;

  final double height;
  final double width;
  final ArrowDirection direction;
  final String title;
  final EdgeInsetsGeometry titlePadding;
  final TextStyle textStyle;
  final arrowSize;
  final Widget image;
  final Color backgroundColor;
  final EdgeInsetsGeometry infoCardPadding;
  final Widget foot;

  ArrowImageCard({
    @required this.direction,
    @required this.title,
    this.titlePadding,
    this.textStyle,
    this.height,
    this.width,
    @required this.image,
    this.arrowSize,
    this.backgroundColor,
    this.infoCardPadding,
    this.foot,
  });

  Widget _buildArrow() {
    String assetName;

    switch (direction) {
      case ArrowDirection.left:
        assetName = "assets/images/arrow_left.svg";
        break;
      case ArrowDirection.right:
        assetName = "assets/images/arrow_right.svg";
        break;
      case ArrowDirection.up:
        assetName = "assets/images/arrow_up.svg";
        break;
      case ArrowDirection.down:
        assetName = "assets/images/arrow_down.svg";
        break;
    }

    return SvgPicture.asset(
      assetName,
      width: arrowSize ?? defaultArrowSize,
      height: arrowSize ?? defaultArrowSize,
    );
  }

  Widget _buildImageFrameWithArrow(Widget arrow) {
    Alignment alignment;
    Widget imageFrame;

    switch (direction) {
      case ArrowDirection.left:
        alignment = Alignment.centerRight;
        imageFrame = Positioned(
          child: Align(alignment: alignment, child: arrow),
          right: -1,
        );
        break;
      case ArrowDirection.right:
        alignment = Alignment.centerLeft;
        imageFrame = Positioned(
          child: Align(alignment: alignment, child: arrow),
          left: -1,
        );
        break;
      case ArrowDirection.up:
        alignment = Alignment.bottomCenter;
        imageFrame = Positioned(
          child: Align(alignment: alignment, child: arrow),
          bottom: -1,
        );
        break;
      case ArrowDirection.down:
        alignment = Alignment.topCenter;
        imageFrame = Positioned(
          child: Align(alignment: alignment, child: arrow),
          top: -1,
        );
        break;
    }

    return imageFrame;
  }

  Widget _buildImageCard() {
    Widget arrow = _buildArrow();
    Widget imageFrameWithArrow = _buildImageFrameWithArrow(arrow);

    return Expanded(
      flex: 5,
      child: Stack(
        alignment: Alignment.center,
        children: [image, imageFrameWithArrow],
      ),
    );
  }

  Widget _buildInfoCard() {
    TextStyle defaultTextStyle;
    defaultTextStyle = textStyle ??
        TextStyle(
          color: Colors.black,
          fontSize: 22.px,
          fontWeight: FontWeight.bold,
          height: 1.6,
        );

    return Expanded(
      flex: 5,
      child: Stack(
        children: [
          Container(color: backgroundColor ?? Colors.white),
          Padding(
            padding: infoCardPadding ?? defaultPadding,
            child: Column(
              children: [
                Padding(
                  padding: titlePadding ?? defaultPadding,
                  child: Text(
                    title,
                    style: defaultTextStyle,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                foot ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Axis _getAxis() {
    Axis axis;
    switch (direction) {
      case ArrowDirection.left:
      case ArrowDirection.right:
        axis = Axis.horizontal;
        break;
      case ArrowDirection.up:
      case ArrowDirection.down:
        axis = Axis.vertical;
    }

    return axis;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children;
    Widget infoCard = _buildInfoCard();
    Widget imageCard = _buildImageCard();

    switch (direction) {
      case ArrowDirection.left:
      case ArrowDirection.up:
        children = [imageCard, infoCard];
        break;
      case ArrowDirection.right:
      case ArrowDirection.down:
        children = [infoCard, imageCard];
    }

    return Container(
      height: height,
      width: width,
      child: Flex(
        direction: _getAxis(),
        children: children,
      ),
    );
  }
}
