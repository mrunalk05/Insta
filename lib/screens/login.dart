import 'package:flutter/material.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/widgets/textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: Container(), flex: 2),
            TextFieldInput(
                textEditingController: emailcontroller,
                hintText: "Enter Your Email",
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 64),
            TextFieldInput(
                textEditingController: passcontroller,
                hintText: "Enter Your Password",
                textInputType: TextInputType.text,
                isPass: true,),
                const SizedBox(height: 24,),
            InkWell(
              child:  Container(
                  child: Text('Log In'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),

                    ),
                    color: blueColor,
                    ),
                 ),),
                const SizedBox(height: 12,),
                Flexible(child: Container(), flex: 2,),

                Row(
                  children: [Container(
                    child: Text("Dont have Account"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () {},
                  child: Container(
                    child: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold),),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),),
                  ], 
                )
          ],
        ),
      ),
    ));
  }
}
