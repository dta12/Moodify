import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:moodify_app/Backend/MoodList.dart';
import 'package:moodify_app/Screens/EmotionScreen.dart';
//import 'package:simple_gradient_text/simple_gradient_text.dart';

class InputScreen extends StatefulWidget{
  const InputScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return InputScreenState();
  }
}

class InputScreenState extends State<InputScreen>{
  final myController = TextEditingController();
  var validate = false;
  String emotion = "";
  MoodList moods = MoodList();

 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: 
      Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,),
                ),
      child: Center(
        child: Column(children: [
          const SizedBox(width: 150, height: 250 ),
          Text("What's on\nyour mind?",
            style: TextStyle(
              color: Color.fromARGB(255, 32, 56, 128),
              fontFamily: 'CrimsonText',
              fontSize: 50,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 50),
              Flexible(
              child: TextField(
                controller: myController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 32, 56, 128),
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    color: Color.fromARGB(255, 32, 56, 128),
                    onPressed: () async {
                      setState(() {
                            myController.text.isEmpty ? validate = true : validate = false;
                      });
                    final response = await post(Uri.parse("https://amr272-assignment1.uc.r.appspot.com/predict"),
                        headers:{
                            'Content-Type': 'application/json',
                          },
                      body: json.encode ({'sentence': myController.text}));  

                      var responseData = jsonDecode(response.body);
                      String temp = responseData['prediction'];
                      String input = myController.text;
                      myController.clear();
                      validate ? null : Navigator.push(context, MaterialPageRoute(builder:(context)=> EmotionScreen(emotion: temp, input: input))); 
                      },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: TextStyle (
                    color: Color.fromARGB(255, 0, 47, 86),
                    fontSize: 15
                   ),

                  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 32, 56, 128))
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 32, 56, 128))
                  ),
                  errorText: validate ? "Value Can't Be Empty" : null,
                ),
              ),
              ),
          const SizedBox(width: 50, height: 100),
                    ],
          ),
        ]) 
      )
      ),
    );
  }



}





