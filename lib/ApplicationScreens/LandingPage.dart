import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:stonefireplace/Widgets/ApplicationMainBackGround.dart';

class StoneFirePlace extends StatelessWidget {
  const StoneFirePlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Container(
                child: Stack(
          children: [
            MainBackgroundImage(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Swipe up',
                        style: TextStyle(
                            color: Color.fromARGB(255, 194, 87, 26),
                            fontSize: 32),
                        children: [
                          TextSpan(
                            text: ' to',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: '\nexplore the world ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: '\nof fireplaces.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                  ),
                  Center(
                      child: GestureDetector(
                      onVerticalDragStart: (detials){
                        print("swipe up");
                      },
                          child: Icon(Icons.keyboard_double_arrow_up_sharp,
                              color: Colors.white, size: 64))),
                ],
              ),
            )
          ],
        ))),
      ),
    );
  }
}
