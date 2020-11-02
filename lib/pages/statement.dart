import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class statement extends StatefulWidget {
  @override
  _statementState createState() => _statementState();
}

class _statementState extends State<statement>  {
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statement',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0Xff264e70),
      ),
      body: StreamBuilder  (
        stream: firestoreInstance.collection(firebaseUser.uid).snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              if (snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
              DocumentSnapshot course = snapshot.data.documents[index];
              print(course);
              print(course['ยอดเงิน']);
              // print(course['ยอดเงิน'].runtimeType);
              var x = int.parse(course['ยอดเงิน']);
              print(x.runtimeType);

              // var i = 1;
              // i = i + x;
              // print("i=$i");

              return ListTile(
                
                title: Text(course['ยอดเงิน'] + ' บาท',
                style: TextStyle(fontSize: 20),),
                subtitle: Text(course['when']),
              );
            },
          );
        },
      ),
    );
  }
  
}

