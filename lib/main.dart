import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:internshala_assignment_prince_soni/features/search_page/bloc/search_bloc.dart';
import 'package:internshala_assignment_prince_soni/features/search_page/search_screen.dart';
import 'package:internshala_assignment_prince_soni/themes/light_theme.dart';

void main() {
  
  
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => SearchBloc(),)
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // this app contains search screen with the filter page like
  // internshala, i tried to make it similar as much as possible 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prince Soni Assignment Internshala',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SearchScreen(),
    );
  }
}

