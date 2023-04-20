import 'package:flutter/material.dart';

import 'Mood.dart';

class MoodList extends ChangeNotifier{
  
Set<Mood> moods ={
  /*new Mood("Sadness", "I failed my test today", DateTime(2023, 1, 16)),
  new Mood("Happy", "I saw my family today!", DateTime(2023, 4, 10)),
  new Mood("Excited", "I am going to start a new job tommorrow!", DateTime(2023, 4, 13)),
  new Mood("Nervous", "I have to present my poster tomorrow. I don't know how it will go.", DateTime.now()) */
};

addMood(Mood m){
  moods.add(m);
  notifyListeners();
}

getMoods(){
  return moods;
}

searchMoods(String input){
  //
}




}