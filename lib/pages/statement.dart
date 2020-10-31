import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";

class statement extends StatefulWidget {

  @override
  _statementState createState() => _statementState();
}

class _statementState extends State<statement> {
  final firestoreInstance = FirebaseFirestore.instance;
  void initState() {
    super.initState();
  }
  @override
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
        stream:  firestoreInstance.collection("เงินออม").snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot course = snapshot.data.documents[index];
              return ListTile(
                subtitle: Text(course['ยอดเงิน']+' บาท'),
              );
            },
          );
        },
      ),
    );
  }
}
