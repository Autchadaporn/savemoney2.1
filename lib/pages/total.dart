import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:savemoney2/pages/login.dart';
import 'saveMoney.dart';
import 'statement.dart';

// import 'dart:convert';

class total extends StatefulWidget {
  @override
  _totalState createState() => _totalState();
}

class _totalState extends State<total> {
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  PageController _pageController = PageController();
  List<Widget> _screen = [
    saveMoney(),
    statement(),
    total(),
  ];
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    }); //ทำให้ icon ข้างล่างเปลี่ยนสีตาม
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

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
            child: StreamBuilder(
                stream:
                    firestoreInstance.collection(firebaseUser.uid).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  var ds = snapshot.data.documents;
                  double sum = 0.0;
                  for (int i = 0; i < ds.length; i++)
                    sum += int.parse(ds[i]["ยอดเงิน"]);

                  return Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "เงินออมทั้งหมด : $sum",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Text(
                        " ",
                      ),
                    ],
                  );
                })));
  }
}
