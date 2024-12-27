

class Song{
  final String title;
  final String artist;
  final String coverImage;
  final String songUrl;

Song({ required this.title, required this.artist, required this.coverImage, required this.songUrl});
factory Song.fromJson(Map <String, dynamic> json){
  return Song(title: json['title'], artist: json['artist'], coverImage: json['coverImage'], songUrl: json['song_url']);
}
}

class Playlist {
  final String title;
  final String mood;
  final String coverImage;
  final List<Song> songs;

  Playlist({required this.title, required this.mood, required this.coverImage, required this.songs});

  factory Playlist.fromJson(Map<String, dynamic> json) {
    var songList = json['songs'] as List;
    List<Song> songObjs = songList.map((songJson) => Song.fromJson(songJson)).toList();

    return Playlist(
      title: json['title'],
      mood: json['mood'],
      coverImage: json['coverImage'],
      songs: songObjs,
    );
  }
}
