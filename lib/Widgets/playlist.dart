import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundbarz/Providers/statemanagement.dart';
import 'package:soundbarz/Widgets/playlist_page.dart';
import 'package:soundbarz/components.dart';

class PlayLists extends ConsumerWidget {
  const PlayLists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistsAsyncValue = ref.watch(Providers.playlist);

    return Scaffold(
 body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(
child: playlistsAsyncValue.when(
 data: (playlists) {
if (playlists.isEmpty) {
return const Center(
child: Text('No playlists found for the selected mood.'),
);
}
return GridView.builder(
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
itemCount: playlists.length,
itemBuilder: (context, index) {
final playlist = playlists[index];
return GestureDetector(
onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) {
return PlaylistPage(firstIndex: index);
}));
},
child: Container( foregroundDecoration:
const BoxDecoration(color: Colors.black38),
decoration: BoxDecoration( image: DecorationImage(
image: NetworkImage(
playlist.coverImage,
 ),
 fit: BoxFit.cover,
),),
child: Column( children: [ const Spacer(),
Padding( padding: const EdgeInsets.all(8.0),
 child: Row( mainAxisAlignment: MainAxisAlignment.start,
children: [
Column(crossAxisAlignment: CrossAxisAlignment.start,
children: [
Container( width: MediaQuery.of(context).size.width/3,
  child: Text(
  playlist.title, style: const TextStyle( fontSize: 16, color: Colors.white,
  fontWeight: FontWeight.bold,), overflow: TextOverflow.ellipsis,maxLines: 1,
  ),
),
Textstyling.bodyTextMedium('${playlist.songs.length} Songs'), 
],
),
const Spacer(),
IconButton( onPressed: () {}, icon: const Icon(Icons.play_circle_fill, color: Colors.white,),
),
],
),
),
],
),
),
);
},
);
},
loading: () => const Center(child: CircularProgressIndicator()),
error: (error, stack) => Center( child: Text('Error: $error'),
),
),
),
],
),
);
  }
}
