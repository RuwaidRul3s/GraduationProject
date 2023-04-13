import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageButton extends StatelessWidget {

  //Button parameters
  late String ButtonText;
  late Function  On_press_function;

  late Color ButtonColor;

  late String  ImageName;

  late TextStyle ButtonStyle;


  ImageButton({required this.ButtonText,required this.ButtonColor,required this.On_press_function,required this.ImageName,required this.ButtonStyle});

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
      width: ScreenSize.width * 0.4,

      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

         Image(
           image: AssetImage(

                  this.ImageName,


           ),
           width: 24,
           height: 24,
         ),

          TextButton(
            onPressed: () {
              On_press_function();
            },
            child: Text(this.ButtonText,style: ButtonStyle,),
          )
        ],
      )

      ,
    );
  }
}
