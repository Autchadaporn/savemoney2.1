import "package:flutter/material.dart";
import 'package:savemoney2/pages/login.dart';

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
