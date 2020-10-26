import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:now_app/ui/now_ui.dart';

import "extension/double.dart";

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout(this.toolbarHeight);

  final double toolbarHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: toolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, toolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) =>
      toolbarHeight != oldDelegate.toolbarHeight;
}

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  TopBar({
    Key key,
    this.leaders,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.size = 26.0,
    this.primary = true,
    this.toolBarHeight,
    this.backgroundColor,
    this.brightness,
    this.elevation,
    this.shadowColor,
    this.shape,
  })  : preferredSize = Size.fromHeight(toolBarHeight ?? kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  final double toolBarHeight;

  final List<Widget> leaders;

  final bool automaticallyImplyLeading;

  final Widget title;

  final List<Widget> actions;

  final double size;

  final bool primary;

  final Color backgroundColor;

  final Brightness brightness;

  final double elevation;

  final Color shadowColor;

  final ShapeBorder shape;

  State createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  static const double _defaultElevation = 1.0;
  static const Color _defaultShadowColor = Color(0xFF000000);

  Widget _closeButton(BuildContext context) {
    return SvgIconButton.asset(
      "assets/images/cancel.svg",
      iconSize: widget.size.px,
      onPressed: () => Navigator.maybePop(context),
    );
  }

  Widget _backButton(BuildContext context) {
    return SvgIconButton.asset(
      "assets/images/back.svg",
      iconSize: widget.size.px,
      onPressed: () => Navigator.maybePop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData themeData = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final ScaffoldState scaffold = Scaffold.of(context, nullOk: true);
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);

    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    final double toolBarHeight = widget.toolBarHeight ?? kToolbarHeight;

    Widget leading;
    if (widget.leaders != null && widget.leaders.isNotEmpty) {
      leading = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.leaders,
      );
    } else {
      if (hasDrawer) {
        leading = SvgIconButton.asset(
          "assets/images/menu.svg",
          iconSize: widget.size.px,
          onPressed: () => scaffold.openDrawer(),
        );
      }
      if (canPop) {
        leading = useCloseButton ? _closeButton(context) : _backButton(context);
      }
    }

    Widget title = widget.title ??
        SvgPicture.asset(
          "assets/images/logo.svg",
          width: (widget.size - 3).px,
          height: (widget.size - 3).px,
        );

    Widget actions;
    if (widget.actions != null && widget.actions.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.actions,
      );
    } else {
      if (hasEndDrawer) {
        actions = SvgIconButton.asset(
          "assets/images/menu.svg",
          iconSize: widget.size.px,
          onPressed: () => scaffold.openEndDrawer(),
        );
      } else {}
    }

    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: true,
    );

    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: _ToolbarContainerLayout(toolBarHeight),
        child: toolbar,
      ),
    );

    if (widget.primary) {
      appBar = SafeArea(
        bottom: false,
        top: true,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    final Brightness brightness = widget.brightness ??
        appBarTheme.brightness ??
        themeData.primaryColorBrightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Material(
        color: widget.backgroundColor ??
            appBarTheme.color ??
            themeData.primaryColor,
        elevation:
            widget.elevation ?? appBarTheme.elevation ?? _defaultElevation,
        shadowColor: widget.shadowColor ??
            appBarTheme.shadowColor ??
            _defaultShadowColor,
        shape: widget.shape,
        child: appBar,
      ),
    );
  }
}
