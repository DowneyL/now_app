import "dart:ui";

import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../providers/user/theme.dart";
import "../../ui/now_ui.dart";

class RegisterPage extends StatefulWidget {
  static const routerName = "/register";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: <Widget>[
              buildMask(),
              buildBackground(),
              buildRegisterContent(),
            ],
          ),
          TopBar(
            actions: <Widget>[
              ImageIcon(AssetImage("assets/images/lines.png")),
              ImageIcon(AssetImage("assets/images/lines.png")),
              ImageIcon(AssetImage("assets/images/lines.png")),
              ImageIcon(AssetImage("assets/images/lines.png")),
              ImageIcon(AssetImage("assets/images/lines.png")),
              ImageIcon(AssetImage("assets/images/lines.png")),
              ImageIcon(AssetImage("assets/images/lines.png")),
            ],
            isGroup: true,
          ),
        ],
      ),
    );
  }

  Widget buildBackground() {
    return ImageBackground("assets/images/bg.png");
  }

  Widget buildMask() {
    return Mask();
  }

  Widget buildRegisterContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildTitle(),
        SizedBox(height: 120),
        buildUsernameInput(),
        SizedBox(height: 26),
        buildEmailInput(),
        SizedBox(height: 26),
        buildPasswordInput(),
        SizedBox(height: 84),
        buildContinueButton(),
        buildFooter(),
      ],
    );
  }

  Widget buildTitle() {
    return Text(
      "CREATE ACCOUNT",
      style: TextStyle(
        fontSize: 54,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  Widget buildUsernameInput() {
    return Consumer<UserThemeProvider>(
      builder: (context, theme, child) {
        return Input(
          width: theme.inputWidth,
          text: "Name",
          icon: child,
        );
      },
      child: Image.asset(
        "assets/images/lines.png",
        color: Color.fromRGBO(255, 255, 255, .5),
        width: 38.0,
      ),
    );
  }

  Widget buildEmailInput() {
    return Consumer<UserThemeProvider>(
      builder: (context, theme, child) {
        return Input(
          width: theme.inputWidth,
          text: "Email",
          icon: child,
        );
      },
      child: Image.asset(
        "assets/images/mail.png",
        color: Color.fromRGBO(255, 255, 255, .5),
        width: 38.0,
      ),
    );
  }

  Widget buildPasswordInput() {
    return Consumer<UserThemeProvider>(
      builder: (context, theme, child) {
        return Input(
          width: theme.inputWidth,
          text: "Password",
          obscureText: true,
          icon: child,
        );
      },
      child: Image.asset(
        "assets/images/lock.png",
        color: Color.fromRGBO(255, 255, 255, .5),
        height: 44.0,
        width: 42.0,
      ),
    );
  }

  Widget buildContinueButton() {
    return Consumer<UserThemeProvider>(
      builder: (context, theme, child) {
        return HollowButton(
          width: theme.inputWidth,
          text: "Continue",
          onPressed: () => print("continue on pressed"),
        );
      },
    );
  }

  Widget buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        "Terms & Conditions",
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
