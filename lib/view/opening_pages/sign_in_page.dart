import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/providers/provider.dart';
import 'package:movieapp/services/auth_service.dart';
import 'package:movieapp/utils/responsive.dart';
import 'package:movieapp/view/opening_pages/sign_up_page.dart';
import 'package:movieapp/view/pageview/pageview.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            R.width(10, context),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: R.width(20, context),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PgView(),
                          ),
                        );
                      },
                      child: const Text(
                        "SKIP",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: R.width(20, context),
              ),
              Image.asset(
                "assets/images/login_img.png",
                scale: 2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: R.width(15, context),
                  right: R.width(15, context),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: R.width(30, context),
                    ),
                    TextField(
                      cursorColor: Colors.white,
                      controller: emailController,
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
                      height: R.width(10, context),
                    ),
                    TextField(
                      controller: passwordController,
                      cursorColor: Colors.white,
                      obscureText: ref.watch(visibleProvider),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: Colors.white38,
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.white70,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref.read(visibleProvider.notifier).state =
                                !ref.read(visibleProvider.notifier).state;
                          },
                          color: Colors.white54,
                          icon: Icon(
                            ref.watch(visibleProvider)
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        filled: true,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.white70),
                      ),
                    ),
                    SizedBox(
                      height: R.width(20, context),
                    ),
                    InkWell(
                      onTap: () async {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Fill all the field"),
                            ),
                          );
                        } else {
                          // print(emailController.text);
                          // print(passwordController.text);
                          try {
                            // await ref.watch(
                            //   signInProvider(
                            //     AuthModel(
                            //         email: emailController.text,
                            //         password: passwordController.text),
                            //   ),
                            // );
                            await AuthService().signIn(
                                emailController.text, passwordController.text);
                          } on FirebaseAuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("$e"),
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: R.width(60, context),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white60,
                            width: R.width(2, context),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              R.width(10, context),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: R.width(20, context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: R.width(10, context),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Need Help?",
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: R.width(16, context),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUP(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "New to FilmFusion?",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: R.width(16, context),
                          ),
                          children: [
                            TextSpan(
                              text: " Sign up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: R.width(17, context),
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: R.width(20, context),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: R.width(50, context),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white60,
                          width: R.width(2, context),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            R.width(20, context),
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
                    SizedBox(
                      height: R.width(20, context),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Sign in is protected by Google reCAPTCHA to ensure you're not\na bot.Learn more.",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: R.width(10, context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
