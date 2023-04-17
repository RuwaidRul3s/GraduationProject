import 'package:flutter/material.dart';
import 'package:stonefireplace/Widgets/ApplicationForm.dart';
class LoginWithPhoneNumber extends StatefulWidget {

  static const  String ScreenID='LoginWithPhoneNumber';

  const LoginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromARGB(255, 39, 17, 5),
          body: SafeArea(child: ApplicationForm(FormHeader_Text: 'Login with Phone Number',)),
        ),
    );
  }
}
