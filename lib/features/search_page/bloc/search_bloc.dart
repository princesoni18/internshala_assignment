import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:internshala_assignment_prince_soni/models/internship_model.dart';
import 'package:internshala_assignment_prince_soni/services/internships_repo.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  List<String> _cities=[];


  List<String> get cities=>_cities;
  List<InternshipModel> internships=[];

  String _duration="any";
  
  List<String> _profiles=[];

  List<String> get profiles=>_profiles;

  String get duration=>_duration;

  SearchBloc() : super(SearchInitial()) {
    on<LoadInternshipsEvent>(loadInternshipsEvent);
    on<AddProfileEvent>(addProfileEvent);
    on<AddCityEvent>(addCityEvent);
    on<ClearCityEvent>(clearCityEvent);
    on<ClearProfilesEvent>(clearProfilesEvent);
    on<FilterResultsEvent>(filterResultsEvent);
    on<ClearAllEvent>(clearAllEvent);
    on<UpdateDuration>(updateDuration);
  }

  FutureOr<void> loadInternshipsEvent(LoadInternshipsEvent event, Emitter<SearchState> emit) async{

    try{

     internships=await FetchInternships.loadInternships();

    if(internships.isEmpty){

      emit(NotLoadedState());
    }
    else {
         
      emit(LoadedInternshipsState(internships: internships));
    }

    }

    catch(e){


      emit(NotLoadedState());
    }

  }

  FutureOr<void> addProfileEvent(AddProfileEvent event, Emitter<SearchState> emit) {

    if(_profiles.contains(event.name)){

      _profiles.remove(event.name);
      add(FilterResultsEvent());
    }
    else{ _profiles.add(event.name);}
    emit(UpdatedFiltersActionState());
  }

  FutureOr<void> addCityEvent(AddCityEvent event, Emitter<SearchState> emit) {

    if(_cities.contains(event.name)){

      _cities.remove(event.name);
      add(FilterResultsEvent());
    }
    else{ _cities.add(event.name);}

    emit(UpdatedFiltersActionState());
  }

  FutureOr<void> clearCityEvent(ClearCityEvent event, Emitter<SearchState> emit) {

    _cities.clear();
    add(FilterResultsEvent());
    emit(UpdatedFiltersActionState());

  }

  FutureOr<void> clearProfilesEvent(ClearProfilesEvent event, Emitter<SearchState> emit) {
    _profiles.clear();
    add(FilterResultsEvent());
    emit(UpdatedFiltersActionState());
  }

  FutureOr<void> filterResultsEvent(FilterResultsEvent event, Emitter<SearchState> emit) {

    List<InternshipModel> filtered=[];

    if(_profiles.isNotEmpty){
     
        internships.forEach((internship){

          if(_profiles.contains(internship.profile)){
            
           
            filtered.add(internship);
          }
        });


        
    }
    if(filtered.isEmpty){
      filtered=internships;
    }
   List<InternshipModel> results=[];
    if(_cities.isNotEmpty){
     
        filtered.forEach((internship){

          if(_cities.contains(internship.location)){
 
                  results.add(internship);
          }
          else {

           
          }
        });
    }

    if(_cities.isEmpty){

      results=filtered;
     
    }
    List<InternshipModel> newResults=[];
    if(_duration.isNotEmpty){
      
       results.forEach((internship){
         String val="${_duration} Months";
        
      
         if(internship.duration==val){

          newResults.add(internship);
         }
       });

    }
if(duration.isEmpty||duration=='any'){
  emit(LoadedInternshipsState(internships: results));
}
 else { emit(LoadedInternshipsState(internships:newResults ));
  }}

  FutureOr<void> clearAllEvent(ClearAllEvent event, Emitter<SearchState> emit) {

    _profiles.clear();
    _cities.clear();
    _duration='any';
    emit(LoadedInternshipsState(internships: internships));
  }

  FutureOr<void> updateDuration(UpdateDuration event, Emitter<SearchState> emit) {

    _duration=event.newDuration;
    print("insfsdjfnsjdfjdfdf");
    add(FilterResultsEvent());
  }
}
