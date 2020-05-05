import 'package:DocBook/Backend/firestoreService.dart';
import 'package:DocBook/Backend/patient.dart';
import 'package:DocBook/Web/colours.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeginSignup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Signup();
  }
}

class Signup extends State<BeginSignup> {
  String _name;
  String _email;
  String _password;
  String _phone;
  String _dob;
  String _bgroup;
  String _sex;
  String _address;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        prefixIcon: Icon(
          Icons.person,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'name is required';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(
          Icons.email,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'email address is required';
        }

        if (!RegExp("[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                "\\@" +
                "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                "(" +
                "\\." +
                "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                ")+")
            .hasMatch(value)) {
          return 'please enter a valid email address';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Phone Number',
          prefixText: '+91',
          prefixIcon: Icon(
            Icons.phone,
          )),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'phone number is required';
        }
        return null;
      },
      onSaved: (String value) {
        _phone = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(
          Icons.https,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (String value) {
        if (value.length < 8) {
          return 'minimum length of password must be 8';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildDOBField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Date of Birth (dd-mm-yyyy)',
        prefixIcon: Icon(
          Icons.calendar_today,
        ),
      ),
      keyboardType: TextInputType.datetime,
      validator: (String value) {
        if (value.isEmpty) {
          return 'DOB is required';
        }
        return null;
      },
      onSaved: (String value) {
        _dob = value;
      },
    );
  }

  Widget _buildBgroupField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Blood Group',
        prefixIcon: Icon(
          Icons.settings_input_svideo,
        ),
      ),
//    validator: (String value) {
//    if (value.isEmpty){
//    return 'Name is Required';
//    }
//    return null;
//    },
      onSaved: (String value) {
        _bgroup = value;
      },
    );
  }

  Widget _buildSexField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Sex (M/F)',
          prefixIcon: Icon(
            Icons.wc,
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Sex Field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _sex = value;
      },
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Address',
          prefixIcon: Icon(
            Icons.home,
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff31A05E),
          actions: <Widget>[
            Container(
              //alignment: Alignment.centerLeft,
              //width: 40,
              margin: EdgeInsets.only(right: 180, top: 9.0),
              child: Text(
                "Register",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 29.0,
                    fontWeight: FontWeight.bold,
                   ),
              ),
            )
          ],
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey,
                              width: 3.0,
                            ),
                            right: BorderSide(
                              color: Colors.grey,
                              width: 3.0,
                            ),
                            left: BorderSide(
                              color: Colors.grey,
                              width: 3.0,
                            ),
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 3.0,
                            ),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20.0,
                            ),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          splashColor: Colors.grey.shade900,
                          icon: Icon(
                            Icons.person_add,
                          ),
                          iconSize: 50,
                          color: Colors.grey.shade500,
                          tooltip: "Add a Photo",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildNameField(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildEmailField(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildPasswordField(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildPhoneField(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildDOBField(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildBgroupField(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildSexField(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildAddressField(),
                    SizedBox(
                      height: 70,
                    ),
                    RaisedButton(
                      color: Color(0xff31A05E),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();
                        _signUP(context);

                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
  ////////////////////////////////FIREBASE////////////////////////////////////////////
  Future<void> ackAlert(BuildContext context , String title,String text,String buttonText) {
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

  Future _handlesignUP() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseUser _user = (await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password)).user;
      if (_user != null) {
        var s= await new FirestoreService().addData(new Patient(_name, _address, _phone, _email, _sex, _dob, _bgroup), 'Patient');
        if(s is String){
          ackAlert(context, 'Error Occurred', s, 'OK');
          FirebaseAuth.instance.signOut();
          return true;
        }
        await _user.sendEmailVerification();
        ackAlert(context, 'Registered Successfully', 'Email verification Link has been sent', 'OK');
        FirebaseAuth.instance.signOut();
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


  Future _signUP(BuildContext context) async {


    /////////////////////////Firebase Function/////////////////////////////////////////////////////////////////////////////////////////////////////


    var s=await _handlesignUP();

    if(s is String){
      ackAlert(context, "Firebase Error", s, "OK");
    }
    else if(s==false){
      ackAlert(context, 'Error Occurred', 'Unknown Error', 'OK');
    }
  }

}
