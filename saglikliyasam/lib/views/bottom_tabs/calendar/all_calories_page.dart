import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saglikliyasam/helpers/file_utils.dart';
import 'package:saglikliyasam/models/calorie_list_model.dart';

class AllCaloriesPage extends StatefulWidget {
  const AllCaloriesPage({Key? key}) : super(key: key);

  @override
  State<AllCaloriesPage> createState() => _AllCaloriesPageState();
}

class _AllCaloriesPageState extends State<AllCaloriesPage> {

  List<CalorieListModel> list = [];

  getCalorieListFromFireBase()async{
    String userDocId = await FileUtils.readFromFile();
    var calorieList = await FirebaseFirestore.instance.collection("users").doc(userDocId).collection("calendar").get();
    if(calorieList.docs.isNotEmpty){
      calorieList.docs.forEach((element) {
        setState((){
          list.add(
              CalorieListModel(
                  date: element.data()['date'],
                  calorie: element.data()['calorie']
              )
          );
        });
      });
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero,() async {
      getCalorieListFromFireBase();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tümü"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: list.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              title: Text(list[index].date),
              subtitle: Text(list[index].calorie),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.green
                )
              ),
            ),
          );
        }
      ),
    );
  }
}
