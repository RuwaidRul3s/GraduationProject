import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:stonefireplace/Widgets/ApplicationButton.dart';
import 'package:stonefireplace/Widgets/ApplicationFormHeader.dart';

import 'package:stonefireplace/ApplicationScreens/HomeScreen.dart';

import '../ApplicationScreens/LoginPage.dart';

class LoginWithEmailForm extends StatefulWidget {
  const LoginWithEmailForm({Key? key}) : super(key: key);

  @override
  State<LoginWithEmailForm> createState() => _LoginWithEmailFormState();
}

class _LoginWithEmailFormState extends State<LoginWithEmailForm> {
  final _auth = FirebaseAuth.instance;

  var Email_Address;
  var password;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                FormHeader(HeaderText: 'Login With Email'),
                TextFormField(
                  onChanged: (value) {
                    Email_Address = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: Colors.white,
                      label: Text('Email'),
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.white))),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: Colors.white,
                      label: Text('Password'),
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.fingerprint,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.white))),
                ),
                SizedBox(
                  height: 30,
                ),
                ApplicationButton(
                    ButtonText: 'Submit',
                    On_press_function: () async {
                      try {
                        final New_User = await _auth
                            .createUserWithEmailAndPassword(
                            email: Email_Address, password: password);
                        if(New_User!=null)
                          {
                             Navigator.pushNamed(context,HomeScreen.ScreenID);
                          }
                      }
                     catch(e){
                        print(e);
                      // show snakbar
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                         content:Text("The email address is already in use by another account.") ,

                         )
                       );
                      }
                    },
                    ButtonColor: Colors.black,
                    ButtonStyle: TextStyle(fontSize: 14, color: Colors.white)),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                      text:
                          'Or you can login with other sign in options by pressing',
                      style: TextStyle(
                          fontSize: 14, color: Color.fromARGB(255, 98, 93, 93)),
                      children: [
                        TextSpan(
                            text: ' sigin other options',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
