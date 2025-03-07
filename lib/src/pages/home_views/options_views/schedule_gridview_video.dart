import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ScheduleGridviewVideo extends StatefulWidget {
  const ScheduleGridviewVideo({super.key, required this.item});
  final String item;

  @override
  State<ScheduleGridviewVideo> createState() => _ScheduleGridviewVideoState();
}

class _ScheduleGridviewVideoState extends State<ScheduleGridviewVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.item,
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Vídeo',
            style: TextStyle(color: Colors.white),
          ),
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: Center(child: _showContent(widget.item)));
  }

  Widget _showContent(item) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        InkWell(
          onTap: () {
            // Wrap the play or pause in a call to `setState`. This ensures the
            // correct icon is shown.
            //print('click');
            setState(() {
              // If the video is playing, pause it.
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }

              /*if (_controller.value.duration ==
                        _controller.value.position) {
                      _controller.play();
                    }*/
            });
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
