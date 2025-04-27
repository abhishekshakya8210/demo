import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  List Practice = [];
  Future<void> practiceApi()async{
  final Response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=1'));
  if(Response.statusCode == 200){
    Practice = jsonDecode(Response.body);
    setState(() {
      
    });
  }
  }
  @override
  void initState() {
    super.initState();
    practiceApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('practice API',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body:Practice.isEmpty
      ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
        itemCount: Practice.length,
        itemBuilder: (context,index){
        return Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,child: Icon(Icons.person,size: 50,color: Colors.white,),
                  ),
                ),
                Text(Practice[index]['postId'].toString(),style: TextStyle(fontSize: 20,color: Colors.blue),),
                Text(Practice[index]['id'].toString(),style: TextStyle(fontSize: 20,color: Colors.red),),
                Text(Practice[index]['email'],style: TextStyle(fontSize: 20,color: Colors.red),),
                   Text(Practice[index]['name'],style: TextStyle(fontSize: 20,color: Colors.blue),), 
                      Text(Practice[index]['body'],style: TextStyle(fontSize: 20,color: Colors.pink),),
              ],
            ),
          ),
        );
      })
    );
  }
}