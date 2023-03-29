import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: 
      Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/input_background.jpg"),
                fit: BoxFit.cover,),
                ),
      child: Center(
        child: Column(children: [
          const SizedBox(width: 100, height: 200 ),
          Text("What's on your mind?",
            style: TextStyle(
              color: Color.fromARGB(255, 32, 56, 128),
              fontFamily: 'Margadeth',
              fontSize: 40,
            ),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            controller: myController,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 32, 56, 128),
              fontSize: 20,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue)
              ),
              errorText: validate ? "Value Can't Be Empty" : null,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 3,
          ),
        ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Color.fromARGB(255, 255, 255, 255), 
              backgroundColor: Color.fromARGB(255, 140, 183, 240),
            ),
            child: Text("Enter",
            style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
             // RetrieveEmotion(myController.text);
             setState(() {
                      myController.text.isEmpty ? validate = true : validate = false;
                    });
              validate ? null : Navigator.push(context, MaterialPageRoute(builder:(context)=> EmotionScreen(input: myController.text)));

            },
          ),
          const SizedBox(width: 100, height: 100 ),
         
        ]) 
      )
      )
    );
  }
}