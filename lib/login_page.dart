
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';
import 'adaptive.dart';
import 'image_placeholder.dart';
import 'text_scale.dart';
import 'colours.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ApplyTextOptions(
      child: Scaffold(
        body: SafeArea(
          child: _MainView(
            usernameController: _usernameController,
            passwordController: _passwordController,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class _MainView extends StatelessWidget {
  const _MainView({
    Key key,
    this.usernameController,
    this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  void _login(BuildContext context) {
    print(usernameController.text);
    print(passwordController.text);
    print("login");
    /////////////////////////Firebase Function/////////////////////////////////////////////////////////////////////////////////////////////////////
    Navigator.of(context).pushNamed(DocBook.homeRoute);
  }


  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    List<Widget> listViewChildren;

    if (isDesktop) {
      final desktopMaxWidth = 400.0 + 100.0 * (cappedTextScale(context) - 1);
      listViewChildren = [
        _UsernameInput(
          maxWidth: desktopMaxWidth,
          usernameController: usernameController,
        ),
        const SizedBox(height: 12),
        _PasswordInput(
          maxWidth: desktopMaxWidth,
          passwordController: passwordController,
        ),
        const SizedBox(height: 5,),
        Align(
          alignment: Alignment.center,
          child :Container(
            constraints: BoxConstraints(maxWidth: desktopMaxWidth ?? double.infinity),
            child:Align(
              alignment: Alignment.centerRight,
              child :_TapText(text: "Forgot Password?",),
            )
          ),
        ),
        const SizedBox(height: 5),
        _LoginButton(
          text: "LOGIN SECURELY",
          maxWidth: desktopMaxWidth,
          onTap: () {
            _login(context);
          },
        ),
      ];
    } else {
      listViewChildren = [
        const _SmallLogo(),
        _UsernameInput(
          usernameController: usernameController,
        ),
        const SizedBox(height: 12),
        _PasswordInput(
          passwordController: passwordController,
        ),
        const SizedBox(height: 5,),
        Align(
          alignment: Alignment.center,
          child :Container(
              constraints: BoxConstraints(maxWidth: double.infinity),
              child:Align(
                alignment: Alignment.centerRight,
                child :_TapText(text: "Forgot Password?",),
              )
          ),
        ),
        const SizedBox(height: 5),
        _LoginButton(
          text: "LOGIN",
          onTap: () {
            _login(context);
          },
        ),
      ];
    }

    return Column(
      children: [
        if (isDesktop) const _TopBar(),
        Expanded(
          child: Align(
            alignment: isDesktop ? Alignment.center : Alignment.topCenter,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: listViewChildren,
            ),
          ),
        ),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spacing = const SizedBox(width: 30);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExcludeSemantics(
                child: SizedBox(
                  height: 80,
                  child: FadeInImagePlaceholder(
                    image:
                    const AssetImage('icons/Logo_blue_wback.png'),
                    placeholder: LayoutBuilder(builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxHeight,
                        height: constraints.maxHeight,
                      );
                    }),
                  ),
                ),
              ),
              spacing,
              Text(
                'DocBook',
                style: GoogleFonts.poppins(
                  fontSize: 20 / reducedTextScale(context),
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _TapText(text: "How to Use",),
              SizedBox(
                width: 40,
                height: 60,
              ),
              _TapText(text: "Help & Support",)
            ],
          ),
        ],
      ),
    );
  }

  Widget tapText(String text, Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text),
    );
  }
}

class _SmallLogo extends StatelessWidget {
  const _SmallLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 64),
      child: SizedBox(
        height: 160,
        child: ExcludeSemantics(
          child: FadeInImagePlaceholder(
            image: AssetImage('icons/Logo_small_ui.png'),
            placeholder: SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({
    Key key,
    this.maxWidth,
    this.usernameController,
  }) : super(key: key);

  final double maxWidth;
  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: TextField(
          controller: usernameController,
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            labelText: 'Username',
          ),
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    Key key,
    this.maxWidth,
    this.passwordController,
  }) : super(key: key);

  final double maxWidth;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: TextField(
          controller: passwordController,
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none
              )
            ),
            filled: true,
            fillColor: Colors.white,
            labelText: 'Password',
          ),
          obscureText: true,
        ),
      ),
    );
  }
}

class _ThumbButton extends StatefulWidget {
  _ThumbButton({
    @required this.onTap,
  });

  final VoidCallback onTap;

  @override
  _ThumbButtonState createState() => _ThumbButtonState();
}

class _ThumbButtonState extends State<_ThumbButton> {
  BoxDecoration borderDecoration;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: true,
      label: 'Login',
      child: GestureDetector(
        onTap: widget.onTap,
        child: Focus(
          onKey: (node, event) {
            if (event is RawKeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.enter ||
                  event.logicalKey == LogicalKeyboardKey.space) {
                widget.onTap();
                return true;
              }
            }
            return false;
          },
          onFocusChange: (hasFocus) {
            if (hasFocus) {
              setState(() {
                borderDecoration = BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.5),
                    width: 2,
                  ),
                );
              });
            } else {
              setState(() {
                borderDecoration = null;
              });
            }
          },
          child: Container(
            decoration: borderDecoration,
            height: 120,
            child: ExcludeSemantics(
              child: Image.asset(
                'icons/users.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//class _LoginButton extends StatelessWidget {
//  const _LoginButton({
//    Key key,
//    @required this.onTap,
//    this.maxWidth,
//  }) : super(key: key);
//
//  final double maxWidth;
//  final VoidCallback onTap;
//
//  @override
//  Widget build(BuildContext context) {
//    return Align(
//      alignment: Alignment.center,
//      child: Container(
//        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
//        padding: const EdgeInsets.symmetric(vertical: 10),
//        child: _FilledButton(
//              text: 'LOGIN SECURELY',
//              onTap: onTap,
//              maxWidth: maxWidth,
//            ),
//      ),
//    );
//  }
//}

class _TapText extends StatelessWidget {
  const _TapText({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
          text,
          style: GoogleFonts.poppins(
          fontSize: 15 / reducedTextScale(context),
          fontWeight: FontWeight.w500,
          color: Colors.black,
          ),
      ),
      onTap: () {
        if(text == "How to Use")
          print("1");
        else
          print("2");
        },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key key, @required this.text, @required this.onTap ,this.maxWidth})
      : super(key: key);

  final String text;
  final VoidCallback onTap;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(minWidth: maxWidth ?? double.infinity,maxHeight: 60, minHeight: 60),
//        color: Colors.black,
        child:FlatButton(
          color: DocBookColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 15,
                letterSpacing: 1
            ),
          ),
        )
      ),
    );
  }

}
