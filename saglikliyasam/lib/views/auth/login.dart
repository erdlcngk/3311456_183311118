import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saglikliyasam/helpers/file_utils.dart';
import 'package:saglikliyasam/views/auth/register.dart';
import 'package:saglikliyasam/views/bottom_tabs/bottom_tabs.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var mailController = TextEditingController();
  var passwordController = TextEditingController();
  bool passwordVisibility = true;

  Future<void> checkUser(String mail, String password) async{
    var user= await FirebaseFirestore.instance.collection("users").where("mail",isEqualTo: mail).get();
    if(user.docs.isNotEmpty)
    {
      user.docs.forEach((element)
      {
        if(password==element["password"])
        {
          FileUtils.saveToFile(element.id);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomTabs()));
        }
        else{
          final snackBar = SnackBar(
            content: const Text('E-posta ve şifrenizi kontrol ediniz'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
    else{
      final snackBar = SnackBar(
        content: const Text('E-posta ve şifrenizi kontrol ediniz'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.fitHeight
            )
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top:250,right: 20,left: 20,bottom: 20),
            child: ListView(
              children: [
                TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'E-Posta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: passwordVisibility,
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){
                          setState((){
                            passwordVisibility = !passwordVisibility;
                          });
                      },
                      icon: Icon(Icons.visibility),
                    ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Şifre',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                      },
                      child: Text('Hesap Oluştur',style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: (){
                     checkUser(mailController.text, passwordController.text);
                    },
                    child: Center(
                      child: Text('Giriş',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),)
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

}
