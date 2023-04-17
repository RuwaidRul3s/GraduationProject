import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stonefireplace/Widgets/ApplicationButton.dart';
import 'package:stonefireplace/Widgets/ApplicationFormHeader.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({Key? key,required this.FormHeader_Text}) : super(key: key);
  final String FormHeader_Text;
  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  var PhoneNumber="";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                FormHeader(HeaderText:widget.FormHeader_Text),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Full Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: Colors.white,
                      label: Text('Full Name'),
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
                IntlPhoneField(
                  onChanged: (value){
                   PhoneNumber= value.completeNumber;

                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Phone Number',
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.white))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
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
                    On_press_function: () async {
                      if(_formKey.currentState!.validate())
                        {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber:PhoneNumber,
                            verificationCompleted: (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent: (String verificationId, int? resendToken) {},
                            codeAutoRetrievalTimeout: (String verificationId) {},
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
