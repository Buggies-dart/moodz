import 'package:flutter/material.dart';

// Recommended Card
Widget recommendedCard(String image, String songTitle, String artistName){
  return Column(
    children: [
      Chip(label: Image.asset(image)),
   Text(songTitle),
   Text(artistName)
    ],
  );
}

// SnackBar
void showSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor:  const Color.fromARGB(255, 208, 209, 212), 
  content: Text(text,  style: const TextStyle( color: Colors.black, fontSize: 18)))
  );
}
