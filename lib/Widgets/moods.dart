import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundbarz/Providers/statemanagement.dart';
import 'package:soundbarz/Widgets/moodplaylist_page.dart';
import 'package:soundbarz/components.dart';
import 'package:soundbarz/mood_list.dart';

class MoodsPageState extends ConsumerStatefulWidget {
  const MoodsPageState({super.key});

  @override
  ConsumerState<MoodsPageState> createState() => __MoodsPageStateState();
}

class __MoodsPageStateState extends ConsumerState<MoodsPageState> {
List<String> showMoods = moods.where((item) => item.contains(item)).toList();  
  @override
  Widget build(BuildContext context) {
    final unselectedMood = ref.watch(Providers.unselected);
    final playlistsAsyncValue = ref.watch(Providers.selectedMoodsPlaylist(showMoods));
    final sizeQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: sizeQuery.height / 25),
            playlistsAsyncValue.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) =>
                  Center(child: Text('Error: $err')),
              data: (playlists) {
                if (playlists.isEmpty) {
                  return const Center(
                    child: Text('No playlists found for the selected mood.'),
                  );
                }

                return SizedBox(
                  height: sizeQuery.height / 2.3,
                  child: GridView.builder(
                    itemCount: playlists.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      List<String> moodsImage = [
                        'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733400930/pexels-jill-wellington-1638660-40815_vw6up4.jpg',
                        'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733401492/pexels-shera-banerjee-537666439-16527761_ac74od.jpg',
                        'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733401330/pexels-mardi-deals-90493-295774_t2pu72.jpg',
                        'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733401492/pexels-shera-banerjee-537666439-16527761_ac74od.jpg',
                      ];
                      return Column(
                        children: [
                          SizedBox(
                            width: sizeQuery.width / 2,
                            height: sizeQuery.height / 5,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MoodplaylistPage(
                                    playlistmood: playlists[index].mood,
                                    playlistmoodImg: moodsImage[index % moodsImage.length],
                                  );
                                }));
                              },
                              child: Container(
                                foregroundDecoration: const BoxDecoration(
                                    color: Colors.black12),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(moodsImage[index % moodsImage.length]),

                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: sizeQuery.height / 11),
                                    Text(
                                      playlists[index].mood,
                                      style: Textstyling.subtitleText(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: sizeQuery.height / 25),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  Text(
                    'Explore Moods',
                    style: Textstyling.subtitleText(),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: primaryAssetColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sizeQuery.height / 5,
              width: double.infinity,
              child: ListView.builder(
                itemCount: unselectedMood.length > 11
                    ? 10
                    : unselectedMood.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: sizeQuery.height / 6.5,
                        width: sizeQuery.height / 7,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://res.cloudinary.com/dnkcbhh4n/image/upload/v1733400930/pexels-jill-wellington-1638660-40815_vw6up4.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Textstyling.bodyTextMedium(unselectedMood[index]),
                    ],
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
