import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_app/screen/play_screen.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController urlController = TextEditingController();

  void init() async{
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('YouTube 영상 검색',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 30,),
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '유투브 주소',
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async{
                  if(urlController.text==''){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('유투브 주소를 입력하세요')));
                  }else{
                    await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PlayScreen(url: urlController.text))
                    );
                    await SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitDown,
                      DeviceOrientation.portraitUp,
                    ]);
                  }
                },
                child: Text('영상 재생하기')
            )
          ],
        ),
      ),
    );
  }
}
