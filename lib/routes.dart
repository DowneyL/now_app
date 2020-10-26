import "package:flutter/material.dart";

import "pages/user/login.dart";
import "pages/user/register.dart";

class Routers {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.routerName: (context) => LoginPage(),
    RegisterPage.routerName: (context) => RegisterPage(),
  };

  static final initialRoute = LoginPage.routerName;
}
