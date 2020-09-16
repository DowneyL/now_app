import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "providers/loader.dart";
import "routes.dart";
import "ui/now_ui.dart" show Screen;

main() {
  runApp(MultiProvider(
    child: NowApp(),
    providers: providers,
  ));
}

class NowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Screen.init();
    return MaterialApp(
      theme: ThemeData(fontFamily: "Montserrat"),
      debugShowCheckedModeBanner: false,
      routes: Routers.routes,
      initialRoute: Routers.initialRoute,
    );
  }
}
