import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'package:stonefireplace/Widgets/ApplicationButton.dart';
import 'package:stonefireplace/Widgets/ApplicationFormHeader.dart';
class LoginWithEmailForm extends StatefulWidget {
  const LoginWithEmailForm({Key? key}) : super(key: key);

  @override
  State<LoginWithEmailForm> createState() => _LoginWithEmailFormState();
}

class _LoginWithEmailFormState extends State<LoginWithEmailForm> {
  final   email=TextEditingController();
  final   password=TextEditingController();

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
                FormHeader(HeaderText:'Login With Email'),
                TextFormField(
                controller:email ,
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
              controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return "password lenght < 6 ";
                    }
                    return null;
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
                    On_press_function: () async
    {
                      UserCredential userCredentials= await FirebaseAuth.instance.
      createUserWithEmailAndPassword(email:email.text.trim(), password: password.text.trim());
              await FirebaseAuth.instance.currentUser!.updateDisplayName('Ruwaid');
                      await FirebaseAuth.instance.currentUser!.updateEmail('toxicinteger@gmail.com');
               await FirebaseFirestore.instance.collection('users').doc("201820118").set({'email':'toxicinteger@gmail.com','name':'Ruwaid'});

    },
                    ButtonColor: Colors.black,
                    ButtonStyle: TextStyle(fontSize: 14, color: Colors.white)),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                      text:
                      'If you have an account already , you can  login using existing account by pressing',
                      style: TextStyle(
                          fontSize: 14, color: Color.fromARGB(255, 98, 93, 93)),
                      children: [
                        TextSpan(
                            text: ' Login',
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
