import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EmotionScreen extends StatefulWidget{
  const EmotionScreen({super.key, required this.input});

  final String input;
  @override
  State<StatefulWidget> createState() {
    return new EmotionScreenState(input);
  }

}

class EmotionScreenState extends State<EmotionScreen>{
  EmotionScreenState(this.input);
  


  String input;
  Color color = Colors.white;
  String emotion = "";
  Map emotionColors = {'happy': Colors.green, 'sadness': Colors.blue, 'mad': Colors.red};

  @override
  Widget build(BuildContext context) {
    getEmotion();
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Column(children: [
          Container(width: 100, height: 300),
          Text("It seems like you are feeling " +  emotion)
        ])
      )

    );
  }


  getEmotion() async {

    //post to it with input
    post(Uri.parse("https://modelserver-382017.ue.r.appspot.com/predict"), body: input);

    //get response
    final response = await post(Uri.parse("https://modelserver-382017.ue.r.appspot.com/predict"),
      headers:{
        'Content-Type': 'application/json',
      },
      body: json.encode ({'sentence': input})
    );

    var responseData = json.decode(response.body);

    String prediction = "";

   
      String temp = responseData['prediction'];
      prediction = temp;

    

    setState(() {
      emotion = prediction;
      if(emotionColors.containsKey(prediction)){
        color = emotionColors[prediction];
      }
    });

  }






}