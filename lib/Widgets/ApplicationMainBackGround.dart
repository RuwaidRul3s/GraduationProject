import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBackgroundImage extends StatelessWidget {
  const MainBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage("images/mainbg.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black26,BlendMode.darken)
          ),
        ),
    );
  }
}
