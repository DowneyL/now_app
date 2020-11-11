import "package:flutter/material.dart";

import 'pages/channel/home.dart';
import 'pages/topic/home.dart';
import "pages/user/login.dart";
import "pages/user/register.dart";

class Routers {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.routerName: (context) => LoginPage(),
    RegisterPage.routerName: (context) => RegisterPage(),
    HomePage.routerName: (context) => HomePage(),
    ChannelHomePage.routerName: (context) => ChannelHomePage(),
  };

  static final initialRoute = HomePage.routerName;

  static PageRouteBuilder fadePageRouteBuilder(
      String routeName, Object arguments) {
    WidgetBuilder widgetBuilder = routes[routeName];
    if (widgetBuilder == null) {
      // TODO: Unknown Page
      widgetBuilder = (context) => HomePage();
    }

    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: widgetBuilder(context),
        );
      },
      settings: RouteSettings(
        arguments: arguments,
      ),
    );
  }
}
