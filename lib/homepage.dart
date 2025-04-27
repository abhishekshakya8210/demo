import 'package:demo/logic.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List value = [12, 15, 20, 68];
  List<bool> isSelected = [true,false,false,false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Building'),
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(value.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        for(int i=0; i<isSelected.length; i++){
                          isSelected[i]=false;
                        };
                        isSelected[index] =true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 70,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected[index]? Colors.deepPurple:Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          value[index].toString(),
                          style: TextStyle(color:isSelected[index]?Colors.white:
                           Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  );
                }),
                       ],
            ),
          ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Logic()));
            },
         style:    ElevatedButton.styleFrom(fixedSize: Size(350, 60),
         elevation: 5,shadowColor: Colors.black,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.blue),
             child: Text('click me',style: TextStyle(fontSize: 25,color: Colors.white,),))
 
        ],
      ),
    );
  }
}
