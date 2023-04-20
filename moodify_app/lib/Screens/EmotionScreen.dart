import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../Backend/Mood.dart';
import '../Backend/MoodList.dart';

class EmotionScreen extends StatefulWidget{
  const EmotionScreen({super.key, required this.emotion, required this.input});

  final String input;
  final String emotion;
  @override
  State<StatefulWidget> createState() {
    return new EmotionScreenState(emotion, input);
  }

}

class EmotionScreenState extends State<EmotionScreen>{
  EmotionScreenState(this.emotion, this.input);
  


  String emotion;
  String input;
  Color color = Colors.white; 

 Map emotionColors = {
    'admiration' : Color.fromARGB(255, 64, 136, 95), //good
    'amusement' : Color.fromARGB(255, 208, 147, 56), //good
    'anger': Color.fromARGB(255, 226, 58, 46), //good
    'annoyance': Color.fromARGB(255, 221, 140, 134),  //good
    'approval': Color.fromARGB(255, 12, 224, 44), //good
    'caring': Color.fromARGB(255, 189, 57, 105),  //good
    'confusion': Color.fromARGB(255, 180, 95, 70),
    'curiosity': Color.fromARGB(255, 204, 193, 97),
    'desire': Color.fromARGB(255, 255, 7, 77),
    'disappointment': Color.fromARGB(255, 79, 114, 138),
    'disapproval' : Color.fromARGB(255, 119, 54, 54),
    'disgust': Color.fromARGB(255, 65, 110, 76),
    'embarrassment': Color.fromARGB(255, 227, 98, 98),
    'excitement': Color.fromARGB(255, 235, 54, 41),
    'fear': Color.fromARGB(255, 189, 113, 202), //good
    'gratitude': Color.fromARGB(255, 175, 200, 139),
    'grief': Color.fromARGB(255, 60, 90, 189),
    'joy': Color.fromARGB(255, 150, 214, 152), //good
    'love': Color.fromARGB(255, 242, 100, 147), //good
    'nervousness': Color.fromARGB(255, 152, 55, 17),
    'optimism': Color.fromARGB(255, 2, 142, 23),
    'pride': Color.fromARGB(255, 49, 155, 17),
    'realization': Color.fromARGB(255, 152, 77, 238),
    'relief': Color.fromARGB(255, 103, 150, 172),
    'remorse' : Color.fromARGB(255, 33, 43, 79),
    'sadness' : Color.fromARGB(255, 103, 160, 207),
    'surprise' : Color.fromARGB(255, 255, 238, 83), 
    'neutral' : Color.fromARGB(255, 155, 154, 154),
 } ;


 Map emotionImages = {
    'admiration' : "images/loveIcon.webp", //good
    'amusement' : "images/calenderIcon.png", //good
    'anger': "images/angerIcon.png", //good
    'annoyance': "images/fearIcon.png",  //good
    'approval': "images/calenderIcon.png", //good
    'caring': "images/loveIcon.webp",  //good
    'confusion':"images/fearIcon.png",
    'curiosity': "images/curiousIcon.png",
    'desire': "images/loveIcon.webp",
    'disappointment': "images/sadIcon.png",
    'disapproval' : "images/fearIcon.png",
    'disgust': "images/fearIcon.png",
    'embarrassment': "images/embarrasedIcon.png",
    'excitement': "images/calenderIcon.png",
    'fear': "images/fearIcon.png", //good
    'gratitude': "images/calenderIcon.png",
    'grief': "images/sadIcon.png",
    'joy': "images/calenderIcon.png", //good
    'love': "images/loveIcon.webp", //good
    'nervousness': "images/fearIcon.png",
    'optimism': "images/calenderIcon.png",
    'pride': "images/calenderIcon.png",
    'realization': "images/surpriseIcon.png",
    'relief':"images/relievedIcon.png",
    'remorse' :"images/sadIcon.png",
    'sadness' : "images/sadIcon.png", //good
    'surprise' : "images/surpriseIcon.png", //good
    'neutral' : "images/neutralIcon.png",
 } ;

Map imageColors = {
    'admiration' : Color.fromARGB(255, 157, 206, 178), 
    'amusement' : Color.fromARGB(255, 110, 78, 30), 
    'anger': Color.fromARGB(255, 75, 17, 13), //good
    'annoyance': Color.fromARGB(255, 218, 99, 90),  
    'approval': Color.fromARGB(255, 9, 85, 21), 
    'caring': Color.fromARGB(255, 110, 18, 52),  
    'confusion': Color.fromARGB(255, 104, 48, 31),
    'curiosity': Color.fromARGB(255, 108, 99, 22),
    'desire': Color.fromARGB(255, 55, 2, 17),
    'disappointment': Color.fromARGB(255, 32, 65, 87),
    'disapproval' : Color.fromARGB(255, 98, 16, 16),
    'disgust': Color.fromARGB(255, 24, 58, 33),
    'embarrassment': Color.fromARGB(255, 100, 27, 27),
    'excitement': Color.fromARGB(255, 137, 23, 14),
    'fear': Color.fromARGB(255, 84, 29, 94), //good
    'gratitude': Color.fromARGB(255, 74, 104, 33),
    'grief': Color.fromARGB(255, 21, 40, 103),
    'joy': Color.fromARGB(255, 16, 67, 18),  //good
    'love': Color.fromARGB(255, 77, 17, 38),  //good
    'nervousness': Color.fromARGB(255, 56, 19, 4),
    'optimism': Color.fromARGB(255, 4, 62, 13),
    'pride': Color.fromARGB(255, 22, 53, 13),
    'realization': Color.fromARGB(255, 54, 6, 110),
    'relief': Color.fromARGB(255, 22, 47, 58),
    'remorse' : Color.fromARGB(255, 109, 115, 135),
    'sadness' : Color.fromARGB(255, 11, 27, 39), //good
    'surprise' : Color.fromARGB(255, 82, 74, 9),  //good
    'neutral' : Color.fromARGB(255, 9, 9, 9),
 } ;






  @override
  Widget build(BuildContext context) {
    MoodList moods = context.watch<MoodList>();
    moods.addMood(new Mood(emotion, input, DateTime.now(), emotionImages[emotion], emotionColors[emotion]));
   


    return Scaffold(
      backgroundColor: emotionColors[emotion],
      appBar: AppBar(
        leading:BackButton(),
        backgroundColor: emotionColors[emotion],
        shadowColor: emotionColors[emotion],
        title: Text("m o o d i f y", style: TextStyle(color: Colors.white))
      ),
      body: Center(
        child: Column(children: [
          Container(width: 100, height: 75),
          Text("It seems like you are feeling ", style: TextStyle(color: Colors.white, fontSize: 20)),
          Container(height: 50),
           Container(
              alignment: Alignment.center,
              width: 350,
              height: 250,
              child: Image.asset(emotionImages[emotion], color: imageColors[emotion],)
            ),
          Container(height: 35),
          Text(emotion, style: TextStyle(color: Colors.white, fontSize: 60)),

        ])
      )

    );
  }

  getColor(){
    return emotionColors[emotion];
  }

}