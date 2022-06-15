import 'package:flutter/material.dart';

class Lunch extends StatefulWidget {
  const Lunch({Key? key}) : super(key: key);

  @override
  State<Lunch> createState() => _LunchState();
}

class _LunchState extends State<Lunch> {

  var kebabController = TextEditingController();
  var saladController = TextEditingController();
  var pizzaController = TextEditingController();
  var pattyController = TextEditingController();
  var chickenRollController = TextEditingController();
  var meatRollController = TextEditingController();

  int calculatedKebab = 0;
  int calculatedSalad = 0;
  int calculatedPizza = 0;
  int calculatedPatty = 0;
  int calculatedChickenRoll = 0;
  int calculatedMeatRoll = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğle Yemeği'),
        centerTitle: true,
        backgroundColor: Color(0xFF00B498),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ///kebap
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Adana Kebap (1 şiş)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: kebabController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        calculatedKebab = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedKebab = int.parse(value) * 215;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///salata
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Çoban Salata (220 gram)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: saladController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        calculatedSalad = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedSalad = int.parse(value) * 115;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///pizza
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Karışık pizza (orta boy)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: pizzaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        calculatedPizza = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedPizza = int.parse(value) * 334;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///börek
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Su böreği (dilim)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: pattyController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        calculatedPatty = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedPatty = int.parse(value) * 183;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Tavuk döner
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tavuk döner (adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: chickenRollController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        calculatedChickenRoll = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedChickenRoll = int.parse(value) * 309;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Et Döner
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Et Döner (adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: meatRollController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      setState(() {
                        calculatedMeatRoll = 0;
                      });
                    }
                    else{
                      setState(() {
                        calculatedMeatRoll = int.parse(value) * 301;
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
            color: Color(0xFF00B498),
            child: Center(
              child: Text(
                'Toplan kalori : ' + (calculatedKebab + calculatedSalad + calculatedPizza + calculatedPatty + calculatedChickenRoll + calculatedMeatRoll).toString(),
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
