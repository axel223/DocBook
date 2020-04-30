import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MaterialApp(
    title: 'DocBook',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
    home: LoginPage(),
  ));
