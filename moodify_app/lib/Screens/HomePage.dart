import 'package:flutter/material.dart';
import 'package:moodify_app/Screens/InputScreen.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
          ()=>Navigator.push(context, MaterialPageRoute(builder:(context) => InputScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 126, 174, 243),
      body:
      Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/colors.gif"),
                fit: BoxFit.cover),
                ),
        child: Center(
          child: Column(children: [
            Container(
              height: 100,
              // set the width of this Container to 100% screen width
              width: double.infinity,
            ),
            const Text("Moodify",
              style: TextStyle( 
                fontSize: 100,
                height: 2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                color: Color.fromRGBO(255, 255, 255, 1), //font color
              //  backgroundColor: Color.fromARGB(31, 37, 85, 241),
                letterSpacing: 5, //letter spacing
                fontFamily: 'Margadeth',
              ),
              ),
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/outline_logo.png"),
                  fit: BoxFit.cover),
                  ),
            ),
          ])
        ),    
      )
    );
  }
}
