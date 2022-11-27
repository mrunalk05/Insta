import 'package:flutter/cupertino.dart';
import 'package:insta/models/userdata.dart';
import 'package:insta/resources/auth_methods.dart';

class provider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;
}
