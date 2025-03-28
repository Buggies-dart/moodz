import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundbarz/Model/data_loader.dart';
import 'package:soundbarz/Model/playlist_model.dart';
import 'package:soundbarz/components.dart';
import 'package:soundbarz/main.dart';
import 'package:soundbarz/mood_list.dart';

class RecommendedPlaylistPage extends StatefulWidget {
  const RecommendedPlaylistPage({super.key, required this.firstIndex});
  final int firstIndex;

  @override
  State<RecommendedPlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<RecommendedPlaylistPage> {
  Future<List<Playlist>> getPlaylistsByMood(List<String> moodz) async {
    final playlists = await DataLoader.loadPlaylists();
    if (playlists.isNotEmpty) {
      return playlists.where((playlist) => moodz.contains(playlist.mood)).toList();
    }
    throw Exception('Playlists Not Found');
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    List<String> selectedMood = selectedMoods.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text('Playlist Details', style: Textstyling.titleText()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 30),
          ),
        ],
      ),
      body: FutureBuilder<List<Playlist>>(
        future: getPlaylistsByMood(selectedMood),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final playlists = snapshot.data ?? [];
          if (playlists.isEmpty || widget.firstIndex >= playlists.length) {
            return const Center(
              child: Text('No playlists found or index out of range.'),
            );
          }
          final showPlaylists = playlists[widget.firstIndex];
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(sizeQuery.height / 100),
                child: Stack(
                  children: [
                    Container(
                      foregroundDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      height: sizeQuery.height / 3.8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(showPlaylists.coverImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: Colors.black.withOpacity(0),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(sizeQuery.height / 48),
                          child: SingleChildScrollView( scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: sizeQuery.height / 8,
                                  width: sizeQuery.width / 4,
                                  child: Material(
                                    elevation: 20,
                                    shadowColor: Colors.white,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(showPlaylists.coverImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: sizeQuery.width / 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      showPlaylists.title,
                                      style: Textstyling.titleText(),
                                    ),
                                    Textstyling.bodyTextMedium(showPlaylists.title),
                                    Textstyling.bodyTextMedium(showPlaylists.mood),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.only(top: sizeQuery.height / 32),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: sizeQuery.width / 38),
                                  child: playButton(sizeQuery),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: sizeQuery.width / 38),
                                  child: SizedBox(
                                    height: sizeQuery.height / 28,
                                    child: shareNfavButton(
                                        'Share', Icons.share, () {}, white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: sizeQuery.width / 38),
                                  child: Consumer(
                                    builder: (context, ref, _) {
                                      final favPlaylists = ref.watch(myNotifProvider);
                                      return SizedBox(
                                        height: sizeQuery.height / 28,
                                        width: sizeQuery.height / 5.46,
                                        child: shareNfavButton(
                                          favPlaylists.isFavorite(showPlaylists.title)
                                              ? 'Added'
                                              : 'Add to Fav',
                                          MdiIcons.heart,
                                          () {
                                            final favPlay = ref.read(myNotifProvider);
                                            if (!favPlay.isFavorite(showPlaylists.title)) {
                                              favPlay.addFavorite(showPlaylists);
                                            } else {
                                              favPlay.removeFavorite(showPlaylists);
                                            }
                                          },
                                          favPlaylists.isFavorite(showPlaylists.title)
                                              ? Colors.red
                                              : white,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: sizeQuery.height / 40),
              Expanded(
                child: ListView.builder(
                  itemCount: showPlaylists.songs.length,
                  itemBuilder: (context, index) {
                    final playlistSong = showPlaylists.songs[index];
                    return Column(
                      children: [
                        SizedBox(
                          height: sizeQuery.height / 20,
                          child: ListTile(
                            onTap: () {},
                            leading: const Icon(Icons.play_circle_fill, color: secondaryAssetColor),
                            title: Text(
                              playlistSong.title,
                              style: const TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            trailing: SizedBox(
                              width: sizeQuery.width / 4,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('3.48', style: TextStyle(color: Colors.white)),
                                  SizedBox(width: sizeQuery.width / 10),
                                  const Icon(MdiIcons.circleMultipleOutline, size: 13),
                                  const Icon(MdiIcons.circleMultipleOutline, size: 13),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8, right: 8, bottom: 6),
                          child: Divider(color: Colors.grey, thickness: 0.7),
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

  ElevatedButton shareNfavButton(String text, IconData icon, VoidCallback onTap, Color color) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: Colors.red, width: 1.5),
        backgroundColor: Colors.transparent,
      ),
      onPressed: onTap,
      label: Text(text, style: const TextStyle(color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis),
      icon: Icon(icon, color: color),
    );
  }

  Container playButton(Size sizeQuery) {
    return Container(
      height: sizeQuery.height / 30,
      width: sizeQuery.width / 4.5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(colors: [primaryAssetColor, secondaryAssetColor]),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.play_arrow, color: Colors.white),
          Text('Play', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
