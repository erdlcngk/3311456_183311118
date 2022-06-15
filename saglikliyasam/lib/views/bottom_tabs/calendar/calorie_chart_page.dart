import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CalorieChartPage extends StatefulWidget {
  const CalorieChartPage({Key? key}) : super(key: key);

  @override
  State<CalorieChartPage> createState() => _CalorieChartPageState();
}

class _CalorieChartPageState extends State<CalorieChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grafikler"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 300,
              height: 300,
              child: PieChart(
                PieChartData(
                    startDegreeOffset: -100,
                    sectionsSpace: 2,
                    //centerSpaceRadius: 0,
                    sections: [
                      ///January
                      PieChartSectionData(
                          value: 1000,
                          title: '1000',
                          color: Color(0xFF845EC2)
                      ),

                      ///February
                      PieChartSectionData(
                          value: 1500,
                          title: '1500',
                          color: Color(0xFFD65DB1)
                      ),

                      ///March
                      PieChartSectionData(
                          value: 2000,
                          title: '2000',
                          color: Color(0xFFFF6F91)),

                      ///April
                      PieChartSectionData(
                          value: 1000,
                          title: '1000',
                          color: Color(0xFFFF9671)),

                      ///May
                      PieChartSectionData(
                          value: 1500,
                          title: '1500',
                          color: Color(0xFFFFC75F)),

                      ///June
                      PieChartSectionData(
                          value: 2000,
                          title: '2000',
                          color: Color(0xFFF9F871)),

                      ///July
                      PieChartSectionData(
                          value: 1000,
                          title: '1000',
                          color: Color(0xFFB39CD0)),

                      ///August
                      PieChartSectionData(
                          value: 1500,
                          title: '1500',
                          color: Color(0xFFFBEAFF)),

                      ///September
                      PieChartSectionData(
                          value: 2000,
                          title: '2000',
                          color: Color(0xFF00C9A7)),

                      ///October
                      PieChartSectionData(
                          value: 1000,
                          title: '1000',
                          color: Color(0xFFC34A36)),

                      ///November
                      PieChartSectionData(
                          value: 1500,
                          title: '1500',
                          color: Color(0xFFD5CABD)),

                      ///December
                      PieChartSectionData(
                          value: 2000,
                          title: '2000',
                          color: Color(0xFFD8EFF8),

                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(height: 40),
          ///January
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFF845EC2),
              ),
              SizedBox(width: 10),
              Text('Ocak')
            ],
          ),
          SizedBox(height: 10),
          ///February
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFFD65DB1),
              ),
              SizedBox(width: 10),
              Text('Şubat')
            ],
          ),
          SizedBox(height: 10),
          ///March
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFFFF6F91),
              ),
              SizedBox(width: 10),
              Text('Mart')
            ],
          ),
          SizedBox(height: 10),
          ///April
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFFFF9671),
              ),
              SizedBox(width: 10),
              Text('Nisan')
            ],
          ),
          SizedBox(height: 10),
          ///May
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFFFFC75F),
              ),
              SizedBox(width: 10),
              Text('Mayıs')
            ],
          ),
          SizedBox(height: 10),
          ///June
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFFF9F871),
              ),
              SizedBox(width: 10),
              Text('Haziran')
            ],
          ),
          SizedBox(height: 10),
          ///July
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFFB39CD0),
              ),
              SizedBox(width: 10),
              Text('Temmuz')
            ],
          ),
          SizedBox(height: 10),
          ///August
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFFFBEAFF),
              ),
              SizedBox(width: 10),
              Text('Ağustos')
            ],
          ),
          SizedBox(height: 10),
          ///September
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFF00C9A7),
              ),
              SizedBox(width: 10),
              Text('Eylül')
            ],
          ),
          SizedBox(height: 10),
          ///October
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFFC34A36),
              ),
              SizedBox(width: 10),
              Text('Ekim')
            ],
          ),
          SizedBox(height: 10),
          ///November
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFFD5CABD),
              ),
              SizedBox(width: 10),
              Text('Kasım')
            ],
          ),
          SizedBox(height: 10),
          ///December
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Color(0xFFD8EFF8),
              ),
              SizedBox(width: 10),
              Text('Aralık')
            ],
          ),
        ],
      ),
    );
  }
}
