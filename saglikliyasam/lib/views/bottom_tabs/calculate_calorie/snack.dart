import 'package:flutter/material.dart';

class Snack extends StatefulWidget {
  const Snack({Key? key}) : super(key: key);

  @override
  State<Snack> createState() => _SnackState();
}

class _SnackState extends State<Snack> {
  var kefirController = TextEditingController();
  var yogurtController = TextEditingController();
  var walnutController = TextEditingController();
  var almondController = TextEditingController();
  var potatoSaladController = TextEditingController();
  var russianSaladController = TextEditingController();

  int calculatedKefir = 0;
  int calculatedYogurt = 0;
  int calculatedWalnut = 0;
  int calculatedAlmond = 0;
  int calculatedPotatoSalad = 0;
  int calculatedRussianSalad = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ara Öğün'),
        centerTitle: true,
        backgroundColor: Color(0xFF00A1B0),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ///kefir
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kefir (1 su bardağı)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: kefirController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value=='') {
                      setState(() {
                        calculatedKefir = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedKefir = int.parse(value) * 105;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///yoğurt
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Yoğurt (1 kase)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: yogurtController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calculatedYogurt = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedYogurt = int.parse(value) * 122;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///ceviz
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ceviz (1 avuç)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: walnutController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calculatedWalnut = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedWalnut = int.parse(value) * 155;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///badem
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Badem (1 avuç)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: almondController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calculatedAlmond = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedAlmond = int.parse(value) * 150;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///patates salatası
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tavuk döner (adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: potatoSaladController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calculatedPotatoSalad = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedPotatoSalad = int.parse(value) * 132;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///rus salatası
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Et Döner (adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: russianSaladController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calculatedRussianSalad = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedRussianSalad = int.parse(value) * 255;
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
            color: Color(0xFF00A1B0),
            child: Center(
              child: Text(
                'Toplan kalori : ' +
                    (calculatedKefir +
                            calculatedYogurt +
                            calculatedWalnut +
                            calculatedAlmond +
                            calculatedPotatoSalad +
                            calculatedRussianSalad)
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
