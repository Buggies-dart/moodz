import 'dart:convert';
import 'package:flutter/services.dart';
import 'playlist_model.dart';

class DataLoader {
  static Future<List<Playlist>> loadPlaylists() async {
    // Load the JSON file as a string
    String jsonString = await rootBundle.loadString('assets/playlist.json');
    
    // Decode the JSON string into a Map
    Map<String, dynamic> jsonResponse = json.decode(jsonString);

    // Extract the 'playlists' key, which contains the list of playlists
    List<dynamic> playlistsJson = jsonResponse['playlists'];

    // Map the JSON data to Playlist objects and return the list
    return playlistsJson.map((playlistJson) => Playlist.fromJson(playlistJson)).toList();
  }
}
