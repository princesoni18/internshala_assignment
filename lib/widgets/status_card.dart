// for showing actively hiring container

import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String status;
  const StatusCard({super.key,required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(5),
      width: 105,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(5),
        border: Border.all(color:Colors.grey.shade300 )
      ),

      child:  Row(
        children: [
           Icon(Icons.arrow_upward_rounded,size: 13,color: Theme.of(context).colorScheme.primary,),
          Text(status,style:  TextStyle(fontSize: 9,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),)

        ],
      ),
    );
  }
}