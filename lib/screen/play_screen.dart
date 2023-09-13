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
  bool leftPad=false;
  bool rightPad=false;


  void determinePlay(){
      if(leftPad && rightPad){
        //재생
        _controller.play();
      }else{
        //멈춤
        _controller.pause();
      }
  }

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
              showVideoProgressIndicator: false,
              progressIndicatorColor:  Colors.red,
              progressColors: const ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.redAccent,
              ),
              onReady: (){
                _controller.pause();
                _controller.addListener((){});
                _controller.setSize(Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height
                ));
              },
          ),


          //todo controller pad //패드 사이즈 조정 하기
          //동시에 누름 -> 재생, 하나라도 떼면 -> 중지
          Positioned(
            left: 0,
            bottom: 45,
            child: GestureDetector(
              onTapDown: (detail){
                leftPad=true;
                determinePlay();
              },
              onTapUp: (detail){
                leftPad=false;
                determinePlay();
              },
              child: Container(
                width: (MediaQuery.of(context).size.width*0.5)-50,
                height: (MediaQuery.of(context).size.height*1)-50,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 45,
            child: GestureDetector(
              onTapDown: (detail){
                rightPad=true;
                determinePlay();
              },
              onTapUp: (detail){
                rightPad=false;
                determinePlay();
              },
              child: Container(
                width: (MediaQuery.of(context).size.width*0.5)-50,
                height: (MediaQuery.of(context).size.height*1)-50,
                color: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
