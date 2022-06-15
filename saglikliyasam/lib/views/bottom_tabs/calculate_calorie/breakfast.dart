import 'package:flutter/material.dart';

class Breakfast extends StatefulWidget {
  const Breakfast({Key? key}) : super(key: key);

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {

  var cheeseController = TextEditingController();
  var eggController = TextEditingController();
  var jamController = TextEditingController();
  var oliveController = TextEditingController();
  var sausageController = TextEditingController();
  var honeyController = TextEditingController();

  int calculatedHoney = 0;
  int calculatedSausage = 0;
  int calculatedOlive = 0;
  int calculatedJam = 0;
  int calculatedEgg = 0;
  int calculatedCheese = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kahvaltılıklar'),
        centerTitle: true,
        backgroundColor: Color(0xFF5EC27A),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ///peynir
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Beyaz peynir (100 gram)'),
                Container(
                  width: 40,
                  height: 40,
                  child: TextField(
                    keyboardType: TextInputType.number,
                      controller: cheeseController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                      ),
                    onChanged: (value){
                      if(value.isEmpty){
                        setState(() {
                          calculatedCheese = 0;
                        });
                      }
                      else{
                        setState(() {
                          calculatedCheese = int.parse(value) * 263;
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          const SizedBox(height: 20),

          ///yumurta
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Haşlanmış yumurta (adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: eggController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        calculatedEgg = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedEgg = int.parse(value) * 78;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///reçel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Çilek reçeli (tatlı kaşığı)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: jamController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        calculatedJam = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedJam = int.parse(value) * 11;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///zeytin
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Yeşil zeytin (adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: oliveController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        calculatedOlive = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedOlive = int.parse(value) * 6;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///sucuk
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sucuk (50 gram)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: sausageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        calculatedSausage = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedSausage = int.parse(value) * 166;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///bal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Bal (tatlı kaşığı)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: honeyController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                        setState(() {
                          calculatedHoney = 0;
                        });
                    }
                    else{
                      setState(() {
                        calculatedHoney = int.parse(value) * 30;
                      });
                    }
                  },
                ),
              )
            ],
          ),


          const SizedBox(height: 50),
          Container(
            height: 50,
            color: Color(0xFF5EC27A),
            child: Center(
              child: Text(
                  'Toplam kalori : ' + (calculatedHoney + calculatedSausage + calculatedOlive + calculatedJam + calculatedEgg + calculatedCheese).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
