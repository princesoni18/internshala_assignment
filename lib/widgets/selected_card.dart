import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_assignment_prince_soni/features/search_page/bloc/search_bloc.dart';

class SelectedCard extends StatelessWidget {
  final String name;
  final double? radius;
  final bool isCity;
  const SelectedCard({super.key,required this.name ,this.isCity=false,this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
      decoration: BoxDecoration(
     color: Theme.of(context).colorScheme.primary,
     borderRadius: BorderRadius.circular(radius??7)
      ),
    
      height: 20,

      child: Row(
        children: [Text(name,style: const TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w300),),
         const SizedBox(width: 5,),
        GestureDetector(
          onTap: () {
            
            BlocProvider.of<SearchBloc>(context,listen: false).add(isCity==true?AddCityEvent(name: name):AddProfileEvent(name: name));
          },
          child: const Icon(Icons.close,color: Colors.white,size: 22,))
        ],
      ),
    );
  }
}