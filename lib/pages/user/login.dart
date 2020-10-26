import "package:flutter/material.dart";
import 'package:now_app/theme/now_theme.dart';
import "package:now_app/ui/now_ui.dart";

class LoginPage extends StatefulWidget {
  static const routerName = "/login";

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
      padding: EdgeInsets.symmetric(horizontal: 180.px),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildLogo(),
          SizedBox(height: 130.px),
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
    return SvgPicture.asset(
      "assets/images/logo_announce.svg",
      width: 100.px,
    );
  }

  Widget buildUsernameInput() {
    return Input(
        text: "Username",
        icon: SvgPicture.asset(
          "assets/images/person_circle.svg",
          height: 38.px,
        ));
  }

  Widget buildPasswordInput() {
    return Input(
      text: "Password",
      icon: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 2.0),
        child: SvgPicture.asset(
          "assets/images/lock.svg",
          height: 38.px,
        ),
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
            child: Text("Create Account",
                style: NowTheme.textTheme()
                    .bodyText2
                    .merge(TextStyle(color: Colors.white54))),
          ),
          Text("Need Help?",
              style: NowTheme.textTheme()
                  .bodyText2
                  .merge(TextStyle(color: Colors.white54))),
        ],
      ),
    );
  }
}
