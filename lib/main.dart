import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safedot/config.dart';
import 'package:safedot/pages/home.dart';

void main() {
  configWeb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.getFont("Nunito").fontFamily,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline1: GoogleFonts.nunito(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            headline2: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 42,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            headline4: GoogleFonts.nunito(
              textStyle: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            button: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
      routes: {'/': (context) => HomeScreen()},
    );
  }
}
