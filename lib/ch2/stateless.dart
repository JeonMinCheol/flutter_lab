import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_lab/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool enabled = false;
  String stateText = "disabled";

  void changeCheck(){
    enabled = !enabled;
    stateText = (enabled) ? "enabled" : "disabled";
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless Test')
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon : (enabled ? Icon(Icons.check_box, size:20) : Icon(Icons.check_box_outline_blank, size:20)),
                  color: Colors.red,
                  onPressed: changeCheck,
              ),
              Container(
                padding: EdgeInsets.only(left:16),
                child : Text(
                  stateText
                  , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

