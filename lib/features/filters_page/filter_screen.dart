import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_assignment_prince_soni/features/filters_page/City_screen.dart';
import 'package:internshala_assignment_prince_soni/features/filters_page/duration_drop_down.dart';
import 'package:internshala_assignment_prince_soni/features/filters_page/profiles_screen.dart';
import 'package:internshala_assignment_prince_soni/features/search_page/bloc/search_bloc.dart';
import 'package:internshala_assignment_prince_soni/widgets/custom_button.dart';
import 'package:internshala_assignment_prince_soni/widgets/custom_textfield.dart';
import 'package:internshala_assignment_prince_soni/widgets/selected_card.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  final TextEditingController startDateCntllr=TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startDateCntllr.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SearchBloc bloc=BlocProvider.of<SearchBloc>(context,listen: true);
    return Scaffold(

      appBar: AppBar(
        leadingWidth: 28,
        surfaceTintColor: Colors.transparent,    
        title: const Text("Filters",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),

        actions: [

           Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
            
              child: Icon(Icons.bookmark_border_rounded,size: 25,color: Colors.black.withOpacity(0.7),) ,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
            
              child: Icon(Icons.notifications_outlined,size: 25,color: Colors.black.withOpacity(0.7),) ,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
            child:  Icon(Icons.messenger_outline_rounded,size: 25,color: Colors.black.withOpacity(0.7),)),
          ),
        ],
      ),

      body:    Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
              const SizedBox(height: 20,),
          
               Text("PROFILE", style: TextStyle(color: Colors.grey.shade600, fontSize: 11),),
              const SizedBox(height: 5,),
              Container(
          width: MediaQuery.of(context).size.width-30,
          height: bloc.profiles.isEmpty?0:30,
           child: ListView.builder(
            shrinkWrap: true,
            itemCount: bloc.profiles.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
             return SelectedCard(name: bloc.profiles[index]);
           },),
         ),
         const SizedBox(height: 10,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const AddProfileScreen(),));
              }, child:   Text("+   Add profile", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.primary))),
          
              const SizedBox(height: 15,),
          
                 Text("CITY", style: TextStyle(color: Colors.grey.shade600, fontSize: 11),),
              const SizedBox(height: 5,),
              Container(
          width: MediaQuery.of(context).size.width-30,
          height: bloc.cities.isEmpty?0:30,
           child: ListView.builder(
            shrinkWrap: true,
            itemCount: bloc.cities.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
             return SelectedCard(name: bloc.cities[index],isCity: true,);
           },),
         ),
         const SizedBox(height: 10,),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CityScreen(),));
              }, child:  Text("+  Add city",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.primary))),
          
              const SizedBox(height: 20,),
          
                
               const SizedBox(height: 20,),
                Text("MAXIMUM DURATION (IN MONTHS)", style: TextStyle(color: Colors.grey.shade600, fontSize: 11),),
                 const SizedBox(height: 10,),
                const DurationDropDown(),
              
               const Spacer(),

                buttonsRow(context),
                const SizedBox(height: 15,),
          
          
             
              
            ],
          ),
        )
     
     
    );
  }

  Widget buttonsRow(BuildContext context){
   Color color=Theme.of(context).colorScheme.primary;
   SearchBloc bloc=BlocProvider.of<SearchBloc>(context,listen: false);
    return Row(
      children: [

        GestureDetector(
          onTap: () {
            bloc.add(ClearAllEvent());
            Navigator.pop(context);
            
          },
          child: CustomButton(bgColor: Colors.white, text: "Clear all", textColor: color,width: MediaQuery.of(context).size.width/2-18,height: 55,border: Border.all(color: color),)),
        const SizedBox(width: 12,),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CustomButton(bgColor: color, text: "Apply", textColor: Colors.white,width: MediaQuery.of(context).size.width/2-18,height: 55,)),
      ],
    );
  }
}