import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saglikliyasam/helpers/file_utils.dart';
import 'package:saglikliyasam/views/bottom_tabs/profil/update_password_page.dart';
import 'package:saglikliyasam/views/bottom_tabs/profil/update_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String name ="";
  String mail ="";
  late String userDocId;

  Future<void> getUserInfo()async{
    var user = await FirebaseFirestore.instance.collection('users').doc(userDocId).get();
    setState(() {
      name = user.data()!['name'];
      mail = user.data()!['mail'];
    });

  }

  @override
  void initState() {
    Future.delayed(Duration.zero,() async {
      userDocId = await FileUtils.readFromFile();
      getUserInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle:  true,
          title: Text('Profil'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green
                  ),
                  child: Text("Sağlıklı Yaşam",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                )
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfilePage()));
              },
              title: Text("Profil Güncelle"),
            ),
            Divider(),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePasswordPage()));
              },
              title: Text("Şifre Güncelle"),
            ),
            Divider(),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/avatar.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          Divider(),
          ListTile(
            onLongPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfilePage()));
            },
            title: Text('Ad Soyad'),
            subtitle: Text(name),
          ),
          Divider(),
          ListTile(
            onLongPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfilePage()));
            },
            title: Text('E-posta'),
            subtitle: Text(mail),
          ),
          Divider(),
        ],
      )
    );
  }

}
