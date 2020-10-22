import 'package:ecommerce/DialogBox/DialogBox.dart';
import 'package:ecommerce/HomePageScreen/ProductsPage.dart';
import 'package:ecommerce/Widgets/CustomTextFields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginPageScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return LoginPageScreenState();
  }

}



class LoginPageScreenState extends State<LoginPageScreen>{

  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();

  DialogBox alertDialog = DialogBox();

  FirebaseAuth _auth = FirebaseAuth.instance;

  SharedPreferences prefs;

  Future <void> _signInWithEmailAndPassword() async{

    try{

      User firebaseUser;
      await _auth.signInWithEmailAndPassword(
          email: _emailTextEditingController.text.trim(),
          password: _passwordTextEditingController.text.trim()).then((auth) {
        firebaseUser = auth.user;

        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProductsPage()
        ));


      });


      if(firebaseUser != null){


        prefs = await SharedPreferences.getInstance();
        prefs.setString('key', firebaseUser.toString());
      }


    } catch(e){

      alertDialog.information(context, "Error!", "The Email and Password does not match! $e Or the user is not Registered!");

    }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.blue],
            begin: FractionalOffset(0.0 , 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.mirror
        )
        ),

        child: ListView(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(10.0),
              child: getImageAsset(),

            ),

            Padding(
              padding: EdgeInsets.only(top:10.0, left: 90),
              child: Text(
                "Login to your account",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    )
                ),
              ),

            ),

            CustomTextFields(_emailTextEditingController , Icons.account_box , "Email Id" , false , TextInputType.emailAddress),
            CustomTextFields(_passwordTextEditingController , Icons.lock , "Password" , true, TextInputType.emailAddress),



            Padding(
                padding: EdgeInsets.only(left:20.0, right: 20.0, bottom: 20.0, top: 50.0),


                child: ButtonTheme(

                  height: 50.0,


                  child: RaisedButton(
                    color: Colors.white,

                    elevation: 10,
                    onPressed: () async {
                      //Used in backend for logging in authentically..

                      if(_emailTextEditingController.text.isNotEmpty && _passwordTextEditingController.text.isNotEmpty)
                      {

                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailTextEditingController.text);


                        if(
                        emailValid == true &&

                            (
                        _passwordTextEditingController.text.toString().length > 6 || _passwordTextEditingController.text.toString().length ==6
                            )
                        ){
                          _signInWithEmailAndPassword();

                        }
                        else{
                          alertDialog.information(context, "Error!", "Your email address or the password is badly formatted!");

                        }

                      }
                      else{
                        alertDialog.information(context, "Error :(", "Please fill all the details!");
                      }

                    },
                    child: Column(
                      children: <Widget>[

                        Icon(
                            Icons.details,
                            color:Colors.black
                        ),

                        Text(
                          "Login",
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
class getImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("image/shoppingBags.png");
    Image image = Image(image: assetImage);

    return Container(
      child: image,
    );
  }
}