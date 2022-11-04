import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insta/responsive/mobile.dart';
import 'package:insta/responsive/web.dart';
import 'package:insta/screens/login.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/responsive/responsive.dart';
import 'package:insta/resources/auth_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD-Atx0OYn6tKr5tKDKZbddSNkfkwGCh1Y",
          projectId: "insta-995ec",
          storageBucket: "insta-995ec.appspot.com",
          messagingSenderId: "600961526071",
          appId: "1:600961526071:web:32147287ba59c843f192b2"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                 // return const ResponsiveLayout(
                   //   mobileScreenLayout: Mob(), webScreenLayout: Web());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return  Login();
            }));
  }
}
