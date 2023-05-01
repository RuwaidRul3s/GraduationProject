
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stonefireplace/ApplicationScreens/HomeScreen.dart';
import 'package:stonefireplace/ApplicationScreens/LandingPage.dart';
import 'package:stonefireplace/ApplicationScreens/LoginPage.dart';
import 'package:stonefireplace/ApplicationScreens/LoginWithPhone.dart';
import 'package:stonefireplace/ApplicationScreens/OTP_Screen.dart';
import 'package:stonefireplace/GoogleSigninProvider.dart';
import 'package:stonefireplace/ApplicationScreens/LoginWithEmail.dart';
// this is the starting point for the application

Future   main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context)=>GoogleSignInProvider(),
      child:  MaterialApp(
        initialRoute: LoginWithPhoneNumber.ScreenID,
        routes: {
          StoneFirePlace.ScreenID:(context)=>StoneFirePlace(),
          LoginScreen.ScreenID:(context)=>LoginScreen(),
          LoginWithPhoneNumber.ScreenID:(context)=>LoginWithPhoneNumber(),
          HomeScreen.ScreenID:(context)=>HomeScreen(),
          LoginWithEmail.ScreenID:(context)=>LoginWithEmail(),
          OTP_Screen.ScreenID:(context)=>OTP_Screen(),
        },
      )),
    );

}

