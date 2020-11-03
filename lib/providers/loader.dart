import 'package:now_app/providers/menu.dart';
import "package:provider/provider.dart";
import "package:provider/single_child_widget.dart";

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => MenuProvider()),
];
