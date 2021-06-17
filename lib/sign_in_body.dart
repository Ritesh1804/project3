import 'package:covid19_app/home_screen.dart';
import 'package:covid19_app/log_in_screen_body.dart';
import 'package:flutter/material.dart';
import 'fadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignupPage extends StatefulWidget {

  static const String id = 'sign_up_screen';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(1, Text("Sign up", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),)),
                    SizedBox(height: 20,),
                    FadeAnimation(1.2, Text("Create an account, It's free", style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700]
                    ),)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FadeAnimation(1.2, makeInput(label: "Email", onChanged: (value){email = value;}, keyboardType: TextInputType.emailAddress)),
                    FadeAnimation(1.3, makeInput(label: "Password", obscureText: true, onChanged: (value){password = value;})),
                    FadeAnimation(1.4, makeInput(label: "Confirm Password", obscureText: true, onChanged: (value){password = value;})),
                  ],
                ),
                FadeAnimation(1.5, Container(
                  //padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      //print(email);
                      //print(password);
                      try {
                        final newUser = await _auth
                            .createUserWithEmailAndPassword(
                            email: email, password: password);
                        if(newUser != null){
                          Navigator.pushNamed(context, HomeScreen.id);
                        }

                        setState(() {
                          showSpinner = false;
                        });

                      }
                      catch (e) {
                        print(e);
                      }
                    },
                    color: Color(0xFFFB4C47),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text("Sign up", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white
                    ),),
                  ),
                )),
                FadeAnimation(1.6, Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, LoginPage.id);
                        print('log in clicked');
                      },
                      child: Text(" Login", style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16,
                        color: Color(0xFFFB4C47)
                      ),),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false, onChanged, keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),),
        SizedBox(height: 5,),
        TextField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}