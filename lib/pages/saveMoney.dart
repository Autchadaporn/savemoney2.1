import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savemoney2/pages/statement.dart';
import 'package:flutter/services.dart';

class saveMoney extends StatefulWidget {
  @override
  _saveMoneyState createState() => _saveMoneyState();
}

class _saveMoneyState extends State<saveMoney> {
  String money;
  TextEditingController addMoneyController = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Money'),
        backgroundColor: Color(0Xff679186),
      ),
      body: Container(
        child: Center(
          child: Column(children: <Widget>[
            mySizebox(),
            pictureIcon(),
            mySizebox(),
            addForm(),
            add,
          ]),
        ),
      ),
    );
  }

  RaisedButton get add {
    return RaisedButton(
      onPressed: ()=> {
        addmoney(),
      },
      color: Colors.green,
      // padding: const EdgeInsets.only(left: 10),
      child: Text(
        'เพิ่ม',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget pictureIcon() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset('images/unicorn.png'),
    );
  }

  mySizebox() => SizedBox(
        width: 8.0,
        height: 20.0,
      );

  Widget addForm() {
    return Container(
      width: 300.0,
      child: TextField(
        onChanged: (value) => money = value.trim(),
        controller: addMoneyController,
        decoration: new InputDecoration(labelText: "เพิ่มจำนวนเงิน",
        labelStyle:
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
              ) )),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            
            inputFormatters: <TextInputFormatter>[
    WhitelistingTextInputFormatter.digitsOnly,
],
        // decoration: InputDecoration(
        //   labelText: "เพิ่มจำนวนเงิน",
        //   labelStyle:
        //       // TextStyle(fontSize: 14, color: Colors.grey.shade400),
        //       TextStyle(fontSize: 14, color: Colors.black),
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: BorderSide(
        //       // color: Colors.grey.shade300,
        //       color: Colors.black,
        //     ),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //       borderSide: BorderSide(
        //         color: Colors.black,
        //       )),
        // ),
      ),
    );
  }

  void addmoney() {
    String savemoney = addMoneyController.text.trim() ;
    var firebaseUser =  FirebaseAuth.instance.currentUser;
      firestoreInstance.collection(firebaseUser.uid).add(
      {"ยอดเงิน":savemoney}
    ).then((value) {
      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return statement();

                      }));
      print("success");
    });
  }
    
  }

