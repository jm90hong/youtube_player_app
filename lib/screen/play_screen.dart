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

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );


  void init() async{
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
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

      body: YoutubePlayer(
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
    );
  }
}
