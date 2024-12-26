import 'package:flutter/material.dart';
import 'package:soundbarz/Pages/homepage.dart';
import 'package:soundbarz/components.dart';

class SelectedGenre extends StatelessWidget {
  const SelectedGenre({super.key});

  @override
  Widget build(BuildContext context) {
  void onTap (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return const Homepage();
    }));
  }
  final sizeQuery = MediaQuery.of(context).size;
    return  Scaffold(
      body: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: sizeQuery.height/7,),
          Center(
            child: Icon(Icons.check_circle, size: sizeQuery.width/1.2, color: primaryAssetColor,),
          ),
       Column(
         children: [
           Text('Cheers Mate.', style: Textstyling.titleText(),),
        Text('You are up and ready to have a feel of Soundbarz!', style: Textstyling.subtitleText(),
        textAlign: TextAlign.center, ) ],
       ),
      SizedBox( height: sizeQuery.height/4,),
Container( width: sizeQuery.width/1.1, 
      decoration: const BoxDecoration( gradient: LinearGradient(colors: [
      primaryAssetColor, secondaryAssetColor
     ])),
       child: ElevatedButton(onPressed: onTap, style: ElevatedButton.styleFrom(
       backgroundColor: Colors.transparent, shadowColor: Colors.transparent,
       ),
        child: Text('START LISTENING', style: Textstyling.titleText(),)),
     ),
   ],
      ),
    );
  }
}