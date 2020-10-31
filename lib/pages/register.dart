import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savemoney2/pages/login.dart';
import 'package:firebase_database/firebase_database.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseDatabase.instance.reference().child('user');
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // resizeToAvoidBottomPadding: false,
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.white,
            Colors.blue[100],
            Color(0Xfff9b4ab),
          ])),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 70.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          labelText: 'USERNAME ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    TextField(
                      controller: confirmController,
                      decoration: InputDecoration(
                          labelText: 'CONFIRMPASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(height: 50.0),
                    Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          // shadowColor: Colors.greenAccent,
                          color: Colors.indigo[900],
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              signUp();
                            },
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            // color: Colors.transparent,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return logIn();
                            }));
                          },
                          child: Center(
                            child: Text('Go Back',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            // SizedBox(height: 15.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text(
            //       'New to Spotify?',
            //       style: TextStyle(
            //         fontFamily: 'Montserrat',
            //       ),
            //     ),
            //     SizedBox(width: 5.0),
            //     InkWell(
            //       child: Text('Register',
            //           style: TextStyle(
            //               color: Colors.green,
            //               fontFamily: 'Montserrat',
            //               fontWeight: FontWeight.bold,
            //               decoration: TextDecoration.underline)),
            //     )
            //   ],
            // )
          ]),
    ));
  }

  signUp() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmController.text.trim();
    if (password == confirmPassword && password.length >= 6) {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        // writeData();
        print("Sign up user successful.");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => logIn()),
            ModalRoute.withName('/'));
        writeData();
      }).catchError((error) {
        print(error.message);
      });
    } else {
      print("Password and Confirm-password is not match.");
    }
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  void writeData() {
    String email = emailController.text.trim();
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    final User user = auth.currentUser;
    final uid = user.uid;
    db.child('user').set({'name': username, 'email': email,'password':password});
    // here you write the codes to input the data into firestore
  }
}
