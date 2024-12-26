import 'package:flutter/material.dart';
// Colors
const scaffoldColor = Color.fromARGB(250, 24, 27, 44);
const primaryAssetColor = Color.fromARGB(250, 237, 135, 112);
const secondaryAssetColor = Color.fromARGB(250, 217, 81, 157);
const white = Colors.white;
const tertiaryAssetColor = Color.fromARGB(250, 88, 92, 102);
const dividerColor = Color.fromARGB(250, 88, 90, 102);
// TextStyle
class Textstyling{
static titleText(){
return const TextStyle( color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold);
}
static titleTextXL(){
return const TextStyle( color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
}
static titleTextblack(){
return const TextStyle( color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold);
}
static subtitleText(){
return const TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
}
static subtitleTextblack(){
return const TextStyle( color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
}
static bodyTextMedium(String text){
  return Text(
text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
overflow: TextOverflow.ellipsis, maxLines: 1);
}
}

