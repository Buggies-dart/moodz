import 'package:flutter/material.dart';
import 'package:soundbarz/Widgets/genres.dart';
import 'package:soundbarz/components.dart';

class MoodSelect extends StatefulWidget {
  const MoodSelect({super.key});

  @override
  State<MoodSelect> createState() => _MoodSelectState();
}
class _MoodSelectState extends State<MoodSelect> {

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar( title: Container( color: null, width: sizeQuery.width/5, height: sizeQuery.width/5,
        child: Image.asset('assets/logos/applogo.png', fit: BoxFit.contain,)),
      centerTitle: true,),
    body:  Column( crossAxisAlignment: CrossAxisAlignment.center,
      children: [
const Padding(
  padding: EdgeInsets.all(12),
  child: Align( alignment: Alignment.topLeft,
    child: Text('SET YOUR \nMOODS', style: TextStyle( fontSize: 40, fontWeight: FontWeight.bold, 
    color: Colors.white),),
  ),
),
 SizedBox( height: sizeQuery.height/25),
    Center(child: Text('What Are Your Moodz?', style: Textstyling.titleText(),)),
     const Expanded(child: MoodSelectionPage()),
    ],
    ),);
  }
}


