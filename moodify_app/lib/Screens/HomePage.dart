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
                image: AssetImage("images/cloudBackground.png"),
                fit: BoxFit.cover),
                ),
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 250,
              // set the width of this Container to 100% screen width
              width: double.infinity,
            ),
            Container(
              height: 120,
              width: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/logoUpdate.png"),
                  fit: BoxFit.cover),
                  ),
            ),
          ])
        )
      )
    );
  }
}
