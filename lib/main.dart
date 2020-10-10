import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Authentication/AuthenticationPageScreen.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return new SplashScreen(

      seconds: 3,
      navigateAfterSeconds: AuthenticationPageScreen(),
      image: new Image.asset(
          'image/logo.jpg'),
      loadingText: Text(
        "Let's go shopping!",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black
          )
        ),
      ),
      photoSize: 150.0,
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),

    );
  }
}