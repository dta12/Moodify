import 'dart:ui';

class Mood{
 Mood(this.mood, this.input, this.date, this.leading, this.leadingColor);
 String mood;
 String input;
 DateTime date;
 String leading;
 Color leadingColor;


 String getMood(){
  return mood;
 }

 DateTime getDate(){
  return date;
 }

 String getInput(){
  return input;
 }




}