import 'package:flutter/material.dart';
import 'package:soundbarz/Pages/homepage.dart';
import 'package:soundbarz/Pages/navigation.dart';
import 'package:soundbarz/components.dart';
import 'package:soundbarz/mood_list.dart';
import 'package:soundbarz/utils.dart';

class MoodSelectionPage extends StatefulWidget {
  const MoodSelectionPage({super.key});

  @override
  MoodSelectionPageState createState() => MoodSelectionPageState();
}

class MoodSelectionPageState extends State<MoodSelectionPage> {
void onTap(){
  if (selectedMoods.isEmpty) {
    showSnackBar(context, 'Select atleast 3 moods to proceed.');
  } else {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return  const Navigation(
child: Homepage(),
    );
  }));
  }
 
}
  
  void toggleGenre(String mood) {
    setState(() {
    if (selectedMoods.containsKey(mood) && selectedMoods[mood] == true) {
      selectedMoods.remove(mood); 
    } else {
      selectedMoods[mood] = true; 
    }
  });
  }

  @override
  Widget build(BuildContext context) {
  final sizeQuery = MediaQuery.of(context).size;

    return Scaffold(
    
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 buttons per row
                  mainAxisSpacing: 16, // Vertical spacing
                  crossAxisSpacing: 16, // Horizontal spacing
                  childAspectRatio: 4, // Button width-to-height ratio
                ),
                itemCount: moods.length,
                itemBuilder: (context, index) {
                  final mood = moods[index];
                  final isSelected = selectedMoods[mood] ?? false;
                        
                  return ElevatedButton(
                    onPressed: () {
                      toggleGenre(mood);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? primaryAssetColor : Colors.transparent,
                      foregroundColor: isSelected ? Colors.white : Colors.black,
                      side: const BorderSide(color: Colors.black, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      mood,
                      style: TextStyle( color: Colors.white,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Spacer(),
        Padding(
     padding: EdgeInsets.only(bottom: sizeQuery.height/35),
     child: Container( width: sizeQuery.width/1.1, 
      decoration: const BoxDecoration( gradient: LinearGradient(colors: [
      primaryAssetColor, secondaryAssetColor
     ])),
       child: ElevatedButton(onPressed: onTap, style: ElevatedButton.styleFrom(
       backgroundColor: Colors.transparent, shadowColor: Colors.transparent,
       ),
        child: Text('I\'M ALL SET!', style: Textstyling.titleText(),)),
     ),
   )  ],
      ),
    );
  }
}