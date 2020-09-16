import "package:flutter/material.dart";
import "../../ui/now_ui.dart";

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double width = 480.0.px;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          buildMask(),
          buildBackground(),
          buildLoginContent(),
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

  Widget buildLoginContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.px),
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
      width: width,
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
      width: width,
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
    return SolidButton(
      width: width,
      text: "Get Started",
      color: Color(0xFFF96332),
      onPressed: () => print("on pressed"),
    );
  }

  Widget buildFooter() {
    TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.0.px,
      fontWeight: FontWeight.w400,
    );
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/register");
            },
            child: Text(
              "Create Account",
              style: textStyle,
            ),
          ),
          Text(
            "Need Help?",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
