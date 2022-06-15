import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var passwordController = TextEditingController();

  bool agreementIsChecked = false;

  registerUser(String name, String mail, String password)async{
    if(name.isEmpty || mail.isEmpty || password.isEmpty){
      final snackBar = SnackBar(
        content: const Text('Bütün alanları giriniz'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'mail': 'mail',
        'password': password,
      });
      final snackBar = SnackBar(
        content: const Text('Kayıt başarıyla oluşturuldu'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Oluştur'),
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
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Şifre',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                RichText(
                  text: const TextSpan(
                    text: '',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                       TextSpan(
                          text: 'Gizlilik Sözleşmesini',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 17)),
                       TextSpan(text: ' onaylıyorum',style: TextStyle(fontSize: 17,color: Colors.black)),
                    ],
                  ),
                ),
                Checkbox(
                    value: agreementIsChecked,
                    onChanged: (value){
                      setState((){
                        agreementIsChecked = value!;
                      });
                    }
                )
              ],
            ),
            Spacer(),
            Visibility(
              visible: agreementIsChecked,
              child: ElevatedButton(
                  onPressed: (){
                      registerUser(nameController.text, mailController.text, passwordController.text);
                      // Navigator.pop(context);
                  },
                  child: Center(
                    child: Text('Kayıt Ol',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),)
              ),
            )
          ],
        ),
      ),
    );
  }
}
