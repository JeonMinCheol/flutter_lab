import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //rootBundle을 이용해 에셋 파일을 읽어 반환하는 함수
  //Future는 비동기 데이터를 의미
  //async 위치 주의
  Future<String> useRootBundle() async {
    return await rootBundle.loadString("assets/text/test.txt");
  }

  Future<String> useDefaultAssetBundle(BuildContext context) async {
    //async를 붙이면 FutureBuilder의 builder에서 (context, AsyncSnapshot<type> snapshot으로 받아야 함
    return await DefaultAssetBundle.of(context).loadString("assets/text/test.txt");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("assets"),
        ),
        body: Column(
          children: [
            Image.asset("images/icon.jpg"),
            Image.asset("images/icon/user.png"),
            //비동기 데이터를 이용해 화면을 구성하는 위젯
            FutureBuilder<String>(
                future: useRootBundle(),     // useRootBundle 함수 호출
                builder: (context, snapshot) { // useRootBundle 함수의 값이 snapshot에 전달되며 이 값으로 화면에 출력
                  return Text('rootBundle ${snapshot.data}',
                    );
                }
            ),
            FutureBuilder(
                future: useDefaultAssetBundle(context),
                builder: (context, AsyncSnapshot<String>snapshot) {
                  return Text('defaultAssetBundle ${snapshot.data}');
                })

          ],
        ),
      ),
    );
  }

}