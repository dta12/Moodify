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
                    onPressed: () {
             // RetrieveEmotion(myController.text);
             setState(() {
                      myController.text.isEmpty ? validate = true : validate = false;
                    });
              validate ? null : Navigator.push(context, MaterialPageRoute(builder:(context)=> EmotionScreen(input: myController.text)));

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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Mood Input',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Mood Log',
          ),
        ],
      ),
    );
  }
}
