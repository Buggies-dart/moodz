import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:soundbarz/components.dart';

class SongPage extends StatefulWidget {
  final String audioAsset; // Path to the audio file in your assets folder

  const SongPage({super.key, required this.audioAsset});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  bool isTapped = false;
  List<double> barHeights = List.generate(20, (index) => 10.0); // Initial heights for the bars

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    try {
      await _audioPlayer.setAsset(widget.audioAsset); // Use setAsset for local files
    } catch (e) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load audio")),
      );
    }
    _audioPlayer.positionStream.listen((duration) {
      _updateVisualizer(duration);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
  void _togglePlayPause() {
    setState(() {
      if (isPlaying) {
        _audioPlayer.pause();
      } else {
        _audioPlayer.play();
      }
      isPlaying = !isPlaying;
    });
  }

  void _updateVisualizer(Duration position) {
    // Use position or any other audio properties to change the visualizer effect
    // For simplicity, we simulate the effect based on the position in the track
    setState(() {
      barHeights = List.generate(20, (index) {
        return (position.inMilliseconds % (index + 1) * 5) % 50 + 10.0; // Dynamic bar height
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        title: Text("Now Playing", style: Textstyling.titleText()),centerTitle: true,
leading: IconButton( onPressed: () {}, icon: Icon(Icons.arrow_back_ios, color: white),
),
actions: [
IconButton( onPressed: showMenus, icon: Icon( MdiIcons.dotsVertical,
  color: white, size: 30,
            ),
          ),
        ],
      ),
body: Column( mainAxisAlignment: MainAxisAlignment.center,
children: [
          // Progress Bar
  StreamBuilder<Duration?>( stream: _audioPlayer.positionStream, builder: (context, snapshot) {
 final position = snapshot.data ?? Duration.zero;
 final total = _audioPlayer.duration ?? Duration.zero; return Stack(
 children: [
Center( child: SizedBox(  height: sizeQuery.height / 3, width: sizeQuery.height / 3,
 child: CircularProgressIndicator.adaptive( strokeWidth: 3, strokeCap: StrokeCap.round,
value: total.inMilliseconds > 0 ? position.inMilliseconds / total.inMilliseconds : 0.0,
backgroundColor: Colors.grey[300], valueColor:  AlwaysStoppedAnimation<Color>(secondaryAssetColor),
),
 ),
 ),
Positioned.fill( child: Center( child: SizedBox( height: sizeQuery.height / 3 - 3, width: sizeQuery.width / 0.9 - 3,
child: CircleAvatar(
 backgroundImage: AssetImage( 'assets/images/chips_sauce.jpg', // Replace with your image path
),
 ),
 ),
),
),
],
);
},
),
const SizedBox(height: 20),

          // Playback Time
StreamBuilder<Duration?>( stream: _audioPlayer.positionStream, builder: (context, snapshot) {
final position = snapshot.data ?? Duration.zero; final total = _audioPlayer.duration ?? Duration.zero;
 return Text( "${_formatDuration(position)} | ${_formatDuration(total)}", style: const TextStyle(fontSize: 16, color: white),
);
},
),
    // Audio Visualizer (Just above the play/pause button)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Container( color: null,
                height: 50, // Container for visualizer height adjustment
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: barHeights.map((height) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 10,
                      height: height, // Dynamic height based on audio playback
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.purpleAccent, Colors.blueAccent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(height: sizeQuery.height / 60),
          Text('Black Or White', style: Textstyling.subtitleText()),
          Text(
            'Michael Jackson • Feel Good Anthems • Happy',
            style: TextStyle(color: white),
          ),
  Padding(
    padding: const EdgeInsets.all(15),
    child: Divider( thickness: 0.5,),
  ),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
           songButtons( Icon( Icons.skip_previous,
            size: 60, color: Colors.white),  (){}),
           songButtons( Icon( isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
            size: 60, color: Colors.white),  _togglePlayPause,),
           songButtons( Icon( Icons.skip_next,
            size: 60, color: Colors.white),  (){},),
            ],
          ),
      SizedBox( height: sizeQuery.height/30,),
      Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
songsFunction(Icon(Icons.playlist_add, size: 25, color: Colors.white), (){}, 'Add to Playlist'),
songsFunction(Icon(Icons.repeat, size: 25, color: Colors.white), (){}, 'Repeat'),
songsFunction(Icon(MdiIcons.heart, size: 25, color: Colors.white), (){}, 'Favorite'),
songsFunction(Icon(MdiIcons.share, size: 25, color: Colors.white), (){}, 'Share'),
        ],
      )  ],
      ),
    );
  }

  Widget songButtons(Widget icon, VoidCallback onTap) {
    return IconButton(
              icon: icon,
              onPressed: onTap
            );
  }
Widget songsFunction(Widget icon, VoidCallback onTap, String text){
  return Column(
  children: [
    songButtons(icon, onTap), Text(text, style: TextStyle(color: white),)
  ],
  );
}
  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
 void showMenus(){
showMenu(context: context, position:  RelativeRect.fromLTRB(100.0, 100.0, 0, 0.0), color: tertiaryAssetColor,
items: [
PopupMenuItem<String>(
              value: 'Social Share',
              child: TextButton(onPressed: (){}, child: Text('Social Share', style: TextStyle( color: white),)),
            ),
            PopupMenuItem<String>(
              value: 'Add To Playlist',
              child: TextButton(onPressed: (){}, child: Text('Add To Playlist..', style: TextStyle( color: white),)),
            ),
            PopupMenuItem<String>(
              value: 'Volume',
              child: TextButton(onPressed: (){}, child: Text('Volume', style: TextStyle( color: white),)),
            ),
            PopupMenuItem<String>(
              value: 'Driver Mode',
              child: TextButton(onPressed: (){}, child: Text('Driver Mode', style: TextStyle( color: white),)),
            ),
],
elevation: 8.0,);
 }
}
