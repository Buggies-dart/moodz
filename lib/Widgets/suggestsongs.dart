import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundbarz/Providers/statemanagement.dart';
import 'package:soundbarz/components.dart';

class SuggestSongs extends ConsumerWidget {
  const SuggestSongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeQuery = MediaQuery.of(context).size;

    // Subscribe to the suggestSongs FutureProvider
    final songsAsyncValue = ref.watch(Providers.suggestSongs);

    return songsAsyncValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data: (songs) {
        if (songs.isEmpty) {
          return const Center(child: Text('No songs available.'));
        }

        return SizedBox(
          height: sizeQuery.height / 2, // Specify height to avoid constraint issues
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical, // For vertical scrolling
            itemCount: songs.length > 7 ? 7 : songs.length, // Limit to 7 items
            itemBuilder: (context, index) {
              final song = songs[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(song.coverImage),
                        radius: 30,
                      ),
                      SizedBox(width: sizeQuery.width / 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song.title,
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            song.artist,
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.play_circle_fill, color: secondaryAssetColor),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: Divider(color: dividerColor, thickness: 0.35),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
