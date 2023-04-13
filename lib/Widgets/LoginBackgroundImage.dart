import 'package:flutter/material.dart';

class LoginBackgroundImage extends StatelessWidget {
  const LoginBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image:AssetImage("images/mainbg.jpg"),
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(Colors.black26,BlendMode.darken)
        ),
      ),
    );
  }
}
