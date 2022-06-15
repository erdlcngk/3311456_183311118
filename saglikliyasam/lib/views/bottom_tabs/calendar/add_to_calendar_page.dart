import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saglikliyasam/helpers/file_utils.dart';

class AddToCalendarPage extends StatefulWidget {
  const AddToCalendarPage({Key? key}) : super(key: key);

  @override
  State<AddToCalendarPage> createState() => _AddToCalendarPageState();
}

class _AddToCalendarPageState extends State<AddToCalendarPage> {
  String dateText = "Tarih : ";
  String selectedDate = '';
  var calorieController = TextEditingController();

  saveCalorieToFirebase()async{
    String userDocId = await FileUtils.readFromFile();
    print("id : "+ userDocId);
    await FirebaseFirestore.instance.collection('users').doc(userDocId).collection('calendar').add({
      'date' : selectedDate,
      'calorie' : calorieController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Takvime Ekle"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dateText, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              IconButton(
                  onPressed: ()async{
                    final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2023)
                    );
                    if(picked!=null){
                      setState((){
                        selectedDate = picked.day.toString() + "/" + picked.month.toString() + "/" + picked.year.toString();
                        dateText = "Tarih : " + selectedDate;
                      });
                    }
                  },
                  icon: Icon(Icons.calendar_today)
              )
            ],
          ),
          SizedBox(height: 20),
          TextField(
            controller: calorieController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Kalori giriniz",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
              onPressed: (){
                if(selectedDate.isNotEmpty && calorieController.text.isNotEmpty){
                  saveCalorieToFirebase();
                }
              },
              child: Text("Kaydet")
          )
        ],
      ),
    );
  }
}
