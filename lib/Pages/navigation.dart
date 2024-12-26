import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:soundbarz/Pages/MoodzAI.dart';
import 'package:soundbarz/Pages/premium.dart';
import 'package:soundbarz/Pages/homepage.dart';
import 'package:soundbarz/Pages/songs.dart';
import 'package:soundbarz/components.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, required this.child});
  final Widget child;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<Widget> navigations = const[ Homepage(), ChatPage(), Songs(), PremiumModel()];
 int index = 0;
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
      backgroundColor: scaffoldColor,
      bottomNavigationBar: Material( elevation: 40,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
          backgroundColor: scaffoldColor, 
          items: const [ 
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
             BottomNavigationBarItem(icon: Icon(MdiIcons.robot), label: 'Moodz AI'), 
             BottomNavigationBarItem(icon: Icon(MdiIcons.music), label: 'Songs'), 
             BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Premium') ],
            currentIndex: index, iconSize: 24, selectedItemColor: primaryAssetColor, 
            unselectedItemColor: dividerColor,  
             onTap: (value) { setState(() {index = value; });
          },
         ),
      ),
     body: navigations[index],
    );
  }
}