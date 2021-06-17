import 'package:covid19_app/home_screen.dart';
import 'package:covid19_app/sign_in_body.dart';
import 'package:flutter/material.dart';
import 'fadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class LoginPage extends StatefulWidget {

  static const String id = 'log_in_screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(1, Text("Login", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),)),
                        SizedBox(height: 20,),
                        FadeAnimation(1.2, Text("Login to your account", style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700]
                        ),)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(1.2, makeInput(label: "Email", keyboardType: TextInputType.emailAddress, onChanged: (value){email = value;})),
                          FadeAnimation(1.3, makeInput(label: "Password", obscureText: true, onChanged: (value){password = value;})),
                        ],
                      ),
                    ),
                    FadeAnimation(1.4, Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
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
                              final user = await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                              if (user != null) {
                                Navigator.pushNamed(context, HomeScreen.id);
                              }

                              setState(() {
                                showSpinner = false;
                              });

                            }
                            catch (e) {
                              print(e);
                              String s = e.toString();
                              var end;
                              for(var i=0;i<s.length;i++) {
                                  if(s[i]==']'){
                                    end=i;
                                  }
                              }
                              print(end);
                              String message = "";
                              for(var i=end+2;i<s.length;i++) {
                                message+=s[i];
                              }
                              print(message);
                              String s1 = "A network error (such as timeout, interrupted connection or unreachable host) has occurred."; //internet connection issue
                              String s2 = "The password is invalid or the user does not have a password."; //incorrect password
                              String s3 = "The email address is badly formatted."; //invalid email
                              String s4 = "There is no user record corresponding to this identifier. The user may have been deleted."; //account corresponding to this email doesn't exist
                              String s5 = "We have blocked all requests from this device due to unusual activity. Try again later."; //too many wrong try

                              String dialogueMessage;
                              int flag = 0;

                              if(message == s1){
                                dialogueMessage = "You are not connected with the internet. Please check your internet connection.";
                                flag = 1;
                              }
                              else if(message == s2){
                                dialogueMessage = "Incorrect Email/Password.";
                                flag = 1;
                              }
                              else if(message == s3){
                                dialogueMessage = "Invalid Email format.";
                                flag = 2;
                              }
                              else if(message == s5){
                                dialogueMessage = "You have tried too many unsuccessful attempts, we have temporarily blocked all requests for the account. Try again later.";
                                flag = 2;
                              }
                              else{
                                dialogueMessage = "There is no user record corresponding to this email, the account may have been deleted.";
                                flag = 2;
                              }

                              // List<String> ans = s.split("]");
                              // print(ans);
                              // String message = ans[1];
                              // String authMessage = ans[0];
                              // int length = authMessage.length;
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorScreen()));

                              if(flag == 1){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Text("Error occurred!"),
                                        content: Text(dialogueMessage),
                                        actions:[
                                          FlatButton(
                                            child: Text("Try Again"),
                                            onPressed: (){
                                              Navigator.pushNamed(context, LoginPage.id);
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                );
                              }

                              else{
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Text("Error occurred!"),
                                        content: Text(dialogueMessage),
                                        actions:[
                                          FlatButton(
                                            child: Text("Try Again"),
                                            onPressed: (){
                                              Navigator.pushNamed(context, LoginPage.id);
                                            },
                                          ),
                                          FlatButton(
                                            child: Text("Sign up"),
                                            onPressed: (){
                                              Navigator.pushNamed(context, SignupPage.id);
                                            },
                                          )
                                        ],
                                      );
                                    }
                                );
                              }

                            }
                          },
                          color: Color(0xFFFB4C47),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Text("Login", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white
                          ),),
                        ),
                      ),
                    )),
                    FadeAnimation(1.5, Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, SignupPage.id);
                            print('sign up clicked');
                          },
                          child: Text(" Sign up", style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16.0,
                             color: Color(0xFFFB4C47)
                          ),),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ],
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