import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stonefireplace/Drawer/Drawer_header.dart';
import 'package:stonefireplace/Drawer/DrawerItem.dart';
import 'package:stonefireplace/Widgets/ApplicationButton.dart';
import 'package:stonefireplace/Base/Constants.dart';
class HomeScreen extends StatefulWidget {
  static const  String ScreenID='HomePageScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth=FirebaseAuth.instance;

  void GetCurrentUser()
  {

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ApplicationPrimaryColor,
        appBar: AppBar(
          title: Image(
            image: AssetImage('images/DrawerHeader.png'),
            width: 42,
            height: 42,
          ),
          centerTitle: true,
          backgroundColor: ApplicationPrimaryColor,
          elevation: 0,
        ),
        body: Container(),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 39,17,5),
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomDrawerHeader(),
                  Container(
                    width: 300,
                    child: Divider(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 40,),
                  Drawer_Item(text: 'Home', icon: Icons.home, onCLick: (){}),
                  SizedBox(height: 40,),
                  Drawer_Item(text: 'Gas Fireplace', icon: Icons.home, onCLick: (){}),
                  SizedBox(height: 40,),
                  Drawer_Item(text: 'Electric Fireplace', icon: Icons.home, onCLick: (){}),
                  SizedBox(height: 40,),
                  Drawer_Item(text: 'Wood Fireplace', icon: Icons.home, onCLick: (){}),
                  SizedBox(height: 40,),
                  Drawer_Item(text: '3D Decor', icon: Icons.home, onCLick: (){}),
                  SizedBox(height: 40,),
                  Drawer_Item(text: 'My Orders', icon: Icons.home, onCLick: (){}),
                  SizedBox(height: 40,),

                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25),

                      child: Text('Need any help with fireplaces , our team of professional engineer will help you',
                        style: TextStyle(fontSize: 14,color: Color.fromARGB(255, 98, 93, 93))),
                    ),
                  SizedBox(height: 40,),
                  ApplicationButton(
                    ButtonText: 'Contact US',
                    ButtonColor: Colors.black,
                    On_press_function: (){},
                    ButtonStyle: TextStyle(fontSize: 14,color: Colors.white),
                    Button_Width_multiplier: 0.6,
                  ),

                ],
              ),
          ),
        ),
      ),

    );
  }
}
