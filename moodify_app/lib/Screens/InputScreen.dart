import 'package:flutter/material.dart';
import 'package:moodify_app/Screens/EmotionScreen.dart';

class InputScreen extends StatefulWidget{
  const InputScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return InputScreenState();
  }
}

class InputScreenState extends State<InputScreen>{
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 126, 174, 243),
      body: 
      Center(
        child: Column (children:[
          Container(width: 100, height: 300),
          Text("What's on your mind?"),
          TextField(controller: myController),
          ElevatedButton(
            child: Text("Enter"),
            onPressed: () {
             // RetrieveEmotion(myController.text);
             Navigator.push(context, MaterialPageRoute(builder:(context)=> EmotionScreen(input: myController.text)));
            },
          ),
        ]) 
      )



    );
  }
}