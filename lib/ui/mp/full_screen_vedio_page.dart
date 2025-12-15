import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullScreenVideoPage extends StatefulWidget {
  final String videoId; // ✅ Pass video ID instead of controller

  const FullScreenVideoPage({super.key, required this.videoId});

  @override
  State<FullScreenVideoPage> createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // ✅ Create a NEW controller for fullscreen
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true, // Auto play in fullscreen
        mute: false,
        enableCaption: true,
        controlsVisibleAtStart: true,
      ),
    );

    // Force landscape & hide system UI
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    // ✅ Dispose THIS controller
    _controller.dispose();

    // Restore portrait & normal system UI
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          progressColors: const ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
          onEnded: (metaData) {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
