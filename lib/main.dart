import 'package:ecommerce/HomePageScreen/ProductsPage.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Authentication/AuthenticationPageScreen.dart';
import 'Authentication/CheckingTheExistingUser.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
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

  SharedPreferences prefs;



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return new SplashScreen(

      seconds: 3,
      navigateAfterSeconds: AuthenticationPageScreen(),

      // navigateAfterSeconds: CheckingTheExistingUser(),

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

  // Future<Widget> CheckingTheExistingUser() async {
  //
  //
  //    SharedPreferences prefs = await SharedPreferences.getInstance();
  //    final name = prefs.getString('key') ?? '';
  //
  //
  //   if(name.isNotEmpty){
  //     Navigator.push(context, MaterialPageRoute(
  //       builder: (context) => ProductsPage()
  //     ));
  //   }
  //
  //   else if(name == " "){
  //     Navigator.push(context, MaterialPageRoute(
  //         builder: (context) => AuthenticationPageScreen()
  //     ));
  //   }
  //
  //
  // }
}