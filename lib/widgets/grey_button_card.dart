import 'package:flutter/material.dart';

class GreyCard extends StatelessWidget {
  final String text;
  final IconData? icon;
  const GreyCard({super.key,required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
   padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
      decoration: BoxDecoration(

        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(7),
      ),

      child: FittedBox(
        child: Row(
         
          children: [
            icon==null?Container(width: 0,):Icon(icon,color:Colors.grey.shade800,size: 16,),
            icon==null?const SizedBox():const SizedBox(width: 5,),
            Text(text,style:  TextStyle(color: Theme.of(context).colorScheme.tertiary,fontSize: 10),),
          ],
        ),
      ),
    );
  }
}