import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:musicplayer/music.dart';

class Player extends StatefulWidget {
  const Player({Key? key, required this.music}) : super(key: key);

  final Music music;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool isPlaying = false;
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((audioState) {
      setState(() {
        isPlaying = audioState == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((audioDuration) {
      setState(() {
        duration = audioDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((audioPosition) {
      setState(() {
        position = audioPosition;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.title),
        backgroundColor: Colors.black,
      ),
      body: Stack(children: [
        Container(color: const Color.fromARGB(223, 0, 0, 0)),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: [
                Container(
                  height: 270.0,
                  width: 270.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.music.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                  },
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.music.title,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 197, 197, 4),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  widget.music.singer,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 15.0),
                IconButton(
                  onPressed: () async {
                    if (isPlaying == true) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.play(widget.music.audio);
                    }
                  },
                  icon:
                      Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
                  iconSize: 100.0,
                  color: const Color.fromARGB(118, 1, 255, 10),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
