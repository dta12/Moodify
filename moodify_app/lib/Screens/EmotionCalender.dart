import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:moodify_app/Backend/MoodList.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Backend/Mood.dart';
//import 'package:simple_gradient_text/simple_gradient_text.dart';

class CalenderScreen extends StatefulWidget{
  const CalenderScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalenderScreenState();
  }
}

class CalenderScreenState extends State<CalenderScreen>{


  @override
  Widget build(BuildContext context) {
     final TextEditingController _searchController = TextEditingController();
     List<Mood> moods = context.watch<MoodList>().getMoods().toList();

   

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,),
                ),
              child: Center(
                child: Column(children: [
                    SizedBox(height: 80, width: 100),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0),
                        child: Text('m o o d   l o g', style: TextStyle(color: Color.fromARGB(255, 9, 33, 76), fontWeight: FontWeight.bold, fontSize: 40,  shadows: [Shadow( offset: Offset(-1.5, -1.5),color: Colors.white ),Shadow( offset: Offset(1.5, -1.5), color: Colors.white), Shadow( offset: Offset(1.5, 1.5),color: Colors.white ),Shadow( offset: Offset(-1.5, 1.5),color: Colors.white ) ])),
                      ), 
                      /*Container(
                          height: 45,
                          width: 350,
                          child:TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search for a date or emotion ...',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed:() {
                                  _searchController.clear();
                                  setState(() {
                                    moods = context.watch<MoodList>().getMoods().toList();
                                  });
                                  
                                  },
                              ),
                              prefixIcon: IconButton(
                                icon:Icon(Icons.search),
                                onPressed:() {
                                  List<Mood> temp = [];
                                  for(Mood m in moods){
                                    if(m.getMood().contains(_searchController.text)){
                                      temp.add(m);
                                    }else if(DateFormat.yMd().format(m.date).toString().contains(_searchController.text)){
                                      temp.add(m);
                                    }else if(m.getInput().contains(_searchController.text)){
                                      temp.add(m);
                                    }

                                   
                                  }
                                   setState(() {
                                      moods= temp;
                                    });
                                  
                                  //perform the search here
                                },),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                fillColor: Colors.grey,
                                focusColor: Color.fromARGB(255, 9, 33, 76),
                                hoverColor: Color.fromARGB(255, 9, 33, 76),   
                            )
                          )
                        )*/
                        SingleChildScrollView(
                                  child: Container(
                                    height: 530,
                                    child: ListView.builder(
                                    itemCount: moods.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 1),
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: ListTile(
                                                leading: CircleAvatar(
                                                  child: Image.asset(moods[index].leading, color: moods[index].leadingColor),
                                                  backgroundColor: Colors.white,
                                                ),
                                                title: Text("On " + DateFormat.yMd().format(moods[index].date) + ", you felt " + moods[index].mood),
                                                subtitle: Text("\"" + moods[index].input + "\"")
                                      )
                                      );
                                    },
                                    )

                                  )
                        ),
            ]),
           
            

        
          ),
        ) 
      );

    }

}
