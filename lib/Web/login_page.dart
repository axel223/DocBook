import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'adaptive.dart';
import 'image_placeholder.dart';
import 'text_scale.dart';
import 'colours.dart';
import 'alert.dart';

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
        backgroundColor: DocBookColors.primaryBackground,
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
  bool _loginKey=false;
   _MainView({
    Key key,
    this.usernameController,
    this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  Future<void> _ackAlert(BuildContext context , String title,String text,String buttonText) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              title,
              style: GoogleFonts.poppins(
                  color: title == "Error" ? Colors.red : DocBookColors.buttonColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
              )
          ),
          content: Text(
              text,
              style: GoogleFonts.poppins(
                  color: DocBookColors.buttonColor,
                  fontSize: 15
              )
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future _handlesignIn(String email, String pass) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
          email: email, password: pass)).user;
      if (user != null) {
        return true;
      }
      else {
        return false;
      }
    }
    catch(e){
      return e.toString();
    }
  }


  Future _login(BuildContext context) async {

    print(usernameController.text);
    print(passwordController.text);
    print("login");
    /////////////////////////Firebase Function/////////////////////////////////////////////////////////////////////////////////////////////////////


    var s=await _handlesignIn(usernameController.text, passwordController.text);

    if(s is String){
      _ackAlert(context, "Firebase Error", s, "OK");
    }
    else if(s==true) {
      Navigator.of(context).pushNamed(DocBook.homeRoute);
    }
    else {
      _ackAlert(context, "Error", "Wrong Username or Password", "OK");
    }

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
          onTap: ()  {
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
          onTap: ()  {
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
          style: TextStyle(color: Colors.black),
          controller: usernameController,
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
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
          style: TextStyle(color: Colors.black),
          controller: passwordController,
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5),
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
