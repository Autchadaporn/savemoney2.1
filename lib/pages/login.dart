import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savemoney2/pages/homepage.dart';
import 'register.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';



// ignore: camel_case_types
class logIn extends StatefulWidget {
  logIn({Key key}) : super(key: key);
  @override
  _logInState createState() => _logInState();
}

// ignore: camel_case_types
class _logInState extends State<logIn> {
  String username, password ;
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0Xffbbd4ce),
              Colors.blue[100],
              Color(0Xfff9b4ab),
            ])),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              pictureIcon(),
              nameApp(),
              mySizebox(),
              usernameForm(),
              mySizebox(),
              passwordForm(),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 90, top: 8),
                      child: register),
                  Container(
                      padding: const EdgeInsets.only(left: 50, top: 8),
                      child: login),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton get register {
    return RaisedButton(
      onPressed: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SignupPage();
        }))
      },
      color: Colors.blue[700],
      //padding: const EdgeInsets.only(left: 10),
      child: Text(
        'Register',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  RaisedButton get login {
    return RaisedButton(
      onPressed: () => {
        // print('user = $email pass = $password');
            if (username == null ||
                username.isEmpty ||
                password == null ||
                password.isEmpty) {
              // print('กรุณากรอกข้อมูล');
              // normalDialog(context, 'กรุณากรอกข้อมูล'),
            } else {
              loginserve(),
            }
      },
      color: Colors.green,
      // padding: const EdgeInsets.only(left: 10),
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<Null> loginserve() async {
    var data = databaseReference.child("user");
    await data.child(username).once().then((DataSnapshot snapshot) {
      print('Data ======>${snapshot.value}');
      print(data);
      if ('${snapshot.value}' == 'null') {
        // print('user');
        // normalDialog(context, 'username ของท่านผิด');
      } else if (password == '${snapshot.value['password']}') {
        MaterialPageRoute route = MaterialPageRoute(
          builder: (context) => homepage(),
        );
        Navigator.pushAndRemoveUntil(context, route, (route) => false);
      } else {
        // print('รหัสไม่ถูก');
        // normalDialog(context,'รหัสไม่ถูกต้อง กรุณากรอกใหม่');
      }
    });
  }

  Widget usernameForm() {
    return Container(
      width: 250.0,
      height: 50.0,
      child: TextField(
        onChanged: (value) => username = value.trim(),
        decoration: InputDecoration(
          labelText: "Username",
          labelStyle:
              // TextStyle(fontSize: 14, color: Colors.grey.shade400),
              TextStyle(fontSize: 14, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              // color: Colors.grey.shade300,
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
              )),
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      height: 50.0,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle:
              // TextStyle(fontSize: 14, color: Colors.grey.shade400),
              TextStyle(fontSize: 14, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              // color: Colors.grey.shade300,
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
              )),
        ),
      ),
    );
  }

  
}

mySizebox() => SizedBox(
      width: 8.0,
      height: 20.0,
    );

Widget pictureIcon() {
  return Container(
    width: 150.0,
    height: 150.0,
    child: Image.asset('images/unicorn.png'),
  );
}

Text nameApp() => Text(
      'Save Money',
      style: TextStyle(fontSize: 28.0,),
      
    );

Future<void> checksighin() async {}
