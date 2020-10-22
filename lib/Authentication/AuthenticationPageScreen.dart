
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'LoginPageScreen.dart';
import 'RegisterPageScreen.dart';


class AuthenticationPageScreen extends StatefulWidget {


  @override
  _AuthenticationPageScreenState createState() => _AuthenticationPageScreenState();
}

class _AuthenticationPageScreenState extends State<AuthenticationPageScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.indigo],
                  begin: FractionalOffset(0.0 , 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.mirror
                )
              ),
            ),
            title: Text(
              "E-Commerce App",
              style: GoogleFonts.sansita(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30
                )
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  text:
                    "Login",


                  ),

          Tab(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            text:
            "Register",

          ),

              ],

              indicatorColor: Colors.white,
              indicatorWeight: 5.0,
            ),
          ),


          body: Container(

            child: TabBarView(
              children: [
                LoginPageScreen(),
                RegisterPageScreen()
              ],
            ),

          ),

        ),

    );
  }
}