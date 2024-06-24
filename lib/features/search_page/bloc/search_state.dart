part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class LoadedInternshipsState extends SearchState {
  final List<InternshipModel> internships;

  LoadedInternshipsState({required this.internships});
}
final class NotLoadedState extends SearchState{


}

final class ActionState extends SearchState{}

final class UpdatedFiltersActionState extends SearchState{}
