import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final String email;
  final String uid;
  final String bio;
  final String username;
  final String photourl;
  final List following;
  final List followers;

  const User({
    required this.email,
    required this.uid,
    required this.photourl,
    required this.followers,
    required this.bio,
    required this.following,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photourl": photourl,
        "bio": bio,
        "followers": followers,
        "following": following,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        email: snapshot['email'],
        uid: snapshot['uid'],
        photourl: snapshot['photourl'],
        followers: snapshot['followers'],
        bio: snapshot['bio'],
        following: snapshot['following'],
        username: snapshot['username']);
  }
}
