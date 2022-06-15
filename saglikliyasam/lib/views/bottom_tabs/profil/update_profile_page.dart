import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../helpers/file_utils.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  var nameController = TextEditingController();
  var mailController = TextEditingController();


  Future<void> updateProfile(String name, String mail)async {
    String userDocId = await FileUtils.readFromFile();
    await FirebaseFirestore.instance.collection("users").doc(userDocId).update({
      'name' : name,
      'mail' : mail
    });
    final snackBar = SnackBar(
      content: const Text('Profil başarıyla güncellendi'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pop(context);
  }

  Future<void> getUserInfo()async{
    String userDocId = await FileUtils.readFromFile();
    var user = await FirebaseFirestore.instance.collection("users").doc(userDocId).get();
    nameController.text =  user.data()!['name'];
    mailController.text =  user.data()!['mail'];
  }

  @override
  void initState() {
    Future.delayed(Duration.zero,() async {
      getUserInfo();
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Güncelle'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:40,right: 20,left: 20,bottom: 20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Ad Soyad',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: mailController,
              decoration: InputDecoration(
                  hintText: 'E-Posta',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: (){
                  updateProfile(nameController.text, mailController.text);
                },
                child: Center(
                  child: Text('Güncelle',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),)
            )
          ],
        ),
      ),
    );
  }
}
