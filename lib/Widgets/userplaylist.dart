import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundbarz/Widgets/favoriteplaylist_page.dart';
import 'package:soundbarz/Widgets/playlist.dart';
import 'package:soundbarz/components.dart';
import 'package:soundbarz/main.dart';

class Userplaylist extends ConsumerStatefulWidget {
  const Userplaylist({super.key});

  @override
  ConsumerState<Userplaylist> createState() => _UserplaylistState();
}

class _UserplaylistState extends ConsumerState<Userplaylist> {
  @override
  Widget build(BuildContext context) {
final addedPlaylists = ref.watch(myNotifProvider).favorites;
    final sizeQuery = MediaQuery.of(context).size;
    return  Scaffold(
    appBar: AppBar(
  title: Text('Your Playlists' ,style: Textstyling.titleTextXL(),), centerTitle: false, leading: Padding(
    padding: const EdgeInsets.only(left: 10),
    child: CircleAvatar( backgroundColor: secondaryAssetColor, radius: 45,
      child: Text('B', style: TextStyle( fontSize: 40, fontWeight: FontWeight.bold, color: white),),),
  ),
actions: [ IconButton(onPressed: (){
}, icon: Icon(Icons.search, size: 30, color: white,)),
IconButton(onPressed: (){}, icon: Icon(Icons.add, size: 30, color: white,))
],    ),
      body: SingleChildScrollView( scrollDirection: Axis.vertical,
        child: Column( mainAxisSize: MainAxisSize.min,
          children: [
        SizedBox( height: sizeQuery.height/40,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Row(
            children: [
        Icon(Icons.swap_vert, color: white,),  
        SizedBox(width: 8),     // Adds spacing between the icon and text
             Textstyling.bodyTextMedium('Recents')// Proper text styling
            
            ],
          ),
          Icon(Icons.grid_4x4, color: white,)],
          ),
        ), 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
            children: [ Container( height: sizeQuery.height/10, width: sizeQuery.width/4.5,
            decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
            secondaryAssetColor, white
            ])
            ),
             child: Icon(MdiIcons.heart, color: white, size: 35,),),
          SizedBox( width: sizeQuery.height/35,),
           Column( crossAxisAlignment: CrossAxisAlignment.start,
             children: [
         Text('Favorite Songs', style: Textstyling.subtitleText(),),
           Textstyling.bodyTextMedium('Tracks • 20 Songs')  ],
           ), ]
            ),
          ), 
          addedPlaylists.isEmpty ?
  Padding( 
    padding:  EdgeInsets.only(top: sizeQuery.height/6),
    child: Column( 
      children: [
        Text('You have not favorited any playlist yet.\nLet\'s get the ball rolling!', style: TextStyle(
    fontSize: 20, color: Colors.white70
        ),),
    SizedBox(height: sizeQuery.height/35,),
      InkWell( onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context){
    return PlayLists();
      })),
        child: Container(  height: 60, width: 200,
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),
        gradient:LinearGradient(colors: [
        primaryAssetColor, secondaryAssetColor
        ])
        ),
          child: Center(child: Text('Explore Playlists', style: Textstyling.subtitleText(), maxLines: 1,)),
        ),
      )
      ],
    ),
  ) :
        Flexible( fit: FlexFit.loose,
          child: ListView.builder( itemCount: addedPlaylists.length, shrinkWrap: true,
          itemBuilder: (context, index){
          final addedPlaylist = addedPlaylists[index];
            return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
return  FavoriteplaylistPage(firstIndex: index,);
}));
},
              child: Row(
              children: [ Container( height: sizeQuery.height/10, width: sizeQuery.width/4.5,
              decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(addedPlaylist.coverImage),
                        fit: BoxFit.cover)
              ),
              ),
                        SizedBox( width: sizeQuery.height/35,),
                         Column( crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(addedPlaylist.title, style: Textstyling.subtitleText(),),
                         Textstyling.bodyTextMedium('Playlist • ${addedPlaylist.songs.length} songs')  ],
                         ), ]
              ),
            ),
          );       
            }),
        )
           ],
        ),
      )
    );
  }

  Widget favorites(Size sizeQuery) {
    return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
  children: [ Container( height: sizeQuery.height/10, width: sizeQuery.width/4.5,
  decoration: BoxDecoration(
image: DecorationImage(image: NetworkImage( "https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733390074/pexels-budgeron-bach-5157200_b6nq8u.jpg"),
fit: BoxFit.cover)
  ),
  ),
SizedBox( width: sizeQuery.height/35,),
 Column( crossAxisAlignment: CrossAxisAlignment.start,
   children: [
     Text('Laid Back Grooves', style: Textstyling.subtitleText(),),
 Textstyling.bodyTextMedium('Playlist • 5 Songs')  ],
 ), ]
  ),
);
  }
}