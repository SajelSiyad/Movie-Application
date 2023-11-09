import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/auth_model.dart';
import 'package:movieapp/providers/auth_provider.dart';
import 'package:movieapp/services/auth_service.dart';
import 'package:movieapp/utils/responsive.dart';

class SignUP extends ConsumerWidget {
  SignUP({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/sign_up_img.png",
                  scale: 3,
                ),
              ],
            ),
            Text(
              "Ready to Watch?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: R.width(30, context),
                  fontFamily: "Schyler"),
            ),
            SizedBox(
              height: R.width(10, context),
            ),
            Text(
              textAlign: TextAlign.center,
              "Enter yor email to create or sign in to your\naccount.",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: R.width(1, context),
              ),
            ),
            SizedBox(
              height: R.width(20, context),
            ),
            Padding(
              padding: EdgeInsets.all(R.width(20, context)),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Colors.white38,
                      filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white70,
                      ),
                      hintText: "Email or Phone",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                  SizedBox(
                    height: R.width(13, context),
                  ),
                  TextField(
                    controller: passwordController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Colors.white38,
                      filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white70,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                  SizedBox(
                    height: R.width(13, context),
                  ),
                  TextField(
                    controller: confirmPasswordController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Colors.white38,
                      filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.lock_person_rounded,
                        color: Colors.white70,
                      ),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                  SizedBox(
                    height: R.width(25, context),
                  ),
                  SizedBox(
                    height: R.width(45, context),
                    width: R.width(200, context),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            confirmPasswordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Fill all the field"),
                            ),
                          );
                        } else if (passwordController.text !=
                            confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Password doesn't match"),
                            ),
                          );
                        } else {
                          try {
                            // await ref.watch(
                            //   signUpProvider(
                            //     AuthModel(
                            //         email: emailController.text,
                            //         password: passwordController.text),
                            //   ),
                            // );
                            await AuthService()
                                .signUp(emailController.text,
                                    passwordController.text)
                                .then((value) => Navigator.pop(context));

                            // ref.invalidate(signUpProvider);
                          } on FirebaseAuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("$e"),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text("Create Account"),
                    ),
                  ),
                  SizedBox(
                    height: R.width(20, context),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: R.width(16, context),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: R.width(20, context),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: R.width(50, context),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white60, width: R.width(2, context)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          R.width(10, context),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Google.png",
                        ),
                        Text(
                          "Sign up With Google",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: R.width(15, context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
