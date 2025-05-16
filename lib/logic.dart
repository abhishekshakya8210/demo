import 'package:demo/get.dart';
import 'package:demo/hard.dart';
import 'package:demo/image.dart';
import 'package:demo/login.dart';
import 'package:demo/nav.dart';
import 'package:demo/otp_page.dart';
import 'package:demo/practice..dart';
import 'package:demo/stream.dart';
import 'package:flutter/material.dart';

class Logic extends StatefulWidget {
  const Logic({super.key});

  @override
  State<Logic> createState() => _LogicState();
}

class _LogicState extends State<Logic> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Item",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            
            children: [
                  SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 65),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5), child: Text('List API',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
              SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Get()));
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 65),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5), child: Text('photo 500 API',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
                 SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Hard()));
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 65),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5), child: Text('Hard API',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
           
              SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Photo()));
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 65),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5), child: Text('photo API',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
               SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Practice()));
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 65),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5), child: Text('practice API',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
           SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Stream_page()));
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 65),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5), child: Text('stream builder',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
               SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage()));
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 65),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5), child: Text('OTP page',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
               SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Nav()));
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 65),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5), child: Text('NavBar',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),))
          
          
           
           
            
            ],
          ),
        ),
      ),
    );
  }
}
