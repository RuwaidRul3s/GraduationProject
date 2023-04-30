import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:stonefireplace/ApplicationScreens/LoginWithEmail.dart';
import 'package:stonefireplace/ApplicationScreens/LoginWithPhone.dart';
import 'package:stonefireplace/Widgets/ApplicationMainBackGround.dart';
import 'package:stonefireplace/Widgets/LoginBackgroundImage.dart';
import 'package:stonefireplace/Widgets/ApplicationButton.dart';
import 'package:stonefireplace/Widgets/ApplicationIconButton.dart';

import 'package:stonefireplace/GoogleSigninProvider.dart';

import 'package:stonefireplace/Base/TextStyles.dart';

import 'package:stonefireplace/Widgets/ImageButton.dart';

class LoginScreen extends StatelessWidget {


final FirebaseAuth _auth = FirebaseAuth.instance;


  static const  String ScreenID='LoginScreen';



  // const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Stack(children: [
                Container(
                  height: 600,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/mainbg.jpg"),
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.black26, BlendMode.darken)),
                  ),
                ),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Stone Fireplace",
                        style: TextStyle(fontSize: 42, color: Colors.white),
                      ),
                      Text(
                        "the best fireplaces place in the world ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 228, 228, 228)),
                      )
                    ],
                  ),
                )),
              ]),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 39, 17, 5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                    ApplicationButton(
                      ButtonText: 'SING IN WITH Phone Number',
                      On_press_function: ()  {

                        Navigator.pushNamed(context,  LoginWithPhoneNumber.ScreenID);

                      },
                      ButtonColor: Colors.black,
                      ButtonStyle: Button_Text_style_1,

                    ),
                   SizedBox(height: 20,),
                   Text('Sign in with Social Network' ,style: TextStyle(color:Color.fromARGB(255, 153, 152, 152)),),
                        SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        ImageButton(
                          ButtonStyle: Button_Text_style_2,
                          ButtonText: 'Google',
                          On_press_function: () {
                            final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
                            provider.GoogleLogin();
                          },
                          ButtonColor: Colors.white,
                         ImageName:'images/google.png'
                        ),
                        SizedBox(width: 20,),
                        ApplicationIconButton(
                          ButtonStyle: TextStyle(fontSize: 16,color: Colors.white),
                          ButtonText: 'Email',
                          On_press_function: () {
                            Navigator.pushNamed(context,LoginWithEmail.ScreenID);
                          },
                          ButtonColor: Color.fromARGB(255, 24, 119, 242),
                          ButtonIcon:FaIcon(FontAwesomeIcons.envelope,color: Colors.white,)
                        ),

                      ],
                    )
                  ]),
                ),
              )
            ])),
      ),
    );
  }

  void SignInWithGoogle()async
  {
    final GoogleSignInAccount ?  GoogleUser = await  GoogleSignIn().signIn();
   if(GoogleUser!=null)
     {
       final GoogleSignInAuthentication auth=await GoogleUser.authentication;

      AuthCredential authCredential = GoogleAuthProvider.credential(
         idToken: auth.idToken,
         accessToken: auth.accessToken
       );




    
     }


  }
}
