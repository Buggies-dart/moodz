import 'package:flutter/material.dart';
import 'package:soundbarz/Widgets/allsongs.dart';
import 'package:soundbarz/Widgets/drawer.dart';
import 'package:soundbarz/Widgets/moods.dart';
import 'package:soundbarz/Widgets/playlist.dart';
import 'package:soundbarz/components.dart';

class Songs extends StatefulWidget {
  const Songs({super.key});

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  @override
  Widget build(BuildContext context) {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return  DefaultTabController( length: 3,
      child: Scaffold(
          drawer: const UserDrawer(),  key: scaffoldKey,
        appBar: AppBar( leading: IconButton(onPressed: (){
scaffoldKey.currentState?.openDrawer();
        },
         icon: const Icon(Icons.list, color: white, size: 30,),),
        title: Text('Songs', style: Textstyling.titleText(),), centerTitle: true,
        actions: const [Padding(
          padding: EdgeInsets.only(right: 10 ),
          child: Icon(Icons.search, color: dividerColor,size: 30,),
        )],
        bottom:  TabBar(tabs: [Text('All Songs', style: Textstyling.subtitleText(),),
        Text('PlayLists', style: Textstyling.subtitleText()),
        Text('Moods', style: Textstyling.subtitleText())
        ],
       indicatorColor: secondaryAssetColor,  dividerHeight: 0.5),
        ),
     body: const TabBarView(children: [
AllSongs(), 
PlayLists(),
MoodsPageState(),
     ]) ),
    );
  }
}