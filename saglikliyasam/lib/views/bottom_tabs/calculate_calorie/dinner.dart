import 'package:flutter/material.dart';

class Dinner extends StatefulWidget {
  const Dinner({Key? key}) : super(key: key);

  @override
  State<Dinner> createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {

  var riceController = TextEditingController();
  var beanController = TextEditingController();
  var karniyarikController = TextEditingController();
  var sarmaController = TextEditingController();
  var mercimekSoupController = TextEditingController();
  var ezogelinSoupController = TextEditingController();

  int calculatedRice = 0;
  int calculatedBean = 0;
  int calculatedKarniyarik = 0;
  int calculatedSarma = 0;
  int calculatedMercimek = 0;
  int calculatedEzogelin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ara Öğün'),
        centerTitle: true,
        backgroundColor: Color(0xFF008CBA),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ///pilav
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pirinç pilavı (küçük kase)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: riceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value=='') {
                      setState(() {
                        calculatedRice = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedRice = int.parse(value) * 133;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///fasulye
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Etsiz kuru fasulye (275 gram)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: beanController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calculatedBean = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedBean = int.parse(value) * 267;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///karnıyarık
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Karnıyarık (1 adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: karniyarikController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calculatedKarniyarik = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedKarniyarik = int.parse(value) * 97;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///sarma
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sarma (4 adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: sarmaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calculatedSarma = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedSarma = int.parse(value) * 125;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///mercimek çorbası
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mercimek Çorbası (1 kepçe)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: mercimekSoupController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calculatedMercimek = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedMercimek = int.parse(value) * 69;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///ezogelin çorbası
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ezogelin çorbası (1 kepçe)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: ezogelinSoupController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calculatedEzogelin = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedEzogelin = int.parse(value) * 255;
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
            color: Color(0xFF008CBA),
            child: Center(
              child: Text(
                'Toplan kalori : ' +
                    (calculatedRice +
                        calculatedBean +
                        calculatedKarniyarik +
                        calculatedSarma +
                        calculatedMercimek +
                        calculatedEzogelin)
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
