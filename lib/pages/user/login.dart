import "package:flutter/material.dart";
import 'package:now_app/generated/l10n.dart';
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
    final S s = S.of(context);

    Widget _buildLogo() {
      return SvgPicture.asset(
        "assets/images/logo_announce.svg",
        width: 100.px,
      );
    }

    Widget _buildUsernameInput() {
      return Input(
          text: s.username,
          icon: SvgPicture.asset(
            "assets/images/person_circle.svg",
            height: 38.px,
          ));
    }

    Widget _buildPasswordInput() {
      return Input(
        text: s.password,
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

    Widget _buildLoginButton() {
      return SolidRoundedButton(
        text: s.confirmLogin,
        color: NowTheme.orange,
        onPressed: () => print("on pressed"),
      );
    }

    Widget _buildFooter() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed("/register"),
              child: Text(s.createAccount,
                  style: NowTheme.textTheme()
                      .bodyText2
                      .merge(TextStyle(color: Colors.white54))),
            ),
            Text(s.needHelp,
                style: NowTheme.textTheme()
                    .bodyText2
                    .merge(TextStyle(color: Colors.white54))),
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
            _buildLogo(),
            SizedBox(height: 130.px),
            _buildUsernameInput(),
            SizedBox(height: 26.px),
            _buildPasswordInput(),
            SizedBox(height: 60.px),
            _buildLoginButton(),
            SizedBox(height: 32.px),
            _buildFooter(),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Mask(),
          ImageBackground(url: "assets/images/bg.png"),
          _buildLoginContent(),
        ],
      ),
    );
  }
}
