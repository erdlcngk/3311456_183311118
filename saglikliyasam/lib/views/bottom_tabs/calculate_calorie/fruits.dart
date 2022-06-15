import 'package:flutter/material.dart';

class Fruits extends StatefulWidget {
  const Fruits({Key? key}) : super(key: key);

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {

  var elmaController = TextEditingController();
  var armutController = TextEditingController();
  var ananasController = TextEditingController();
  var muzController = TextEditingController();
  var mandalinaController = TextEditingController();
  var karpuzController = TextEditingController();

  int calcElma = 0;
  int calcArmut = 0;
  int calcAnanas = 0;
  int calcMuz = 0;
  int calcMandalina = 0;
  int calcKarpuz = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meyveler'),
        centerTitle: true,
        backgroundColor: Color(0xFF535997),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ///Elma
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Elma (1 adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: elmaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value=='') {
                      setState(() {
                        calcElma = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcElma = int.parse(value) * 47;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Armut
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Armut (1 adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: armutController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcArmut = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcArmut = int.parse(value) * 114;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Ananas
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ananas (1 dilim)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: ananasController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcAnanas = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcAnanas = int.parse(value) * 40;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Muz
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Muz (1 adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: muzController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcMuz = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcMuz = int.parse(value) * 151;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Mandalina
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mandalina (1 adet)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: mandalinaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcMandalina = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcMandalina = int.parse(value) * 66;
                      });
                    }
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

          ///Karpuz
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Karpuz (1 dilim)'),
              Container(
                width: 40,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: karpuzController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        calcKarpuz = 0;
                      });
                    }
                    else{
                      setState(() {
                        calcKarpuz = int.parse(value) * 105;
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
            color: Color(0xFF535997),
            child: Center(
              child: Text(
                'Toplan kalori : ' +
                    (calcElma +
                        calcArmut +
                        calcAnanas +
                        calcMuz +
                        calcMandalina +
                        calcKarpuz)
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
