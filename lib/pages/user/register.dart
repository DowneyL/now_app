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
  double width = 480.0.px;

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
              ImageIcon(AssetImage("assets/images/menu.png")),
              ImageIcon(AssetImage("assets/images/logo.png")),
              ImageIcon(AssetImage("assets/images/cancel.png")),
            ],
            isGroup: true,
            actionsThemeData: IconThemeData(
              color: Colors.white,
            ),
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
    );
  }

  Widget buildTitle() {
    return Text(
      "CREATE ACCOUNT",
      style: TextStyle(
        fontSize: 54.px,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  Widget buildUsernameInput() {
    return Input(
      width: width,
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
      width: width,
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
      width: width,
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
    return HollowButton(
      width: width,
      text: "Continue",
      onPressed: () => print("continue on pressed"),
    );
  }

  Widget buildFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0.px),
      child: Text(
        "Terms & Conditions",
        style: TextStyle(
          fontSize: 16.0.px,
          color: Colors.white,
        ),
      ),
    );
  }
}
