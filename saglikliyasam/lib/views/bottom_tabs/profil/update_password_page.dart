import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../helpers/file_utils.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  updateUserPassword(String oldPassword,String newPassword)async{
    String userDocId = await FileUtils.readFromFile();
    var user= await FirebaseFirestore.instance.collection("users").doc(userDocId).get();
    String password = user.data()!['password'];
    if(oldPassword == password){
      var user = await FirebaseFirestore.instance.collection('users').doc(userDocId).update({
        'password': newPassword
      });
      final snackBar = SnackBar(
        content: const Text('Şifre başarıyla güncellendi'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    }
    else{
      final snackBar = SnackBar(
        content: const Text('Eski şifre yanlış'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Güncelle'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:40,right: 20,left: 20,bottom: 20),
        child: Column(
          children: [
            TextField(
              controller: oldPasswordController,
              decoration: InputDecoration(
                  hintText: 'Eski Şifre',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(
                  hintText: 'Yeni Şifre',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: (){
                  updateUserPassword(oldPasswordController.text, newPasswordController.text);
                },
                child: Center(
                  child: Text('Şifre Güncelle',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),)
            )
          ],
        ),
      ),
    );
  }
}
