import 'package:flutter/material.dart';

class Drinks extends StatefulWidget {
  const Drinks({Key? key}) : super(key: key);

  @override
  State<Drinks> createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {

  var ayranController = TextEditingController();
  var kolaController = TextEditingController();
  var kahveController = TextEditingController();
  var madenSuyuController = TextEditingController();
  var portakalSuyuController = TextEditingController();
  var yesilCalController = TextEditingController();

  int calcAyran = 0;
  int calcKola = 0;
  int calcKahve = 0;
  int calcMadenSuyu = 0;
  int calcPortakalSuyu = 0;
  int calcYesilCay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İçecekler'),
        centerTitle: true,
        backgroundColor: Color(0xFF747496),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ///Ayran
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ayran (1 su bardağı)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: ayranController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value=='') {
                      setState(() {
                        calcAyran = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcAyran = int.parse(value) * 75;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Kola
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kola (1 su bardağı)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: kolaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcKola = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcKola = int.parse(value) * 90;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Türk Kahvesi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Türk Kahvesi (1 fincan)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: kahveController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcKahve = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcKahve = int.parse(value) * 7;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Maden Suyu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Maden Suyu (1 su bardağı)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: madenSuyuController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcMadenSuyu = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcMadenSuyu = int.parse(value) * 0;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Portakal Suyu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Portakal Suyu (1 su bardağı)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: portakalSuyuController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcPortakalSuyu = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcPortakalSuyu = int.parse(value) * 120;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Yesil Cay
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Yesil Cay (1 fincan)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: yesilCalController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcYesilCay = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcYesilCay = int.parse(value) * 0;
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
            color: Color(0xFF747496),
            child: Center(
              child: Text(
                'Toplan kalori : ' +
                    (calcAyran +
                        calcKola +
                        calcKahve +
                        calcMadenSuyu +
                        calcPortakalSuyu +
                        calcYesilCay)
                        .toString(),
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
