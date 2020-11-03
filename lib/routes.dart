import "package:flutter/material.dart";

import 'pages/category/category.dart';
import 'pages/topic/home.dart';
import "pages/user/login.dart";
import "pages/user/register.dart";

class Routers {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.routerName: (context) => LoginPage(),
    RegisterPage.routerName: (context) => RegisterPage(),
    HomePage.routerName: (context) => HomePage(),
    CategoryPage.routerName: (context) => CategoryPage(),
  };

  static final initialRoute = HomePage.routerName;
}
