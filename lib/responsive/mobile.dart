import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Mob extends StatefulWidget {
  const Mob({Key? key}) : super(key: key);

  @override
  State<Mob> createState() => _MobState();
}

class _MobState extends State<Mob> {
  String username = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("$username"),
    );
  }
}
