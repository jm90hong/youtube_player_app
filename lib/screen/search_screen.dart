import 'package:flutter/material.dart';
import 'package:youtube_player_app/screen/play_screen.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController urlController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('seach screen'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '유투브 주소',
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  if(urlController.text==''){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('유투브 주소를 입력하세요')));
                  }else{
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PlayScreen(url: urlController.text))
                    );
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
