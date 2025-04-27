import 'package:flutter/material.dart';

class Stream_page extends StatefulWidget {
  const Stream_page({super.key});

  @override
  State<Stream_page> createState() => _Stream_pageState();
}

  class _Stream_pageState extends State<Stream_page> {

    
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streambuider',style: TextStyle(fontSize: 30,
        fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body:Center(child: Text('DKJNCIVI'),)

    );
  }
}