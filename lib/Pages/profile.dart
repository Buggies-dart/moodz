import 'package:flutter/material.dart';
import 'package:soundbarz/Pages/premium.dart';
import 'package:soundbarz/Widgets/privacy_policy.dart';
import 'package:soundbarz/Widgets/t_and_c.dart';
import 'package:soundbarz/components.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    return Scaffold( backgroundColor: scaffoldColor,
 appBar: AppBar( title: Text('My Profile', style: Textstyling.titleText(),), centerTitle: true,
 leading: IconButton(onPressed: (){
Navigator.pop(context);
 }, icon: Icon(Icons.arrow_back_ios, color: white))
 ),  
 body: SingleChildScrollView( scrollDirection: Axis.vertical,
   child: Column(
    children: [
   Container( height: sizeQuery.height/3, width: double.infinity,
    decoration: BoxDecoration( gradient: LinearGradient(colors: [
    primaryAssetColor, scaffoldColor
    ])
    ),
   child: Column(
   children: [
   Padding(
    padding: EdgeInsets.only(top: sizeQuery.height/40),
    child: CircleAvatar( backgroundColor: secondaryAssetColor, radius: 45,
    child: Text('B', style: TextStyle( fontSize: 40, fontWeight: FontWeight.bold, color: white),),),
   ),
   Padding(
    padding: EdgeInsets.only(top: sizeQuery.height/80),
    child: Text('Labisi Buggies', style: Textstyling.subtitleText(),),
   ),
   Padding(
    padding:  EdgeInsets.only(top: sizeQuery.height/80),
    child: ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.zero
    )
    ), 
   onPressed: (){}, child: Text('Edit', style: Textstyling.subtitleTextblack(),
    ), 
    ),
   ),
   SizedBox( height: sizeQuery.height/80),
   Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    profileInfo('3', 'Moods'),
    profileInfo('5', 'Playlists'),
    profileInfo('10', 'Favorites'),
   ],)
   ],
   ),
   ),
   SizedBox( height: sizeQuery.height/40),
   listInfos('Notifications', (){}),
   listInfos('Preferences', (){}),
   listInfos('Premium', (){Navigator.push(context, MaterialPageRoute(builder: (context){
    return PremiumModel();
   }));}),
   listInfos('Terms and Conditions', (){Navigator.push(context, MaterialPageRoute(builder: (context){
    return TermsAndConditionsPage();
   }));}),
   listInfos('Privacy Policy', (){
   Navigator.push(context, MaterialPageRoute(builder: (context){
    return PrivacyPolicyPage();
   }));
   }),
   listInfos('Sign Out', (){}),
   listInfos('Delete Account', (){}),
    ],
   ),
 ),
    );
  }

  Column listInfos(String text, VoidCallback onPressed) {
    return Column(
children: [
  ListTile( onTap: onPressed,
    title: Text(text, style: Textstyling.subtitleText(),),
    ),
Divider( thickness: 0.7,)  ],
);
  }

  Column profileInfo(String num, String text) {
    return Column(
children: [
Text(num, style: TextStyle( fontSize: 20, color: white),), Text(text, style: Textstyling.subtitleText(),)
],
);
  }
}