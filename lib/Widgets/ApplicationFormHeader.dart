import 'package:flutter/material.dart';


class FormHeader extends StatelessWidget {
  const FormHeader({Key? key,required this.HeaderText}) : super(key: key);
  final String HeaderText;
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(HeaderText,style: TextStyle(fontSize:24,fontWeight: FontWeight.w600,color: Colors.white),),
            Divider(
              color: Colors.white,
              height: 30,
              thickness: 1,

            )
          ],
        ),
    );
  }
}
