import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundbarz/Onboarding/splashscreen.dart';
import 'package:soundbarz/Providers/playsongs.dart';
import 'package:soundbarz/Providers/statemanagement.dart';
import 'package:soundbarz/components.dart';

void main() {
  runApp(
    
  const ProviderScope(child: 
   MyApp()));
}
final myNotifProvider = ChangeNotifierProvider<FavoritesNotifier>((ref)=> FavoritesNotifier());
final playSongProvider = ChangeNotifierProvider<Playsongs>((ref)=> Playsongs());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
return MaterialApp(
theme: ThemeData(
scaffoldBackgroundColor: scaffoldColor, appBarTheme: const AppBarTheme( 
backgroundColor: scaffoldColor
)
),
      
title: 'Moodz',
debugShowCheckedModeBanner: false,
home: const SplashScreen()
);
  }
}


