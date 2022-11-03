import 'package:flutter/material.dart';

class Mob extends StatefulWidget {
  const Mob({Key? key}) : super(key: key);

  @override
  State<Mob> createState() => _MobState();
}

class _MobState extends State<Mob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Its a Mob"),
    );
  }
}
