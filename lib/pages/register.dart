import 'package:flutter/material.dart';
import 'package:savemoney2/pages/login.dart';
import 'package:firebase_database/firebase_database.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String username,email, password;
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
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
                          onChanged: (value) => username = value.trim(),
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
                          onChanged: (value) => email =value.trim(),
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
                          onChanged: (value) => password =value.trim(),
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
                                  if (username == null ||
                                      username.isEmpty ||
                                      email == null ||
                                      email.isEmpty ||
                                      password == null ||
                                      password.isEmpty )
                                      {
                                    // normalDialog(context, 'กรุณากรอกข้อมูล');
                                  } else {
                                    var root = databaseReference.child("user");
                                    root.child(username).once().then((DataSnapshot snapshot) {
                                      if ('${snapshot.value}' == 'null') {
                                        regis();
                                      } else {
                                        // normalDialog(context, 'มีข้อมูลแล้ว');
                                      }
                                    });
                                  }
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
              ]
              ),
        )
            );
            
  }
  Future<Null> regis() async {
    var root = databaseReference.child("user");
    root.child(username).set({
      'username': username,
      'password': password,
      'email': email,
       });
  MaterialPageRoute route = MaterialPageRoute(
   builder: (context) => logIn(),
   );
   Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }
}
