import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Stream_page extends StatefulWidget {
  const Stream_page({super.key});

  @override
  State<Stream_page> createState() => _Stream_pageState();
}

  class _Stream_pageState extends State<Stream_page> {
    List comments = [];
     Future<void> commentsApi()async{
      final Response = await http.get(Uri.parse('https://dummyjson.com/comments'));
      if(Response.statusCode == 200){
        comments = jsonDecode(Response.body)['comments'];
        setState(() {
          
        });
      }else{
         print('Failed to load comments');
      }

    }
    
    @override
    void initState() {
    // TODO: implement initState
    super.initState();
    commentsApi();
  }
    
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streambuider',style: TextStyle(fontSize: 30,
        fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: comments.isEmpty
      ?Center(child: CircularProgressIndicator(
        color: Colors.blue,))
        :ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context,index){
          return Card(
            child: 
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  share(name: 'id ', value:comments[index]['id '].toString() ),
                  share(name: 'postId', value:comments[index]['postId'].toString() ),
                  share(name: 'likes', value:comments[index]['likes'].toString() ),
                  share(name: 'body', value:comments[index]['body']),
                   share(name: 'user', value:comments[index]['user']['id'].toString()),
                      share(name: 'username', value:comments[index]['user']['username']),
                      share(name: 'fullName', value:comments[index]['user']['fullName']),
                  
                   
                ],
              ),
            ),
          );
        })
 

    );
  }
}


class share extends StatelessWidget {
  String name;
  String value;
   share({super.key,
  required this.name,
  required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
     Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black45),),
     Text(value,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),

      ],
    );
  }
}