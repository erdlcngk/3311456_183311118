import 'package:flutter/material.dart';
import 'package:saglikliyasam/helpers/file_utils.dart';

class WaterCounterPage extends StatefulWidget {
  const WaterCounterPage({Key? key}) : super(key: key);

  @override
  State<WaterCounterPage> createState() => _WaterCounterPageState();
}

class _WaterCounterPageState extends State<WaterCounterPage> {

  var decreaseButtonColor = Color(0xFF5EC27A);
  var resetButtonColor = Color(0xFF5EC27A);
  var increaseButtonColor = Color(0xFF5EC27A);
  String waterCount = "0";


  @override
  void initState() {
    Future.delayed(Duration.zero,() async {
      String counter = await FileUtilsWater.readFromFileWater();
      if(counter==""){
        setState((){
          waterCount="0";
        });
      }
      else{
        setState((){
          waterCount = counter;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Su Sayacı"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              waterCount.toString(),
              style: TextStyle(color: Colors.green,fontSize: 55,fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(width: 20),
              ///Decrease button
              Expanded(
                  child: GestureDetector(
                    onTap: ()async{
                      if(int.parse(waterCount)>0){
                        setState((){
                          decreaseButtonColor = Color(0xFF747496);
                          waterCount = (int.parse(waterCount)-1).toString();
                        });
                        await FileUtilsWater.saveToFileWater(waterCount);
                        Future.delayed(Duration(milliseconds: 400),(){
                          setState((){
                            decreaseButtonColor = Color(0xFF5EC27A);
                          });
                        });
                      }

                    },
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 400),
                      height: 50,
                      decoration: BoxDecoration(
                        color: decreaseButtonColor,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: FittedBox(child: Text("-",style: TextStyle(color: Colors.white),)),
                    ),
                  )
              ),
              SizedBox(width: 20),
              ///Reset button
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        resetButtonColor = Color(0xFF747496);
                      });
                      Future.delayed(Duration(milliseconds: 400),(){
                        setState((){
                          resetButtonColor = Color(0xFF5EC27A);
                        });
                      });
                      showResetDialog();
                    },
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 400),
                      height: 50,
                      decoration: BoxDecoration(
                          color: resetButtonColor,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Icon(Icons.refresh,color: Colors.white,),
                    ),
                  )
              ),
              SizedBox(width: 20),
              ///Increase button
              Expanded(
                  child: GestureDetector(
                    onTap: ()async{
                      setState((){
                        increaseButtonColor = Color(0xFF747496);
                        waterCount = (int.parse(waterCount)+1).toString();
                      });
                      await FileUtilsWater.saveToFileWater(waterCount);
                      Future.delayed(Duration(milliseconds: 400),(){
                        setState((){
                          increaseButtonColor = Color(0xFF5EC27A);
                        });
                      });

                    },
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 400),
                      height: 50,
                      decoration: BoxDecoration(
                          color: increaseButtonColor,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: FittedBox(child: Text("+",style: TextStyle(color: Colors.white),)),
                    ),
                  )
              ),
              SizedBox(width: 20),
            ],
          )
        ],
      ),
    );
  }


  showResetDialog(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text(
              "Sayacı sıfırlamak istiyor musunuz?",
              style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  onPressed: (){
                      Navigator.pop(context);
                  },
                  child: Text("Geri",style: TextStyle(color: Colors.grey),)
              ),
              TextButton(
                  onPressed: ()async{
                    await FileUtilsWater.saveToFileWater("0");
                    setState((){
                      waterCount = "0";
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Sıfırla")
              ),
            ],
          );
        }
    );
  }

}
