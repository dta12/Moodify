import 'package:flutter/material.dart';

class EmotionScreen extends StatefulWidget{
  const EmotionScreen()
  @override
  State<StatefulWidget> createState() {
    return new EmotionScreenState();
  }
}

class EmotionScreenState extends State<EmotionScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBackgroundColor(),
      body: getEmotion(),

    )
  }