import 'dart:ui';

import "package:flutter/material.dart";
import 'package:now_app/generated/l10n.dart';
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
    final NavigatorState navigator = Navigator.of(context);
    final S s = S.of(context);

    Widget _buildTitle() {
      return Text(
        s.createAccount.toUpperCase(),
        style: NowTheme.textTheme().headline3,
      );
    }

    Widget _buildUsernameInput() {
      return Input(
        text: s.username,
        icon: SvgPicture.asset(
          "assets/images/lines.svg",
          height: 38.0.px,
        ),
      );
    }

    Widget _buildEmailInput() {
      return Input(
        text: s.email,
        icon: SvgPicture.asset(
          "assets/images/mail.svg",
          height: 38.0.px,
        ),
      );
    }

    Widget _buildPasswordInput() {
      return Input(
        text: s.password,
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

    Widget _buildContinueButton() {
      return HollowRoundedButton(
        text: s.registerAndContinue,
        onPressed: () => print("continue on pressed"),
      );
    }

    Widget _buildFooter() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0.px),
        child: Text(
          s.termsAndCondition,
          style: NowTheme.textTheme()
              .bodyText2
              .merge(TextStyle(color: Colors.white54)),
        ),
      );
    }

    Widget _buildRegisterContent() {
      return Column(
        children: [
          SizedBox(height: 200.px),
          _buildTitle(),
          SizedBox(height: 120.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 180.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildUsernameInput(),
                SizedBox(height: 26.px),
                _buildEmailInput(),
                SizedBox(height: 26.px),
                _buildPasswordInput(),
                SizedBox(height: 84.px),
                _buildContinueButton(),
                _buildFooter(),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TopBar(
        leaders: [],
        actions: [
          BarIconButton.svgAsset(
            "assets/images/cancel.svg",
            onPressed: () => navigator.pop(context),
          ),
        ],
      ),
      body: Stack(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: <Widget>[
              ImageBackground(url: "assets/images/bg.png"),
              FrostedGlassMask(),
              _buildRegisterContent(),
            ],
          ),
        ],
      ),
    );
  }
}
