import 'package:flutter/material.dart';

class Dessert extends StatefulWidget {
  const Dessert({Key? key}) : super(key: key);

  @override
  State<Dessert> createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  var kazandibiController = TextEditingController();
  var halkaController = TextEditingController();
  var sutlacController = TextEditingController();
  var kadayifController = TextEditingController();
  var kunefeController = TextEditingController();
  var baklavaController = TextEditingController();

  int calcKazandibi = 0;
  int calcHalka = 0;
  int calcSutlac = 0;
  int calcKadafiy = 0;
  int calcKunefe = 0;
  int calcBaklava = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tatlılar'),
        centerTitle: true,
        backgroundColor: Color(0xFF0073B1),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ///Kazandibi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kazandibi (155 gram)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: kazandibiController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value=='') {
                      setState(() {
                        calcKazandibi = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcKazandibi = int.parse(value) * 201;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Halka tatli
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Halka tatlı (1 adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: halkaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcHalka = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcHalka = int.parse(value) * 329;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Sutlacc
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sütlaç (255 gram)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: sutlacController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcSutlac = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcSutlac = int.parse(value) * 266;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Kadayif
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fıstıklı Kadayıf (150 gram)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: kadayifController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcKadafiy = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcKadafiy = int.parse(value) * 382;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Künefe
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Künefe (120 gram)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: kunefeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcKunefe = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcKunefe = int.parse(value) * 426;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Baklava
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Baklava (1 adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: baklavaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcBaklava = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcBaklava = int.parse(value) * 165;
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
            color: Color(0xFF0073B1),
            child: Center(
              child: Text(
                'Toplan kalori : ' +
                    (calcKazandibi +
                        calcHalka +
                        calcSutlac +
                        calcKadafiy +
                        calcKunefe +
                        calcBaklava)
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
