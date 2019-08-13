import 'package:arm_project/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final VideoModel videoModel;
  VideoPlayer({Key key, this.videoModel}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // Explicit
  VideoModel videoModel;
  String urlVideo = '';
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  // Methods
  @override
  void initState() {
    super.initState();
    videoModel = widget.videoModel;
    urlVideo = videoModel.pathVideo;
    print('Video = $urlVideo');

    videoPlayerController = VideoPlayerController.network(urlVideo);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
