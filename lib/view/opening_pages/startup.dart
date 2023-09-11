import 'package:flutter/material.dart';

class StartUP extends StatelessWidget {
  const StartUP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/movie-elements-black-background-.jpg"),
          ),
        ),
      ),
    );
  }
}
