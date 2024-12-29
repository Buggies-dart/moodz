import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Playsongs with ChangeNotifier {
 final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String? currentlyPlayingPath;

  Future<void> playSong(String path, BuildContext context) async {
    try {
      if (currentlyPlayingPath == path && isPlaying) {
        await _audioPlayer.pause();
        isPlaying = false;
        notifyListeners(); 
      } else {
        await _audioPlayer.setUrl(path);
        await _audioPlayer.play();
        currentlyPlayingPath = path;
        isPlaying = true;
        notifyListeners(); 
      }
    } catch (e) {
      if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to play the song")),
      );   
      }
     
    }
  }
}