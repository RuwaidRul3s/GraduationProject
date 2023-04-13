import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget Drawer_Item({required String text,required IconData icon,required Function onCLick})

{
    return
        Text(text,style: TextStyle(fontSize: 14,color: Colors.white),);

}