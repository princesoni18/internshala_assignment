import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_assignment_prince_soni/features/filters_page/cities_list.dart';
import 'package:internshala_assignment_prince_soni/features/search_page/bloc/search_bloc.dart';
import 'package:internshala_assignment_prince_soni/widgets/custom_button.dart';
import 'package:internshala_assignment_prince_soni/widgets/custom_textfield.dart';
import 'package:internshala_assignment_prince_soni/widgets/selected_card.dart';


class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final TextEditingController controller=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SearchBloc bloc=BlocProvider.of<SearchBloc>(context,listen: true);
   return Scaffold(

    appBar: AppBar(
      surfaceTintColor: Colors.transparent,
      title: const  Text("City",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),

      actions: [

buttonsRow(context),

Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: GestureDetector(
            
              child: Icon(Icons.notifications_outlined,size: 25,color: Colors.black.withOpacity(0.7),) ,
            ),
          ),

        
      ],
    ),

    body: Padding(
      padding:const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
      
        children: [
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
       
         const SizedBox(height: 15,),
          CustomTextField(controller: controller, hinttext: ""),
          const SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
     
              
              itemCount: cities.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
            
              
              
            
              return checkBoxrow(bloc.cities.contains(cities[index]), cities[index],context);
            },),
          )
        ],
      ),
    ),

    );
  }

 Widget buttonsRow(BuildContext context){

Color color=Theme.of(context).colorScheme.primary;
SearchBloc bloc=BlocProvider.of<SearchBloc>(context,listen: false);
    return Row(

      children: [

         GestureDetector(
          onTap: () {
            bloc.add(ClearCityEvent());
          },
          child: CustomButton(bgColor: Colors.white, text: "Clear all", textColor: color,height: 32,)),
        const SizedBox(width: 12,),
        GestureDetector(
          onTap: () {
            bloc.add(FilterResultsEvent());
            Navigator.pop(context);
          },
          child: CustomButton(bgColor: color, text: "Apply", textColor: Colors.white,height: 32,)),
      ],
    );
  }

  Widget checkBoxrow(bool check,String name, BuildContext context){

   SearchBloc bloc=BlocProvider.of<SearchBloc>(context,listen: false);
    return ListTile(
      splashColor: Colors.transparent,
      minTileHeight: 30,
     onTap: () {
       bloc.add(AddCityEvent(name: name));
     },
      leading: check==true? Icon(Icons.check_box,color: Theme.of(context).colorScheme.secondary):const Icon(Icons.check_box_outline_blank),

      title: Text(name,style: const TextStyle(fontSize: 12),),
    );


  }
}