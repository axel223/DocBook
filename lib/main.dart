import 'package:DocBook/Web/colours.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:DocBook/App/Home.dart';
import 'package:DocBook/App/chats.dart';
import 'package:DocBook/App/resetPassword.dart';
import 'package:DocBook/App/signup.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {

    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final width = MediaQuery.of(context).size.width;
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
                        onPressed: () => _login(context),
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
  Future _handlesignIn(String email, String pass) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
          email: email, password: pass)).user;
      if (user != null) {
        return user;
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
    /////////////////////////Firebase Function/////////////////////////////////////////////////////////////////////////////////////////////////////


    var s=await _handlesignIn(_user.text, _pass.text);

    if(s is String){
      _ackAlert(context, "Firebase Error", s, "OK");
    }
    else if(s==false) {
      _ackAlert(context, "Error", "Wrong Username or Password", "OK");
    }
    else {
      FirebaseUser _t = s;
      if(_t.isEmailVerified) {
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => HomePage()

        ));
      }
      else{
        _ackAlert(context, "Error", "Please Verify Yourself", "OK");
        FirebaseAuth.instance.signOut();
      }
    }


  }
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
}
