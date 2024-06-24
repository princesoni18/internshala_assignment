import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final  bgColor;
  final textColor;
  final String text; 
  final double? width;
  final double? height;
  final Border? border;
  const CustomButton({super.key,required this.bgColor,required this.text, required this.textColor,this.width,this.height=40,this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      
     padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
        border: border
      ),
      alignment: Alignment.center,

      child: Text(text,style: TextStyle(color: textColor,fontSize: 13),),
    );
  }
}