import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stonefireplace/Widgets/ApplicationButton.dart';
import 'package:stonefireplace/Widgets/ApplicationForm.dart';

class OTP_Screen extends StatefulWidget {
  static const ScreenID ='OTP';
  const OTP_Screen({Key? key}) : super(key: key);

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  var code="";
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home: Scaffold(
         backgroundColor:Color.fromARGB(255, 39, 17, 5),
           body: SafeArea(
             child: Form(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Verification code',style:TextStyle(color: Colors.white,fontSize: 16),),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [

                       SizedBox(

                         height: 62,
                         width: 52,
                         child: TextField(
                           onChanged: (value){
                          code+=value;
                           },
                           decoration: InputDecoration(
                             filled: true,
                             fillColor: Colors.white
                           ),
                           keyboardType: TextInputType.number,
                           inputFormatters: [LengthLimitingTextInputFormatter(1),
                             FilteringTextInputFormatter.digitsOnly
                           ],
                         ),
                       ),
                       SizedBox(

                         height: 62,
                         width: 52,
                         child: TextField(
                           onChanged: (value){
                             code+=value;
                           },
                           decoration: InputDecoration(
                               filled: true,
                               fillColor: Colors.white
                           ),
                           keyboardType: TextInputType.number,
                           inputFormatters: [LengthLimitingTextInputFormatter(1),
                             FilteringTextInputFormatter.digitsOnly
                           ],
                         ),
                       ),
                       SizedBox(

                         height: 62,
                         width: 52,
                         child: TextField(
                           onChanged: (value){
                             code+=value;
                           },
                           decoration: InputDecoration(
                               filled: true,
                               fillColor: Colors.white
                           ),
                           keyboardType: TextInputType.number,
                           inputFormatters: [LengthLimitingTextInputFormatter(1),
                             FilteringTextInputFormatter.digitsOnly
                           ],
                         ),
                       ),
                       SizedBox(

                         height: 62,
                         width: 52,
                         child: TextField(
                           onChanged: (value){
                             code+=value;
                           },
                           decoration: InputDecoration(
                               filled: true,
                               fillColor: Colors.white
                           ),
                           keyboardType: TextInputType.number,
                           inputFormatters: [LengthLimitingTextInputFormatter(1),
                             FilteringTextInputFormatter.digitsOnly
                           ],
                         ),
                       ),
                       SizedBox(

                         height: 62,
                         width: 52,
                         child: TextField(
                           onChanged: (value){
                             code+=value;
                           },
                           decoration: InputDecoration(
                               filled: true,
                               fillColor: Colors.white
                           ),
                           keyboardType: TextInputType.number,
                           inputFormatters: [LengthLimitingTextInputFormatter(1),
                             FilteringTextInputFormatter.digitsOnly
                           ],
                         ),
                       ),
                       SizedBox(

                         height: 62,
                         width: 52,
                         child: TextField(
                           onChanged: (value){
                             code+=value;
                           },
                           decoration: InputDecoration(
                               filled: true,
                               fillColor: Colors.white
                           ),
                           keyboardType: TextInputType.number,
                           inputFormatters: [LengthLimitingTextInputFormatter(1),
                             FilteringTextInputFormatter.digitsOnly
                           ],
                         ),
                       ),
                     ],
                   ) ,
                   ApplicationButton(ButtonText: 'Verifty phone number', On_press_function:() async{
                     print(code);
                      PhoneAuthCredential credential=PhoneAuthProvider.credential(verificationId: ApplicationForm.verify, smsCode: code);
                      await _auth.signInWithCredential(credential);

                   }, ButtonColor:Colors.black, ButtonStyle:TextStyle(fontSize: 14,color: Colors.white))
                 ],
               ),
             ),
           ),  
       ),
     );
  }
}
