import 'package:flutter/material.dart';
import 'package:movieapp/services/auth_service.dart';
import 'package:movieapp/view/mainpages/home_page.dart';
import 'package:movieapp/view/opening_pages/sign_in_page.dart';
import 'package:movieapp/view/opening_pages/splash_screen.dart';
import 'package:movieapp/view/pageview/pageview.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService.authStateChange(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return LoginPage();
        } else {
          return PgView();
        }
      },
    );
  }
}
