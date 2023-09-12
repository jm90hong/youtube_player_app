import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class PlayScreen extends StatefulWidget {
  String url;

  PlayScreen({
    required this.url
  });

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {

  late YoutubePlayerController _controller;


  void init() async{
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _controller=YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          YoutubePlayer(
              width: double.infinity,
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor:  Colors.amber,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onReady: (){
                _controller.addListener((){});
                _controller.setSize(Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height
                ));
              },
          ),


          //todo controller pad
          Positioned(
            left: 0,
            bottom: 45,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 45,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
