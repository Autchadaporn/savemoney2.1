import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:savemoney2/pages/login.dart';
import 'dart:convert';

class total extends StatefulWidget {
  @override
  _totalState createState() => _totalState();
}

class _totalState extends State<total> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Accout',
          style: TextStyle(color: Color(0Xffffffff)),
        ),
        backgroundColor: Color(0Xff4e1b3c),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Color(0Xffffffff),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return logIn();
              }));
//dosomething
            },
          )
        ],
      ),
      body: Container(
        child: Center(
            child: Column(
          children: <Widget>[
            textBoxMoney(),
          ],
        )),
      ),
    );
  }

  Widget textBoxMoney() {
    return Container(
      width: 300.0,
      child: TextField(
        decoration: InputDecoration(
          labelText: "",
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
RaisedButton get add {
    return RaisedButton(
      onPressed: ()=> {
        
      },
      color: Colors.green,
      // padding: const EdgeInsets.only(left: 10),
      child: Text(
        'เพิ่ม',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

void main() {
  var x = 8;
  var a = "2"; // Hexadecimal value for 30
  var b = int.parse(a);

  x = x + b;
  print(x); 
}
final firestoreInstance = FirebaseFirestore.instance;
var firebaseUser =  FirebaseAuth.instance.currentUser;
String _getdata() {
  firestoreInstance
        .collection(firebaseUser.uid)
        .doc(firebaseUser.uid)
        .get()
        .then((value) {
       print(value.get("ยอดเงิน"));
    });
}
