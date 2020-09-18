import "package:flutter/material.dart";
import 'package:now_app/theme/now_theme.dart';
import "package:now_app/ui/now_ui.dart";

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Mask(),
          ImageBackground("assets/images/bg.png"),
          _buildLoginContent(),
        ],
      ),
    );
  }

  Widget _buildLoginContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 150.px),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildLogo(),
          SizedBox(height: 120.px),
          buildUsernameInput(),
          SizedBox(height: 26.px),
          buildPasswordInput(),
          SizedBox(height: 60.px),
          buildLoginButton(),
          SizedBox(height: 32.px),
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildLogo() {
    return Image.asset(
      "assets/images/logo_announce.png",
      scale: 1.6,
    );
  }

  Widget buildUsernameInput() {
    return Input(
      text: "Username",
      icon: Image.asset(
        "assets/images/person_circle.png",
        color: Color.fromRGBO(255, 255, 255, .5),
        width: 38.px,
        height: 38.px,
      ),
    );
  }

  Widget buildPasswordInput() {
    return Input(
      text: "Password",
      icon: Image.asset(
        "assets/images/lock.png",
        color: Color.fromRGBO(255, 255, 255, .5),
        width: 42.px,
        height: 44.px,
      ),
      obscureText: true,
    );
  }

  Widget buildLoginButton() {
    return SolidRoundedButton(
      text: "Get Started",
      color: NowTheme.orange,
      onPressed: () => print("on pressed"),
    );
  }

  Widget buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/register"),
            child:
                Text("Create Account", style: NowTheme.textTheme().bodyText2),
          ),
          Text("Need Help?", style: NowTheme.textTheme().bodyText2),
        ],
      ),
    );
  }
}
