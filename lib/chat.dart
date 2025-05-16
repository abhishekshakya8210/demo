import 'package:demo/count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Chat extends StatefulWidget{
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chatpage',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: const [
          Icon(Icons.five_g_rounded, size: 40, color: Colors.white),
        ]
      ),
      body: Center(
        child:Column(
          
          children: [
          Text(ChatProvider().count.toString(),style: TextStyle(fontSize: 40,color: Colors.blue),),
          FloatingActionButton(onPressed: (){
            chatProvider.setCount();
          }, child: Icon(Icons.add,size: 30,color: Colors.blue,),)       
          ],
        ),
      )
    );
  }
}