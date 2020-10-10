import 'package:ecommerce/Authentication/LoginPageScreen.dart';
import 'package:ecommerce/Widgets/CustomTextFields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPageScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return RegisterPageScreenState();
  }

}

class RegisterPageScreenState extends State <RegisterPageScreen>{

  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();
  TextEditingController _contactNumberTextEditingController = TextEditingController();
  TextEditingController _nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListView(
       children: <Widget>[

       Padding(
         padding: EdgeInsets.all(20.0),
         child:   getImage(),
       ),


         Padding(
           padding: EdgeInsets.only(top:15.0, left: 80),

           child: Text(
             "Register your account",
             style: GoogleFonts.poppins(

             textStyle: TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.black,
               fontSize: 20
             )

             ),
           ),

         ),

         Padding(
           padding: EdgeInsets.only(top: 20, left: 20),

           child: TextFormField(


             decoration: InputDecoration(
                 labelText: "Name",
                 labelStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.black
                 ),
                 prefixIcon: Icon(
                   Icons.account_box,
                   color: Colors.blue,
                 )

             ),
             controller: _nameTextEditingController,
           ),

         ),

         Padding(
           padding: EdgeInsets.only(top: 20, left: 20),

           child: TextFormField(
             obscureText: true,
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
                 labelText: "Contact Number",
                 labelStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.black
                 ),
                 prefixIcon: Icon(
                   Icons.phone,
                   color: Colors.blue,
                 )
             ),
             controller: _contactNumberTextEditingController,
           ),

         ),

         Padding(
           padding: EdgeInsets.only(top: 20, left: 20),

           child: TextFormField(
             keyboardType: TextInputType.emailAddress,

             decoration: InputDecoration(
                 labelText: "Email ID",
                 labelStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.black
                 ),
                 prefixIcon: Icon(
                   Icons.account_box,
                   color: Colors.blue,
                 )

             ),
             controller: _emailTextEditingController,
           ),

         ),

         CustomTextFields(_passwordTextEditingController, Icons.lock, "Enter the Password", true),

         Padding(
             padding: EdgeInsets.only(left:20.0, right: 20.0, bottom: 20.0, top: 50.0),

             child: ButtonTheme(

               height: 50.0,


               child: RaisedButton(

                 color: Colors.white,

                 onPressed: (){
                   //Used in backend for logging in authentically..


                 },
                 child: Column(
                   children: <Widget>[

                     Icon(
                         Icons.account_circle,
                         color:Colors.black
                     ),

                     Text(
                       "Register",
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: Colors.black
                       ),
                     )

                   ],
                 ),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(25.0),

                 ),


               ),
             )
         ),

       ],
     )
   );
  }

}

class getImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("image/logo.jpg");
    Image image = Image(image: assetImage);

    return Container(
      child: image,
    );
  }
}