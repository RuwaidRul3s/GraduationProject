
import 'package:flutter/material.dart';
import 'package:stonefireplace/Widgets/ApplicationForm.dart';

import '../Widgets/ApplicationLoginWithEmailForm.dart';

import 'package:stonefireplace/ApplicationScreens/HomeScreen.dart';


class LoginWithEmail extends StatefulWidget {
  static const  String ScreenID='LoginWithEmail';

  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       routes: {

         HomeScreen.ScreenID:(context)=>HomeScreen(),
       },
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 39, 17, 5),
        body: SafeArea(child: LoginWithEmailForm()),

      ),
    );
  }
}
