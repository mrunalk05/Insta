import 'package:flutter/material.dart';

class User {
  final String email;
  final String uid;
  final String bio;
  //final String username;
  final String photourl;
  //final List following;
  final List followers;

  const User({
    required this.email,
    required this.uid,
    required this.photourl,
     required this.followers,
      required this.bio,
});

}
