import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soundbarz/JSON%20Model/data_loader.dart';
import 'package:soundbarz/JSON%20Model/playlist_model.dart';
import 'package:soundbarz/Widgets/allsongs.dart';
import 'package:soundbarz/Widgets/drawer.dart';
import 'package:soundbarz/Widgets/moodplaylist_page.dart';
import 'package:soundbarz/Widgets/moods.dart';
import 'package:soundbarz/Widgets/recommended_playlist.dart';
import 'package:soundbarz/Widgets/suggestsongs.dart';
import 'package:soundbarz/components.dart';
import 'package:soundbarz/mood_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<List<Playlist>> getPlaylistsByMood(List<String> moods) async {
    final playlists = await DataLoader.loadPlaylists();
   if (playlists.isNotEmpty) {
   return playlists.where((playlist) => moods.contains(playlist.mood)).toList();
   }
  throw Exception('Playlists Not Found');
  }
  @override
  Widget build(BuildContext context) {
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final sizeQuery = MediaQuery.of(context).size;
   List<String> selectedMood = selectedMoods.entries
    .where((entry) => entry.value == true)
    .map((entry) => entry.key)
    .toList();
    return Scaffold(
    key: scaffoldKey,
    drawer: const UserDrawer(),
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
    scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.list, color: Colors.white),
        ),
        title: SizedBox(
          height: sizeQuery.height/18,
          child: CupertinoSearchTextField(
            placeholder: ' What do you want to listen to?',
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 85, 84, 84),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 1, color: Colors.black),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: sizeQuery.width/45),
        child: SingleChildScrollView( scrollDirection: Axis.vertical,
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizeQuery.height / 40),
              Padding(
                padding:  EdgeInsets.only(left: sizeQuery.width/45),
                child: Text('Hot Recommended', style: Textstyling.titleText()),
              ),
              FutureBuilder<List<Playlist>>( future: getPlaylistsByMood(selectedMood), // Pass the selected mood
builder: (context, snapshot) {if (snapshot.connectionState == ConnectionState.waiting) {
   return const Center(child: CircularProgressIndicator());}
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final playlists = snapshot.data ?? [];
          
                  if (playlists.isEmpty) {
                    return const Center(
                      child: Text('No playlists found for the selected mood.'),
                    );
                  }
          
                  return SizedBox(
                    height: sizeQuery.height / 3.65,
                    child: ListView.builder(
                      itemCount: playlists.length,
                      scrollDirection: Axis.horizontal, // For a horizontal scroll effect
                      itemBuilder: (context, index) {
                        final playlist = playlists[index];
                        return Padding(
                          padding:  EdgeInsets.all(sizeQuery.width/40),
                          child: Column(
                            children: [
                              SizedBox( width: sizeQuery.width/1.50, height: sizeQuery.height/5,
                                child:
  GestureDetector( onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
return RecommendedPlaylistPage(firstIndex: index);
}) );
  },
    child: ClipRRect(
    borderRadius: BorderRadius.circular(10), child: Image.network(
    playlist.coverImage, width: sizeQuery.width / 3, height: sizeQuery.width / 3,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.broken_image, color: Colors.grey),
              );
            },        ),
                                ),
  ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding:  EdgeInsets.only(right: sizeQuery.width/2.2),
                                child: Column( 
                                  children: [
                                    Textstyling.bodyTextMedium(playlist.title),
                                   Text(
                                  playlist.mood,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                  ],
                                ),
                              ),
                             
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
const Padding(
            padding: EdgeInsets.only(left:  8, right: 8),
            child: Divider( color: dividerColor, thickness: 0.7,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                Text('Moods', style: Textstyling.subtitleText(),),
                const Spacer(),
                TextButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
return MoodsPageState();
}));
                }, child: const Text('View All', style: TextStyle(color: primaryAssetColor, fontSize: 16),))
              ],
            ),
          ),
           SingleChildScrollView( scrollDirection: Axis.horizontal,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
           moodsUI(moods[0], 'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733400930/pexels-jill-wellington-1638660-40815_vw6up4.jpg', moods[0]),
           SizedBox(width: sizeQuery.width/20,),
           moodsUI(moods[2], 'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733401330/pexels-mardi-deals-90493-295774_t2pu72.jpg', moods[2]),
           SizedBox(width: sizeQuery.width/20,),
           moodsUI(moods[3], 'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733401492/pexels-shera-banerjee-537666439-16527761_ac74od.jpg', moods[3]),
          SizedBox(width: sizeQuery.width/20,),
          moodsUI(moods[1], 'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1735005864/relaxed_mlgfqw.png', moods[1]),
                 ],
               ),
             ),
           ),
           const Padding(
            padding: EdgeInsets.only(left:  8, right: 8),
            child: Divider( color: dividerColor, thickness: 0.7,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                Text('Suggestions', style: Textstyling.subtitleText(),),
                const Spacer(),
                TextButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
return AllSongs();
}));
                }, child: const Text('View All', style: TextStyle(color: primaryAssetColor, fontSize: 16),)),
           ],
            ),
          ),
          const SuggestSongs()],
          ),
        ),
      ),
    );
  }

 Widget moodsUI(String text, String image, String playlistMood) {
    final sizeQuery = MediaQuery.of(context).size;
    return Column(
    children: [
      SizedBox( width: sizeQuery.width/3.2, height: sizeQuery.height/8.5,
        child: Material( elevation: 3, borderRadius: BorderRadius.circular(10),
        shadowColor: Colors.black,
          child: GestureDetector( onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){
  if (text == image[0]) {
    image = 'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733400930/pexels-jill-wellington-1638660-40815_vw6up4.jpg';
  }
if(text == image[2]){
image = 'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733401330/pexels-mardi-deals-90493-295774_t2pu72.jpg';
}
if(text == image[3]){
image = 'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733401492/pexels-shera-banerjee-537666439-16527761_ac74od.jpg';
}
if(text == image[1]){
image = 'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733401492/pexels-shera-banerjee-537666439-16527761_ac74od.jpg';
}
else{debugPrint('Image Not Found');
}
            return MoodplaylistPage(playlistmood: playlistMood, playlistmoodImg: image);
            }));},
            child: ClipRRect( 
             borderRadius: BorderRadius.circular(10),
              child: Image.network(image, fit: BoxFit.cover,),
            ),
          ),
        )
        ),
   Textstyling.bodyTextMedium(text)
    ],
   );
  }

}
