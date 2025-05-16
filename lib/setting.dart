import 'dart:async';

import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int value = 0;
  double index = 0.1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      value++;
      setState(() {
        
      });
    },);
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
       appBar: AppBar(
        title: const Text(
          'Settingpage',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: const [
          Icon(Icons.five_g_rounded, size: 40, color: Colors.white),
        ],
      ),
     backgroundColor: Colors.black,
       body:Center(child:
       Column(
         children: [
            
          SizedBox(height: 100,),
           Text("${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}"
           ,style: TextStyle(fontSize: 40,color:Colors.red),),
           Text(value.toString(),style: TextStyle(fontSize: 40,color:Colors.blue),),
            Slider(
              min: 0,
              max: 1,
              value: index,
              onChanged: (value) {
                setState(() {
                  index = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                    
                      height: 80,
                      color: Colors.green.withOpacity(index),
                      child: Center(child: Text('container 1'),),
                    ),
                  ),
                   Expanded(
                    child: Container(
                    
                      height: 80,
                      color: Colors.red.withOpacity(index),
                      child: Center(child: Text('container 2'),),
                    ),
                  ),
                ],
              ),
            ),
         ],
       )
       ),
    );
  }
}