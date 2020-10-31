import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class statement extends StatefulWidget {
  @override
  _statementState createState() => _statementState();
}

class _statementState extends State<statement> {
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
      body: StreamBuilder(
        stream: firestoreInstance.collection(firebaseUser.uid).snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot course = snapshot.data.documents[index];
              print(course['ยอดเงิน']);
              var x = [course['ยอดเงิน']];
              print(x);
              print(course['ยอดเงิน'].runtimeType);
              // var x = 0;
              // x = x + int.parse(course['ยอดเิงน']);
              // print(x);

              return ListTile(
                subtitle: Text(course['ยอดเงิน'] + ' บาท'),
              );
            },
          );
        },
      ),
    );
  }
}
