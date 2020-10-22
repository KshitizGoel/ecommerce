// import 'package:ecommerce/HomePageScreen/ProductsPage.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'AuthenticationPageScreen.dart';
//
// class CheckingTheExistingUser extends StatelessWidget{
//   @override
//   Future<Widget> build (BuildContext context) async {
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final name = prefs.getString('key') ?? '';
//
//
//     if(name.isNotEmpty){
//       Navigator.push(context, MaterialPageRoute(
//           builder: (context) => ProductsPage()
//       ));
//     }
//
//     else if(name == " "){
//       Navigator.push(context, MaterialPageRoute(
//           builder: (context) => AuthenticationPageScreen()
//       ));
//     }
//
//
//   }
//
//
//
// }