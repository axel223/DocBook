import 'package:flutter/material.dart';
import 'package:myproject/home_icons.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      title: 'DocBook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF0F3F8),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[Navbar(),LoginDetails()],
          ),
        ),
      ),
    );
  }
}

class LoginDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 500.0,
        right: 500.0,
        top: 150,
        bottom: 0,
      ),
      child: Container(
          child: Column(
            children: <Widget>[Username(),Password(),Forgotpass(),LoginBtn()],
          ),
      ),
    );
  }
}


class Navbar extends StatelessWidget{
  
  final navLinks = ["How to Use?", "Help & Support"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 30),
        child: InkWell(
          onTap: (){
            print(text);
          },
          child: Text(
            text,
            style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            ),
          ),
        )
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(.10),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0)
                      ]
                    ),
                    child: Icon(
                        Home.logo,
                        size: 36,
                        color: Color(0xFF011399),
                      ),
              ),
              SizedBox(
                width: 15,
              ),
              Text("DocBook",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500,),
                )
            ],
          ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[...navItem()],
            )
        ],
      ),
    );
  }
}

class LoginBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Color(0xFF011399),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                        color: Color(0xFF000000).withOpacity(.10),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print("Login"); 
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("LOGIN SECURELY",
                    style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500,color:Color(0xFFFFFFFF))),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Username extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0.0,
        right: 0.0,
        top: 0,
        bottom: 15,
      ),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
             BoxShadow(
                        color: Color(0xFF6078ea).withOpacity(.10),
                        offset: Offset(0.0, -5.0),
                        blurRadius: 50.0)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  flex: 8,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Your Username'
                        ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0.0,
        right: 0.0,
        top: 0,
        bottom: 20,
      ),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                        color: Color(0xFF6078ea).withOpacity(.10),
                        offset: Offset(0.0, 5.0),
                        blurRadius: 50.0)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  flex: 8,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Your Password'
                        ),
                    obscureText: true,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}



class Forgotpass extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 390,bottom: 25),
        child: InkWell(
          onTap: (){
            print("Forgot Pass");
          },
          child: Text(
            "Forgot Password?",
            style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            ),
          ),
        )
      );
  }
}

class _ToggleButtonsDemo extends StatefulWidget {
  @override
  _ToggleButtonsDemoState createState() => _ToggleButtonsDemoState();
}

class _ToggleButtonsDemoState extends State<_ToggleButtonsDemo> {
  final isSelected = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        children: const [
          Icon(Icons.ac_unit),
          Icon(Icons.call),
          Icon(Icons.cake),
        ],
        onPressed: (index) {
          setState(() {
            isSelected[index] = !isSelected[index];
          });
        },
        isSelected: isSelected,
      ),
    );
  }
}