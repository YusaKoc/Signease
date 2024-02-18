import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

   late VideoPlayerController _videoPlayerController;

   @override
   void initState(){
     super.initState();
     _videoPlayerController = VideoPlayerController.asset("assets/Merhaba -- İşaret Dili Eğitimi.mp4")..initialize().then((_){
       _videoPlayerController.play();
       setState(() {
         
       });

     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signease"),
      ),
      body: Center(
        child: _videoPlayerController.value.isInitialized ? AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
            child: Column(
              children: [
                VideoPlayer(_videoPlayerController),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){_videoPlayerController.pause();}, child: const Icon(Icons.pause)),
                    const Padding(padding: EdgeInsets.all(5)),
                    ElevatedButton(onPressed: (){_videoPlayerController.play();}, child: const Icon(Icons.play_arrow)),
                  ],
                ),
              ],
            )) : Container()
      ),

    );
  }
}
