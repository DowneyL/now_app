import "package:flutter/material.dart";

import 'pages/home.dart';
import "pages/user/login.dart";
import "pages/user/register.dart";

class Routers {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.routerName: (context) => LoginPage(),
    RegisterPage.routerName: (context) => RegisterPage(),
    HomePage.routerName: (context) => HomePage(),
  };

  static final initialRoute = HomePage.routerName;
}
