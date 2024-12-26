import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundbarz/JSON%20Model/data_loader.dart';
import 'package:soundbarz/JSON%20Model/playlist_model.dart';
import 'package:soundbarz/mood_list.dart';

class Providers{
// Filter PlayLists By Moods
static final selectedMoodsPlaylist = FutureProvider.family<
List<Playlist>, List<String>>((ref, moodz) async {
final playlists =  await DataLoader.loadPlaylists();
playlists.shuffle();
  return playlists.where((playlist) => moodz.contains(playlist.mood)).toList();
  });

// All Playlist
static final playlist = FutureProvider<List<Playlist>>((ref) async{
  try {
  final playlists = await DataLoader.loadPlaylists();
if (playlists.isNotEmpty) {
return playlists;
}

  } catch (e) {
    print('error occured');
  }
 throw Exception('Playlists Not Found');  
}
);


// Display Other Moods Not Selected By Users
static final unselected = Provider((ref) {
List<String> unselectedMoods = moods.where((item) => !selectedMoods.containsKey(item)).toList();
if (unselectedMoods.isNotEmpty) {
return unselectedMoods;
}
else{
throw Exception('Playlists Not Found');
}
});

// Suggest Songs that matches with User's selected moods.
static final suggestSongs = FutureProvider((ref) async{
final playlists = await DataLoader.loadPlaylists();
  final filteredPlaylists = playlists.where((playlist) => moods.contains(playlist.mood)).toList();
  List<Song> allSongs = filteredPlaylists.expand((playlist) => playlist.songs).toList();
allSongs.shuffle(Random());
return allSongs;
});

}


class FavoritesNotifier extends ChangeNotifier {
  // Change the list to store Playlist objects instead of Strings
  final List<Playlist> _favorites = [];
  List<Playlist> get favorites => _favorites;

  // Add a Playlist to Favorites
  void addFavorite(Playlist playlist) {
    if (!_favorites.contains(playlist)) {
      _favorites.add(playlist);
      notifyListeners();
    }
  }

  // Remove a Playlist from Favorites
  void removeFavorite(Playlist playlist) {
    if (_favorites.contains(playlist)) {
      _favorites.remove(playlist);
      notifyListeners();
    }
  }

  // Check if a Playlist is in Favorites
  bool isFavorite(String playlistName) {
    return _favorites.any((playlist) => playlist.title == playlistName);
  }
}
