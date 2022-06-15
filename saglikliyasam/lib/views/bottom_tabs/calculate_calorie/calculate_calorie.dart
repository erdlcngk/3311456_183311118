import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:saglikliyasam/views/bottom_tabs/calculate_calorie/breakfast.dart';
import 'package:saglikliyasam/views/bottom_tabs/calculate_calorie/dessert.dart';
import 'package:saglikliyasam/views/bottom_tabs/calculate_calorie/dinner.dart';
import 'package:saglikliyasam/views/bottom_tabs/calculate_calorie/drinks.dart';
import 'package:saglikliyasam/views/bottom_tabs/calculate_calorie/fruits.dart';
import 'package:saglikliyasam/views/bottom_tabs/calculate_calorie/lunch.dart';
import 'package:saglikliyasam/views/bottom_tabs/calculate_calorie/snack.dart';

class CalculateCalorie extends StatefulWidget {
  const CalculateCalorie({Key? key}) : super(key: key);

  @override
  State<CalculateCalorie> createState() => _CalculateCalorieState();
}

class _CalculateCalorieState extends State<CalculateCalorie> {
  List<Color> colorList = [
    Color(0xFF5EC27A),
    Color(0xFF00B498),
    Color(0xFF00A1B0),
    Color(0xFF008CBA),
    Color(0xFF0073B1),
    Color(0xFF535997),
    Color(0xFF747496),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Kalori Hesapla'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ///Breakfast
          BouncingWidget(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Breakfast()));
              },
              child: foodCard('Kahvaltılıklar', colorList[0])),
          ///Lunch
          BouncingWidget(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Lunch()));
              },
              child: foodCard('Öğle Yemeği', colorList[1])),
          ///Snack
          BouncingWidget(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Snack()));
              },
              child: foodCard('Ara Öğün', colorList[2])),
          ///Dinner
          BouncingWidget(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dinner()));
              },
              child: foodCard('Akşam Yemeği', colorList[3])),
          ///Dessert
          BouncingWidget(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dessert()));
              },
              child: foodCard('Tatlılar', colorList[4])),
          ///Fruits
          BouncingWidget(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Fruits()));
              },
              child: foodCard('Meyveler', colorList[5])),
          ///Drinks
          BouncingWidget(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Drinks()));
              },
              child: foodCard('İçecekler', colorList[6])),
        ],
      ),
    );
  }

  Widget foodCard(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Card(
        color: color,
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
