import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Hard extends StatefulWidget {
  const Hard({super.key});

  @override
  State<Hard> createState() => _HardState();
}

class _HardState extends State<Hard> {
  List hard = [];
  var data;
  Future<void> hardApi()async{
  final Response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  data  = jsonDecode(Response.body.toString());
  if(Response.statusCode == 200){
    hard = jsonDecode(Response.body.toString());
    

  }else{
        return data;
  }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hard API',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(future: hardApi(), builder: (context,snapsht){
            if(snapsht.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              return ListView.builder(
                itemCount: hard.length,
                itemBuilder: (context,index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Hard1(name: 'id', value: hard[index]['id'].toString()),
                        Hard1(name: 'name', value: hard[index]['name'].toString()),
                        Hard1(name: 'username', value: hard[index]['username'].toString()),
                        Hard1(name: 'username', value: hard[index]['username'].toString()),
                        Hard1(name: 'email', value: hard[index]['email'].toString()),
                        Hard1(name: 'street', value: hard[index]['address']['street'].toString()),
                        Hard1(name: 'suite', value: hard[index]['address']['suite'].toString()),
                        Hard1(name: 'city', value: hard[index]['address']['city'].toString()),
                        Hard1(name: 'zipcode', value: hard[index]['address']['zipcode'].toString()),
                        Hard1(name: 'lat', value: hard[index]['address']['geo']['lat'].toString()),
                        Hard1(name: 'lng', value: hard[index]['address']['geo']['lng'].toString()),

                        

                    
                      ],
                    ),
                  ),
                );
              });
            }
          }))
        ],
      )
    );
  }
}




class Hard1 extends StatelessWidget {
  final String name;
  final String value;

  const Hard1({
    super.key,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return 
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween, 
         children: [
           Text(
             name,
             style: TextStyle(fontSize: 20),
           ),
           SizedBox(width: 10),
           Text(
             value,
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
           ),
         ],
       
    );
  }
}
