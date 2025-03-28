import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:soundbarz/Model/data_loader.dart';
import 'package:soundbarz/Model/playlist_model.dart';
import 'package:soundbarz/Widgets/playlistpage_moods.dart';
import 'package:soundbarz/components.dart';

class MoodplaylistPage extends StatefulWidget {
  final String playlistmood;
  final String playlistmoodImg;

  const MoodplaylistPage({
    super.key,
    required this.playlistmood,
    required this.playlistmoodImg,
  });

  @override
  State<MoodplaylistPage> createState() => _MoodplaylistPageState();
}

class _MoodplaylistPageState extends State<MoodplaylistPage> {
  Future<List<Playlist>> getPlaylistsByMood() async {
    final playlists = await DataLoader.loadPlaylists();
    return playlists
        .where((playlist) => playlist.mood.contains(widget.playlistmood))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder<List<Playlist>>(
        future: getPlaylistsByMood(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final playlists = snapshot.data ?? [];
          if (playlists.isEmpty) {
            return const Center(
              child: Text('No playlists found for the selected mood.'),
            );
          }

          return Column(
            children: [
              // Top Section with Mood Image and Back Button
              Stack(
                children: [
                  // Background Image
                  Container(
                    height: sizeQuery.height / 4.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.playlistmoodImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Blur Effect
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      height: sizeQuery.height / 4.5,
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),

                  // Back Button and Search Icon
                  Positioned(
                    top: 40, // Adjust padding to fit properly
                    left: 16,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Go back to the previous page
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 40,
                    right: 16,
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),

                  // Mood Title
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Text(
                      widget.playlistmood,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              // Playlists List
              Expanded(
                child: ListView.builder(
                  itemCount: playlists.length,
                  itemBuilder: (context, index) {
                    final playlist = playlists[index];

                    return Column(
                      children: [
                        ListTile( onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
return PlaylistPageMoods(firstIndex: index, playlistmood: playlist.mood);

}));
                        },
                          leading: Container(
                            height: sizeQuery.height / 18,
                            width: sizeQuery.width / 8,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(playlist.coverImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            playlist.title,
                            style: Textstyling.subtitleText(),
                          ),
                          subtitle: Text(
                            '${playlist.songs[0].artist} • ${playlist.songs[1].artist} • ${playlist.songs[2].artist}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          height: 1.5, thickness: 0.5,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
