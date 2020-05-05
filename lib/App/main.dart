import 'package:flutter/material.dart';
import 'package:DocBook/App/Home.dart';
import 'package:DocBook/App/chats.dart';
import 'package:DocBook/App/resetPassword.dart';
import 'package:DocBook/App/signup.dart';

void main() => runApp(
  MaterialApp(
    title: 'DocBook',
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    theme: new ThemeData(
      primarySwatch: Colors.green,
    ),
  ),
);

class LoginPage extends StatefulWidget {
  @override
  static String tag = 'login-page';

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final width = MediaQuery.of(context).size.width;
    final TextEditingController _user = TextEditingController();
    final TextEditingController _pass = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                      top: isKeyboardOpen ? -350 : -170,
                      left: -70,
                      child:Container(
                        height: 500,
                        width: 500,
                        decoration: BoxDecoration(
                          color: Color(0xff31A05E),
                          shape: BoxShape.circle,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: isKeyboardOpen ? 15 : 125),
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/Logo.png"),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Container(
                width: width - 50,
                margin: EdgeInsets.symmetric(horizontal: 25),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: TextField(
                        controller: _user,
                        decoration: InputDecoration(
                            labelText: ' Username'),
                      ),
                    ),
                    ListTile(
                      title: TextField(
                        controller: _pass,
                        decoration: InputDecoration(
                            labelText: ' Password'),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff31A05E),
                      ),
                      child: FlatButton(
                        child: Center(
                          child : Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(
                            builder: (_) => HomePage()
                        )),
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'New User?',
                        style: TextStyle(fontSize: 12 ,color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BeginSignup()));
                      },
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 12,color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BeginReset()));
                      },
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              )
            ]
        )
    );
  }
}
