part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class LoadInternshipsEvent extends SearchEvent{}
final class AddProfileEvent extends SearchEvent{

   
   final String name;

  AddProfileEvent({required this.name});

}
final class AddCityEvent extends SearchEvent{

  final String name;

  AddCityEvent({required this.name});
  
}
final class ClearCityEvent extends SearchEvent{}

final class ClearProfilesEvent extends SearchEvent{}

final class FilterResultsEvent extends SearchEvent{


}
final class ClearAllEvent extends SearchEvent{

}
final class UpdateDuration extends SearchEvent{

  final String newDuration;

  UpdateDuration({required this.newDuration});
}
