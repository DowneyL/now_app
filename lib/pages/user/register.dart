import "dart:ui";

import "package:flutter/material.dart";
import 'package:now_app/theme/now_theme.dart';

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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: <Widget>[
              Mask(),
              ImageBackground("assets/images/bg.png"),
              buildRegisterContent(),
            ],
          ),
          TopBar(
            actions: <Widget>[
              ImageIcon(AssetImage("assets/images/menu.png")),
              ImageIcon(AssetImage("assets/images/logo.png")),
              ImageIcon(AssetImage("assets/images/cancel.png")),
            ],
            isGroup: true,
            actionsThemeData: IconThemeData(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildRegisterContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 150.px),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTitle(),
          SizedBox(height: 120.px),
          buildUsernameInput(),
          SizedBox(height: 26.px),
          buildEmailInput(),
          SizedBox(height: 26.px),
          buildPasswordInput(),
          SizedBox(height: 84.px),
          buildContinueButton(),
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      "CREATE ACCOUNT",
      style: NowTheme.textTheme().headline3,
    );
  }

  Widget buildUsernameInput() {
    return Input(
      text: "Name",
      icon: Image.asset(
        "assets/images/lines.png",
        color: Color.fromRGBO(255, 255, 255, .5),
        width: 38.0.px,
      ),
    );
  }

  Widget buildEmailInput() {
    return Input(
      text: "Email",
      icon: Image.asset(
        "assets/images/mail.png",
        color: Color.fromRGBO(255, 255, 255, .5),
        width: 38.0.px,
      ),
    );
  }

  Widget buildPasswordInput() {
    return Input(
      text: "Password",
      obscureText: true,
      icon: Image.asset(
        "assets/images/lock.png",
        color: Color.fromRGBO(255, 255, 255, .5),
        height: 44.0.px,
        width: 42.0.px,
      ),
    );
  }

  Widget buildContinueButton() {
    return HollowRoundedButton(
      text: "Continue",
      onPressed: () => print("continue on pressed"),
    );
  }

  Widget buildFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0.px),
      child: Text(
        "Terms & Conditions",
        style: NowTheme.textTheme().bodyText2,
      ),
    );
  }
}
