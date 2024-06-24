import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final Widget? suffix;
  final Function(String)? onchanged;
  const CustomTextField({super.key,required this.controller, required this.hinttext, this.suffix,this.onchanged});

  @override
  Widget build(BuildContext context) {
    return TextField(

   
      controller: controller,
      onChanged: onchanged,

      decoration: InputDecoration(

   contentPadding: const EdgeInsets.symmetric(horizontal: 7,vertical: 5),
   suffixIcon: suffix,
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(5),

          borderSide: BorderSide(color: Colors.grey.shade400)

          
        ),
        enabledBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(5),

          borderSide: BorderSide(color: Colors.grey.shade400)

          
        ),

        
      ),


    );
  }
}