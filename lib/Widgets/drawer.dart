import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:soundbarz/Pages/profile.dart';
import 'package:soundbarz/Widgets/userplaylist.dart';
import 'package:soundbarz/components.dart';

class UserDrawer
 extends StatefulWidget {
  const UserDrawer
({super.key});
  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    return  Drawer(
      backgroundColor: Colors.black,
      child: Column(
      children: [
     Container( color: scaffoldColor,
    width: double.infinity, height: sizeQuery.height/6.8,
   child:  Column(
    children: [
    SizedBox( height: sizeQuery.height/50,),
    Padding(
      padding:  EdgeInsets.only(left: sizeQuery.width/30),
      child: Row( crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar( radius: sizeQuery.height/40, backgroundColor: secondaryAssetColor,
            child: Icon(Icons.person, color: Colors.black, size: sizeQuery.height/25,),
          ),
           SizedBox( width: sizeQuery.width/50,),
         Padding(
           padding:  EdgeInsets.only(top: sizeQuery.height/25),
           child: Column(
             children: [
               Text('Buggies', style: Textstyling.subtitleText(),),
                   TextButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
return Profile();
}));
                   }, child: const Text('View Profile', style: TextStyle(color: white),
              )
              )   ],
           ),
         ),  ],
      ),
    ),
    ],
   ),
     ),
    SizedBox( height: sizeQuery.height/40,),
tiles(sizeQuery, Icons.playlist_play_sharp, 'My Playlists', Text(''),
(){Navigator.push(context, MaterialPageRoute(builder: (context){
return Userplaylist();
}));
     }),
  tiles(sizeQuery, MdiIcons.themeLightDark, 'Themes', const Text(''), (){}),
  tiles(sizeQuery, MdiIcons.car, 'Drive Mode', Switch(value: isSwitched, onChanged: (value){
   setState(() {
  isSwitched = value;
   });
     },
      activeColor: Colors.blueAccent, // Color when ON
     inactiveThumbColor: Colors.grey, // Thumb color when OFF
      inactiveTrackColor: Colors.white24,),
     (){}),
     tiles(sizeQuery, Icons.settings, 'Settings and Privacy', const Text(''), (){}),
     tiles(sizeQuery, Icons.logout_outlined, 'Sign Out', const Text(''), (){}),
      ],
      ),
    );
  }

  Widget tiles(Size sizeQuery, IconData icon, String text, Widget action, VoidCallback tap ) {
    return Column(
     children: [
       ListTile( leading: Icon(icon, color: secondaryAssetColor, size: sizeQuery.height/30,),
          title:  Text(text, style: const TextStyle(color: white),),
         onTap: tap ),
      Divider( thickness: 0.2, indent: sizeQuery.width/8,),
    SizedBox( height: sizeQuery.height/40,) ],
   );
  }
}