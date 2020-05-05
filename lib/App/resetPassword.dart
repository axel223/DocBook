import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeginReset extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ResetPass();
  }
}

class ResetPass extends State<BeginReset> {
//  String _name;
  String _email;
//  String _password;
//  String _phone;
//  String _dob;
//  String _bgroup;
//  String _sex;
//  String _address;
//  String _imgurl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//  Widget _buildNameField() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Name'),
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'name is required';
//        }
//        return null;
//      },
//      onSaved: (String value) {
//        _name = value;
//      },
//    );
//  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
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

//  Widget _buildPhoneField() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Phone Number'),
//      keyboardType: TextInputType.phone,
//      validator: (String value) {
//        if (value.isEmpty){
//          return 'phone number is required';
//        }
//        return null;
//      },
//      onSaved: (String value){
//        _phone = value;
//      },
//    );
//  }
//
//  Widget _buildPasswordField() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Password'),
//      keyboardType: TextInputType.visiblePassword,
//      maxLength: 12,
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'password is required';
//        }
//        return null;
//      },
//      onSaved: (String value) {
//        _password = value;
//      },
//    );
//  }
//
//  Widget _buildDOBField() {
//    return TextFormField(
//        decoration: InputDecoration(labelText: 'Date of Birth (dd/mm/yyyy)'),
//    keyboardType: TextInputType.datetime,
//    validator: (String value) {
//    if (value.isEmpty){
//    return 'dob is required';
//    }
//    return null;
//    },
//    onSaved: (String value){
//    _dob = value;
//    },
//    );
//  }
//
//  Widget _buildBgroupField() {
//    return TextFormField(
//        decoration: InputDecoration(labelText: 'Blood Group'),
////    validator: (String value) {
////    if (value.isEmpty){
////    return 'Name is Required';
////    }
////    return null;
////    },
//    onSaved: (String value){
//    _bgroup = value;
//    },
//    );
//  }
//
//  Widget _buildSexField() {
//    return TextFormField(
//        decoration: InputDecoration(labelText: 'Sex (M/F)'),
//    validator: (String value) {
//    if (value.isEmpty){
//    return 'Sex is Required';
//    }
//    return null;
//    },
//    onSaved: (String value){
//    _sex = value;
//    },
//    );
//  }
//
//  Widget _buildAddressField() {
//    return TextFormField(
//        decoration: InputDecoration(labelText: 'Address'),
//    validator: (String value) {
//    if (value.isEmpty){
//    return 'Address is Required';
//    }
//    return null;
//    },
//    onSaved: (String value){
//    _address = value;
//    },
//    );
//  }
//
//  Widget _buildImgField() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Image URL'),
//      keyboardType: TextInputType.url,
////      validator: (String value) {
////        if (value.isEmpty){
////          return 'Address is Required';
////        }
////        return null;
////      },
//      onSaved: (String value){
//        _imgurl = value;
//      },
//    );
//  }

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
            margin: EdgeInsets.only(right: 120, top: 9.0),
            child: Text(
              "Reset Password",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              _buildNameField(),
              _buildEmailField(),
//              _buildPasswordField(),
//              _buildPhoneField(),
//              _buildDOBField(),
//              _buildBgroupField(),
//              _buildSexField(),
//              _buildAddressField(),
//              _buildImgField(),
              SizedBox(
                height: 100,
              ),
              RaisedButton(
                color: Color(0xff31A05E),
                child: Text(
                  "Submit",
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
