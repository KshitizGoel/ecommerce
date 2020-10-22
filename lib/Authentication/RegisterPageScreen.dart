import 'package:ecommerce/Authentication/LoginPageScreen.dart';
import 'package:ecommerce/DialogBox/DialogBox.dart';
import 'package:ecommerce/HomePageScreen/ProductsPage.dart';
import 'package:ecommerce/Widgets/CustomTextFields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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

  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("User Details");


  DialogBox alertDialog = DialogBox();

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future <void> savingDataInDatabase() async{

    User firebaseUser;

    await _auth.createUserWithEmailAndPassword(
        email: _emailTextEditingController.text.trim(),
        password: _passwordTextEditingController.text).then((auth) {
      firebaseUser = auth.user;
    });

    if(firebaseUser != null){
      savingUserInfoInDatabase(firebaseUser).then((value){

      });
    }
  }

  Future <void> savingUserInfoInDatabase (User fUser){

    dbRef.child(fUser.uid).set({
      "uid" : fUser.uid,
      "email" : fUser.email,
      "Name" : _nameTextEditingController.text.trim(),
      "Email" : _emailTextEditingController.text.trim(),
      "Contact Number" : _contactNumberTextEditingController.text.trim(),
      "Password" : _passwordTextEditingController.text.trim(),
    });


    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ProductsPage()
    ));
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(

       decoration: BoxDecoration(
           gradient: LinearGradient(
               colors: [Colors.blue, Colors.cyan],
               begin: FractionalOffset(0.0 , 0.0),
               end: FractionalOffset(1.0, 0.0),
               stops: [0.0, 1.0],
               tileMode: TileMode.mirror
           )
       ),

       child:  ListView(
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

           CustomTextFields(_nameTextEditingController , Icons.assignment_ind , "Enter your name", false , TextInputType.name),
           CustomTextFields(_contactNumberTextEditingController , Icons.phone , "Enter your contact number" , false , TextInputType.phone),
           CustomTextFields(_emailTextEditingController , Icons.account_circle , "Enter your Email ID" , false , TextInputType.emailAddress),

           CustomTextFields(_passwordTextEditingController, Icons.lock, "Enter the Password", true, TextInputType.emailAddress),

           Padding(
               padding: EdgeInsets.only(left:20.0, right: 20.0, bottom: 20.0, top: 50.0),

               child: ButtonTheme(

                 height: 50.0,


                 child: RaisedButton(

                   color: Colors.white,

                   onPressed: (){

                     if(
                     _emailTextEditingController.text.isNotEmpty &&
                     _nameTextEditingController.text.isNotEmpty &&
                     _contactNumberTextEditingController.text.isNotEmpty &&
                     _passwordTextEditingController.text.isNotEmpty
                     ){
                       savingDataInDatabase();

                     }else
                       {
                         alertDialog.information(context, "Error!", "Please fill all the details!");
                       }


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