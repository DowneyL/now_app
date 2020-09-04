import "package:flutter/material.dart";
import "pages/user/register.dart";
import "pages/user/login.dart";

class Routers {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.routeName: (context) => LoginPage(),
    RegisterPage.routerName: (context) => RegisterPage(),
  };

  static final initialRoute = LoginPage.routeName;
}
