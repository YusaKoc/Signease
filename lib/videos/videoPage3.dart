import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class HearMe extends StatelessWidget {
  const HearMe({super.key});

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget();
  }
}


class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      "assets/video/hearingImpaired.mp4",
    )..initialize().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(115.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Image.asset(
                  "assets/signeaselogo.png",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,

        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("'I'm hearing impaired' With Hand Sign",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20.0),),
          ),
          Center(
            child: _videoPlayerController.value.isInitialized
                ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio*1.6,
              child: Column(
                children: [
                  Expanded(
                    child: VideoPlayer(_videoPlayerController),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _videoPlayerController.pause();
                        },
                        child: const Icon(Icons.pause),
                      ),
                      const SizedBox(width: 25),
                      ElevatedButton(
                        onPressed: () {
                          _videoPlayerController.play();
                        },
                        child: const Icon(Icons.play_arrow),
                      ),
                    ],
                  ),
                ],
              ),
            )
                : const CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              GoRouter.of(context).replace("/dailyTalk");
            }, child: Text("Back To Daily Signs Page")),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}

