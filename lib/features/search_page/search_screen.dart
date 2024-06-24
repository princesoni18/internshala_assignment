import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:internshala_assignment_prince_soni/features/filters_page/filter_screen.dart';
import 'package:internshala_assignment_prince_soni/features/search_page/bloc/search_bloc.dart';
import 'package:internshala_assignment_prince_soni/services/internships_repo.dart';
import 'package:internshala_assignment_prince_soni/widgets/application_card.dart';
import 'package:internshala_assignment_prince_soni/widgets/selected_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SearchBloc>(context,listen: false).add(LoadInternshipsEvent());
  }

  @override
  Widget build(BuildContext context) {
    SearchBloc bloc=BlocProvider.of<SearchBloc>(context,listen: true);
    ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 28,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Internships",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
                child: Icon(
              Icons.search_rounded,
              size: 25,
              color: Colors.black.withOpacity(0.7),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              child: Icon(
                Icons.bookmark_border_rounded,
                size: 25,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              child: Icon(
                Icons.notifications_outlined,
                size: 25,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                child: Icon(
              Icons.messenger_outline_rounded,
              size: 25,
              color: Colors.black.withOpacity(0.7),
            )),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: BlocBuilder<SearchBloc, SearchState>(

        buildWhen: (previous, current) => current is !ActionState,
        bloc:bloc,
        builder: (context, state) {

          if(state is LoadedInternshipsState){

          
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
                      width: 90,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FilterScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: colors.primary, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              size: 14,
                            ),
                            Text(
                              "Filters",
                              style: TextStyle(fontSize: 9),
                            )
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(width: 5,),
                 
                  
                  
                  bloc.profiles.isNotEmpty||bloc.cities.isNotEmpty?Expanded(
                    child: Container(
                             
                              height: bloc.profiles.isEmpty?0:30,
                                
                               child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: bloc.profiles.length+bloc.cities.length,
                                scrollDirection: Axis.horizontal,
                             
                                itemBuilder: (context, index) {
                                  if(index<bloc.profiles.length){

                                     return SelectedCard(name: bloc.profiles[index],radius: 20,);
                                  }
                                  else {

                                    return SelectedCard(name: bloc.cities[index-bloc.profiles.length],radius: 20,isCity: true,);
                                  }
                                
                               },),
                             ),
                  ):Container(),

                 



                ],
              ),
              const SizedBox(
                height: 5,
              ),
               Text("${state.internships.length.toString()} total internships",style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 10,fontWeight: FontWeight.w300),),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 0.5,
                width: double.maxFinite,
                color: Colors.grey[300],
              ),
               state.internships.isEmpty?const Center(child: Text("No internships found"),):Container(),
              Expanded(
                child: ListView.separated(
                  itemCount: state.internships.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 8,
                      width: double.maxFinite,
                      color: Colors.grey[100],
                    );
                  },
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return  ApplicationCard(details:state.internships[index]);
                  },
                ),
              ),

            ],

           
          );


          }

          else if(state is NotLoadedState){
          return const Center(child: Text("Unable to Load Internships.."),);

          }

          return const Center(child: Text("Loading...."),);
          
        },
      ),
    );
  }
}
