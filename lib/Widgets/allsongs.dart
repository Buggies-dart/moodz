import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundbarz/Providers/statemanagement.dart';
import 'package:soundbarz/Widgets/song_page.dart';
import 'package:soundbarz/components.dart';
import 'package:just_audio/just_audio.dart';

class AllSongs extends ConsumerStatefulWidget {
  const AllSongs({super.key});

  @override
  ConsumerState<AllSongs> createState() => _AllSongsState();
}

class _AllSongsState extends ConsumerState<AllSongs> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentlyPlayingPath;
  bool isPlaying = false;

  Future<void> _playSong(String path) async {
    try {
      if (_currentlyPlayingPath == path && isPlaying) {
        await _audioPlayer.pause();
 if (mounted) {
setState(() { isPlaying = false;});  
}
} else { await _audioPlayer.setAsset(path);
await _audioPlayer.play();
 if (mounted) {
 setState(() {
_currentlyPlayingPath = path;
isPlaying = true;
});
 }
 }
} catch (e) { if (mounted) {
 ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text("Failed to play the song")),
);
}
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;

    // Subscribe to the suggestSongs FutureProvider
    final songsAsyncValue = ref.watch(Providers.suggestSongs);

    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(sizeQuery.height / 50),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: sizeQuery.width / 5,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [primaryAssetColor, secondaryAssetColor],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.shuffle, color: Colors.white),
                          Text(
                            'Shuffle',
                            style: TextStyle(color: white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: sizeQuery.width / 5,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [primaryAssetColor, secondaryAssetColor],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.play_circle, color: Colors.white),
                          Text(
                            'Play All',
                            style: TextStyle(color: white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: songsAsyncValue.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
                data: (songs) {
                  if (songs.isEmpty) {
                    return const Center(child: Text('No songs available.'));
                  }
                  return Padding(
                    padding: EdgeInsets.only(left: sizeQuery.width / 17),
                    child: ListView.builder(
                      itemCount: songs.length > 25 ? 25 : songs.length,
                      itemBuilder: (context, index) {
                        final song = songs[index];
                        final isCurrentSongPlaying = _currentlyPlayingPath == 'assets/song/sample.mp3' && isPlaying;
                        return Column(
                          children: [
                  GestureDetector( onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
return SongPage(audioAsset: song.songUrl, index: index );
}));
                            },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(song.coverImage),
                                    radius: 30,
                                  ),
                                  SizedBox(width: sizeQuery.width / 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          song.title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Text(
                                          song.artist,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: IconButton(
                                      onPressed: () {
                                        _playSong('assets/song/sample.mp3');
                                      },
                                      icon: Icon(
                                        isCurrentSongPlaying
                                            ? Icons.pause_circle_filled
                                            : Icons.play_circle_fill,
                                        color: secondaryAssetColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                              child: Divider(
                                color: dividerColor,
                                thickness: 0.35,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
