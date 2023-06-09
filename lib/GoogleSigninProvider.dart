import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier
{
      final googleSignIn = GoogleSignIn();

      GoogleSignInAccount ? _user;

      GoogleSignInAccount get user=>_user!;

//      show sigin-dialouge

      Future GoogleLogin() async
      {
          final googleUser= await googleSignIn.signIn();

          if(googleUser!=null)
            {
              _user=googleUser;

              final googleAuth=await googleUser.authentication;

              final credentials=GoogleAuthProvider.credential(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken
              );

              await FirebaseAuth.instance.signInWithCredential(credentials);



              notifyListeners();

            }

      }

}