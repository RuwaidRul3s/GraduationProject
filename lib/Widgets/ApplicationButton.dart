import 'package:flutter/material.dart';



class ApplicationButton extends StatelessWidget {
  //Button parameters
 late  String ButtonText;
 late Function  On_press_function;

late TextStyle ButtonStyle;

  late Color ButtonColor;

  late double Button_Width_multiplier;
  ApplicationButton(
      {required this.ButtonText,required this.On_press_function, required this.ButtonColor,required this.ButtonStyle,this.Button_Width_multiplier=0.8});


  @override
  Widget build(BuildContext context) {
    Size ScreenSize = MediaQuery
        .of(context)
        .size;

      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: this.ButtonColor

        ),
        height: 42,
        width: ScreenSize.width * this.Button_Width_multiplier,

        child:

        TextButton(
          onPressed: () {
            On_press_function!();
          },
          child: Text(this.ButtonText,style:this.ButtonStyle,),
        )
        ,
      );
    }

  }

