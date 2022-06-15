import 'package:flutter/material.dart';
import 'package:saglikliyasam/helpers/api_helper.dart';
import 'package:saglikliyasam/views/bottom_tabs/calendar/calendar_page.dart';
import 'package:saglikliyasam/views/bottom_tabs/notes_page/notes_page.dart';
import 'package:saglikliyasam/views/bottom_tabs/profil/profile_page.dart';
import 'package:saglikliyasam/views/bottom_tabs/water_counter/water_counter_page.dart';

import 'calculate_calorie/calculate_calorie.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int selectedPageIndex = 0;
  List<Widget> pageList = [
    CalculateCalorie(),
    CalendarPage(),
    WaterCounterPage(),
    NotesPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedPageIndex,
        items: const[
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Kalori Hesapla'
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Takvim'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.water),
              label: 'Sayaç'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_add),
              label: 'Notlar'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil'
          )
        ],
        onTap: (index){
          ApiHelper.getTodoListFromAPI();
          setState(() {
            selectedPageIndex = index;
          });
        },
      ),
    );
  }
}
