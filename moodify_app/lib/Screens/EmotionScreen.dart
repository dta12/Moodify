import 'package:flutter/material.dart';

class EmotionScreen extends StatefulWidget{
  const EmotionScreen();

  @override
  State<StatefulWidget> createState() => EmotionScreenState();
}

class EmotionScreenState extends State<EmotionScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      //backgroundColor: getBackgroundColor(),
      //body: getEmotion(),
      backgroundColor:  Color.fromARGB(255, 184, 150, 199),
      body: 
      Text("WIP"),
    );
  }
}