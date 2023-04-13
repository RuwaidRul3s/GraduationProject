import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatefulWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  State<CustomDrawerHeader> createState() => _CustomDrawerHeaderState();
}

class _CustomDrawerHeaderState extends State<CustomDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
        margin: EdgeInsets.only(top: 30),
          child:
          Column(
            children: [
              Image(
                image:AssetImage(
                    'images/DrawerHeader.png'
                ),

                width: 133,
                height:133 ,
              ),
              SizedBox(height: 10,)
              ,
              Text('Stone Fireplace',style: TextStyle(fontSize: 12,color: Colors.white),)
            ],
          )
          ,
        ),
      ),
    );
  }
}
