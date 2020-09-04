import "package:provider/provider.dart";
import "package:provider/single_child_widget.dart";
import "user/theme.dart";

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => UserThemeProvider()),
];
