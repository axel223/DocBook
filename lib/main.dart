import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart';

import 'login_page.dart';
import 'colours.dart';
import 'home_page.dart';

double letterSpacingOrNone(double letterSpacing) => kIsWeb ? 0.0 : letterSpacing;

void main() => runApp(const DocBook());

class DocBook extends StatelessWidget {
  const DocBook();

  static const String loginRoute = '/login';
  static const String homeRoute = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DocBook',
      debugShowCheckedModeBanner: false,
      theme: _buildDocBookTheme(),
      initialRoute: loginRoute,
      routes: <String, WidgetBuilder>{
        homeRoute: (context) => const HomePage(),
        loginRoute: (context) => const LoginPage(),
      },
    );
  }

  ThemeData _buildDocBookTheme() {
    final base = ThemeData.light();
    return ThemeData(
      primarySwatch: Colors.indigo,
      scaffoldBackgroundColor: DocBookColors.buttonColor,
      primaryColor: DocBookColors.buttonColor,
      focusColor: DocBookColors.focusColor,
      textTheme: _buildDocBookTextTheme(base.textTheme),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: DocBookColors.labelText,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: DocBookColors.inputBackground,
        focusedBorder: InputBorder.none,
      ),
    );
  }

  TextTheme _buildDocBookTextTheme(TextTheme base) {
    return base
        .copyWith(
      bodyText2: GoogleFonts.robotoCondensed(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(0.5),
      ),
      bodyText1: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(1.4),
      ),
      button: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        letterSpacing: letterSpacingOrNone(2.8),
      ),
      headline5: GoogleFonts.poppins(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        letterSpacing: letterSpacingOrNone(1.4),
      ),
    )
        .apply(
      displayColor: Colors.white,
      bodyColor: Colors.white,              // label colour in body colour
    );
  }
}
