import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class InstaGramReels extends StatefulWidget {
  const InstaGramReels({Key? key}) : super(key: key);

  @override
  _InstaGramReelsState createState() => _InstaGramReelsState();
}

class _InstaGramReelsState extends State<InstaGramReels> {
  final List<String> _reelVideos = [
    'https://videos.pexels.com/video-files/5935131/5935131-hd_1080_1920_25fps.mp4',
    'https://videos.pexels.com/video-files/7450414/7450414-uhd_1440_2560_25fps.mp4',
    'https://videos.pexels.com/video-files/27878573/12253181_1440_2560_25fps.mp4',
  ]; // Replace with actual video URLs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _reelVideos.length,
        itemBuilder: (context, index) {
          return ReelVideoPlayer(videoUrl: _reelVideos[index]);
        },
      ),
    );
  }
}

class ReelVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const ReelVideoPlayer({super.key, required this.videoUrl});

  @override
  _ReelVideoPlayerState createState() => _ReelVideoPlayerState();
}

class _ReelVideoPlayerState extends State<ReelVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _isPlaying = true;
        });
      });

    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const CircularProgressIndicator(),
        ),
        // Play/Pause Button in the center
        Positioned.fill(
          child: GestureDetector(
            onTap: _togglePlayPause,
            child: Center(
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
                size: 80.0,
              ),
            ),
          ),
        ),
        // Bottom Section with Like, Comment, Share
        Positioned(
          bottom: 30.0,
          left: 20.0,
          right: 20.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@username',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'This is a description of the reel.',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.black),
                    onPressed: () {
                      // Handle like functionality
                    },
                  ),
                  const Text('123K', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 8.0),
                  IconButton(
                    icon: const Icon(Icons.comment, color: Colors.black),
                    onPressed: () {
                      // Handle comment functionality
                    },
                  ),
                  const Text('456', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 8.0),
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.black),
                    onPressed: () {
                      // Handle share functionality
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

