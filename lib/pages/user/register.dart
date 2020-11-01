import 'dart:ui';

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
      appBar: TopBar(
        leaders: <Widget>[
          BarIconButton.svgAsset(
            "assets/images/menu.svg",
            onPressed: () => print("test1"),
          ),
        ],
        actions: <Widget>[
          BarIconButton.svgAsset(
            "assets/images/cancel.svg",
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: <Widget>[
              ImageBackground("assets/images/bg.png"),
              FrostedGlassMask(),
              buildRegisterContent(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRegisterContent() {
    return Column(
      children: [
        SizedBox(height: 200.px),
        buildTitle(),
        SizedBox(height: 120.px),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 180.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
        ),
      ],
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
      icon: SvgPicture.asset(
        "assets/images/lines.svg",
        height: 38.0.px,
      ),
    );
  }

  Widget buildEmailInput() {
    return Input(
      text: "Email",
      icon: SvgPicture.asset(
        "assets/images/mail.svg",
        height: 38.0.px,
      ),
    );
  }

  Widget buildPasswordInput() {
    return Input(
      text: "Password",
      obscureText: true,
      icon: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 2.0),
        child: SvgPicture.asset(
          "assets/images/lock.svg",
          height: 38.0.px,
        ),
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
        style: NowTheme.textTheme()
            .bodyText2
            .merge(TextStyle(color: Colors.white54)),
      ),
    );
  }
}
