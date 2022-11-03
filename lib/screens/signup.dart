import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta/screens/login.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/utils/utils.dart';
import 'package:insta/widgets/textfield.dart';
import 'package:insta/resources/auth_methods.dart';
import 'dart:typed_data';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController usercontroller = TextEditingController();
  //final TextEditingController conformcontroller = TextEditingController();
  final TextEditingController biocontroller = TextEditingController();
  Uint8List? _image;
  bool _isloading = false;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    passcontroller.dispose();
    //conformcontroller.dispose();
    usercontroller.dispose();
    biocontroller.dispose();
  }

  void selectImage() async {
    Uint8List nm = await PickImage(ImageSource.gallery);
    setState(() {
      _image = nm;
    });
  }

  void signUpUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailcontroller.text,
      password: passcontroller.text,
      username: usercontroller.text,
      bio: biocontroller.text,
      file: _image!,
    );
    setState(() {
      _isloading = false;
    });

    if (res != "sucess") {
      ShowSnackBar(res, context);
    }
  }

  void navigateLogin() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const Login(),
    ));
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
            //circular widget to accpect and show a selectecd file
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg")),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 24,
            ),
            Flexible(child: Container(), flex: 2),
            TextFieldInput(
              textEditingController: usercontroller,
              hintText: "Enter Your Username",
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              textEditingController: biocontroller,
              hintText: "Enter Your Bio",
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
                textEditingController: _emailcontroller,
                hintText: "Enter Your Email",
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 24),
            TextFieldInput(
              textEditingController: passcontroller,
              hintText: "Enter Your Password",
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            // TextFieldInput(
            //   textEditingController: conformcontroller,
            //   hintText: "Conform Your Password",
            //   textInputType: TextInputType.text,
            //   isPass: true,
            // ),
            // const SizedBox(
            //   height: 24,
            // ),
            InkWell(
              onTap: signUpUser,
              // print(res);
  
              child: Container(
                child: _isloading ? Center(child: const CircularProgressIndicator(color: primaryColor,),) :const Text('Sign Up'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: blueColor,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Row(
              children: [
                Container(
                  child: Text("Already have Account"),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                GestureDetector(
                  onTap: navigateLogin,
                  child: Container(
                    child: Text(
                      "Log In",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
