import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saglikliyasam/helpers/file_utils.dart';
import 'package:saglikliyasam/models/calorie_list_model.dart';
import 'package:saglikliyasam/views/bottom_tabs/calendar/add_to_calendar_page.dart';
import 'package:saglikliyasam/views/bottom_tabs/calendar/all_calories_page.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calorie_chart_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  var selectedDay = DateTime.now();
  var focusedDay = DateTime.now();
  String dateAsString = '';
  List<CalorieListModel> calorieList = [];
  getCaloriesByDate(String date)async{
    setState((){
      calorieList = [];
    });
    String userDocId = await FileUtils.readFromFile();
    var list = await FirebaseFirestore.instance.collection('users').doc(userDocId).collection('calendar').where('date',isEqualTo: date).get();
    if(list.docs.isNotEmpty){
      list.docs.forEach((element) {
        calorieList.add(
          CalorieListModel(
              date: element.data()['date'],
              calorie: element.data()['calorie']
          )
        );
      });
    }
    showCalorieDialog();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Takvim'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
            TableCalendar(
                currentDay: selectedDay,
                focusedDay: focusedDay,
                firstDay: DateTime(2021),
                lastDay: DateTime(2024),
              onDaySelected: (selectedday, focusedday) async{
                  setState((){
                    selectedDay = selectedday;
                    focusedDay = focusedday;
                    dateAsString = selectedday.day.toString() + '/' + selectedday.month.toString() + '/' + selectedday.year.toString();
                  });
                  getCaloriesByDate(dateAsString);
              },
            ),
          SizedBox(height: 30),
          BouncingWidget(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCaloriesPage()));
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              color: Colors.green,
              child: Text("Tümünü Gör",style: TextStyle(color: Colors.white),),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onDoubleTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CalorieChartPage()));
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              color: Colors.blueGrey,
              child: Text("Grafikler",style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddToCalendarPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  showCalorieDialog(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.width*0.8,
              child: ListView.builder(
                itemCount: calorieList.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(calorieList[index].date),
                      subtitle: Text(calorieList[index].calorie),
                    );
                  }
              ),
            ),
          );
        }
    );
  }
}
