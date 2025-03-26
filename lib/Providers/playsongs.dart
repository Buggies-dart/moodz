import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Playsongs with ChangeNotifier {
 final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String? currentlyPlayingPath;

  Future<void> playSong(String path, BuildContext context) async {
  try {
    // Check if the currently playing song is the same as the requested one
    if (currentlyPlayingPath == path) {
      if (isPlaying) {
        // If already playing, pause the song
        await _audioPlayer.pause();
        isPlaying = false;
        debugPrint('Paused: $currentlyPlayingPath');
      } else {
        // If paused, resume the song
        await _audioPlayer.play();
        isPlaying = true;
        debugPrint('Resumed: $currentlyPlayingPath');
      }
    } else {
      // Stop the current song, load the new song, and play
      await _audioPlayer.stop(); // Stop any currently playing song
      await _audioPlayer.setUrl(path);
      await _audioPlayer.play();
      currentlyPlayingPath = path;
      isPlaying = true;
      debugPrint('Playing: $currentlyPlayingPath');
    }

    notifyListeners(); // Notify listeners about the state change
  } catch (e) {
    debugPrint('Error playing song: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to play the song")),
      );
    }
  }
}
}