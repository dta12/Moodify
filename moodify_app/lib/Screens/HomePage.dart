import 'package:flutter/material.dart';
import 'package:moodify_app/Screens/InputScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 126, 174, 243),
      body:
      Center(
        child: Column(children: [
          Container(width: 100, height: 300),
          Text("Moodify"),
          Text("Place Logo Here"),
          ElevatedButton(
            child:Text('Start!',style: TextStyle( color: Colors.white) ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => InputScreen()));
            },
          ),
        ])
      )    


    );
   
  }
}
